from django.shortcuts import (
                    render,
                    redirect,
                    reverse,
                    get_object_or_404,
                    HttpResponse)
from django.views.decorators.http import require_POST
from django.contrib import messages
from django.conf import settings

from .forms import OrderForm
from .models import OrderLineItem, Order
from cheesystoreshop.models import Product
from profiles.forms import UserProfileForm
from profiles.models import UserProfile
from bag.contexts import bag_contents

import stripe
import json


@require_POST
def cache_checkout_data(request):
    # Store checkout data in PaymentIntent for use in webhook
    stripe_secret_key = settings.STRIPE_SECRET_KEY
    try:
        # Extract the PaymentIntent ID from the 'client_secret' POST parameter
        pid = request.POST.get('client_secret').split('_secret')[0]
        stripe.api_key = stripe_secret_key
        # Modify the PaymentIntent.
        stripe.PaymentIntent.modify(pid, metadata={
            'bag': json.dumps(request.session.get('bag', {})),
            'save_info': request.POST.get('save_info'),
            'username': request.user.username,
        })
        return HttpResponse(status=200)
    except Exception as e:
        # Handle errors by displaying a message and returning a 400 response
        messages.error(request, 'Sorry, your payment cannot be \
            processed right now. Please try again later.')
        return HttpResponse(content=e, status=400)


def checkout(request):
    # Handle the checkout process
    stripe_public_key = settings.STRIPE_PUBLIC_KEY
    stripe_secret_key = settings.STRIPE_SECRET_KEY

    if request.method == 'POST':
        # If form is submitted, collect form data from the POST request
        bag = request.session.get('bag', {})

        form_data = {
            # Collect all form data
            'full_name': request.POST['full_name'],
            'email': request.POST['email'],
            'phone_number': request.POST['phone_number'],
            'country': request.POST['country'],
            'postcode': request.POST['postcode'],
            'town_or_city': request.POST['town_or_city'],
            'street_address1': request.POST['street_address1'],
            'street_address2': request.POST['street_address2'],
            'county': request.POST['county'],
        }

        order_form = OrderForm(form_data)
        if order_form.is_valid():
            # If the form is valid, process the form but don't save yet
            order = order_form.save(commit=False)
            pid = request.POST.get('client_secret').split('_secret')[0]
            # Set the stripe payment ID and original bag on the order
            order.stripe_pid = pid
            order.original_bag = json.dumps(bag)
            order.save()
            for item_id, item_data in bag.items():
                try:
                    # Create order line items
                    product = Product.objects.get(id=item_id)
                    if isinstance(item_data, int):
                        # Handle single item orders
                        order_line_item = OrderLineItem(
                            order=order,
                            product=product,
                            quantity=item_data,
                        )
                        order_line_item.save()
                except Product.DoesNotExist:
                    # Handle errors such as product not found
                    messages.error(request, (
                        "One of the products in your bag wasn't found."
                        "Please call us for assistance!")
                    )
                    order.delete()
                    return redirect(reverse('view_bag'))

            # Save the info flag in session and redirect to success page
            request.session['save_info'] = 'save-info' in request.POST
            return redirect(reverse(
                'checkout_success',
                args=[order.order_number]))
        else:
            # If form is invalid, display an error message
            messages.error(request, 'There was an error with your form. \
                Please double check your information.')
    else:
        # Handle GET request
        bag = request.session.get('bag', {})
        if not bag:
            # Redirect if bag is empty
            messages.error(request, "There's nothing in your bag.")
            return redirect(reverse('products'))

        # Calculate the total for stripe and create a payment intent
        current_bag = bag_contents(request)
        total = current_bag['grand_total']
        stripe_total = round(total * 100)
        stripe.api_key = stripe_secret_key
        intent = stripe.PaymentIntent.create(
            amount=stripe_total,
            currency=settings.STRIPE_CURRENCY,
        )

        print("intent", intent)

        # Pre-fill the order form with user profile info.
        if request.user.is_authenticated:
            try:
                profile = UserProfile.objects.get(user=request.user)
                order_form = OrderForm(initial={
                    'full_name': profile.user.get_full_name(),
                    'email': profile.user.email,
                    'phone_number': profile.default_phone_number,
                    'country': profile.default_country,
                    'postcode': profile.default_postcode,
                    'town_or_city': profile.default_town_or_city,
                    'street_address1': profile.default_street_address1,
                    'street_address2': profile.default_street_address2,
                    'county': profile.default_county,
                })
            except UserProfile.DoesNotExist:
                order_form = OrderForm()
        else:
            order_form = OrderForm()

    if not stripe_public_key:
        # Warn if stripe public key is missing
        messages.warning(
            request,
            'Stripe public key is missing. Please check your configuration.')

    # Render the checkout page
    template = 'checkout/checkout.html'
    context = {
        'order_form': order_form,
        'stripe_public_key': stripe_public_key,
        'client_secret': intent.client_secret if 'intent' in locals() else None,
    }

    return render(request, template, context)


def checkout_success(request, order_number):
    # Handle successful checkout
    save_info = request.session.get('save_info')
    order = get_object_or_404(Order, order_number=order_number)

    if request.user.is_authenticated:
        # Link order to user profile and save their info if requested
        profile = UserProfile.objects.get(user=request.user)
        order.user_profile = profile
        order.save()

        if save_info:
            # Update user profile with order info
            profile_data = {
                'default_phone_number': order.phone_number,
                'default_country': order.country,
                'default_postcode': order.postcode,
                'default_town_or_city': order.town_or_city,
                'default_street_address1': order.street_address1,
                'default_street_address2': order.street_address2,
                'default_county': order.county,
            }
            user_profile_form = UserProfileForm(profile_data, instance=profile)
            if user_profile_form.is_valid():
                user_profile_form.save()

    # Display a success message and clear the bag from session
    messages.success(
                    request,
                    f'Order processed! Order number: {order_number}.')
    if 'bag' in request.session:
        del request.session['bag']

    # Render the success page
    template = 'checkout/checkout_success.html'
    context = {
        'order': order,
    }

    return render(request, template, context)
