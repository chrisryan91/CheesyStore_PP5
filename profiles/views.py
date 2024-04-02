from django.shortcuts import render, get_object_or_404
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from .models import UserProfile
from .forms import UserProfileForm

from checkout.models import Order

# Decorator ensures that only logged-in users can access the profile view.
@login_required
def profile(request):

    # Retrieve the UserProfile instance for the current user or return 404
    profile = get_object_or_404(UserProfile, user=request.user)

    # Form submission handler
    if request.method == 'POST':
        # Add existing UserProfile data as POST data to the form.
        form = UserProfileForm(request.POST, instance=profile)
        if form.is_valid():
            # Save the form is data is valid and provide success message.
            form.save()
            messages.info(request, 'Updated profile successfully!')
        else:
            # Provide error messages if form is not valid.
            messages.error(request, 'Update Failed. Is form valid?')
    else:
        # If not a POST request, display the form with existing profile info.
        form = UserProfileForm(instance=profile)

    # Get all orders from the profile.
    orders = profile.orders.all()

    template = 'profiles/profile.html'
    context = {
        'form': form,
        'orders': orders,
        'on_profile_page': True
    }

    # Render and return the profile page with context data.
    return render(request, template, context)

def order_history(request, order_number):

    # Retrieve the Order instance with the given order_number or return 404.
    order = get_object_or_404(Order, order_number=order_number)

    # Display an informational message about the order history.
    messages.info(request, (
        f'This is a past confirmation for order number {order_number}'
        'A confirmation email was sent on the order date.'
    ))

    # Define the template and context for profile page.
    template = 'checkout/checkout_success.html'
    context = {
        'order': order,
    }

    # Render and return the order history for the profile.
    return render(request, template, context)