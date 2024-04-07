from django.http import HttpResponse
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.conf import settings

from .models import Order, OrderLineItem
from cheesystoreshop.models import Product

import json
import time

# Import Stripe.
import stripe


class StripeWH_Handler:

    # Initialize with the HTTP request.
    def __init__(self, request):
        self.request = request

    # Send an email confirmation for the order.
    def _send_confirmation_email(self, order):
        # Customer's email address
        cust_email = order.email
        print(settings.DEFAULT_FROM_EMAIL)
        # Render email subject template.
        subject = render_to_string(
            'checkout/confirmation_emails/confirmation_email_subject.txt',
            {'order': order})

        # Render email body template.
        body = render_to_string(
            'checkout/confirmation_emails/confirmation_email_body.txt',
            {'order': order, 'contact_email': settings.DEFAULT_FROM_EMAIL})

        #  Send the email.
        send_mail(
            subject,
            body,
            settings.DEFAULT_FROM_EMAIL,
            [cust_email]
        )

    def handle_event(self, event):
        # Handle generic webhook events.
        return HttpResponse(
            content=f'Webhook received: {event["type"]}',
            status=200)

    def handle_payment_intent_payment_failed(self, event):
        # Handle failed payment intents.
        return HttpResponse(
            content=f'Webhook received: {event["type"]}',
            status=200)

    def handle_payment_intent_succeeded(self, event):
        # Handle successful payment intents.
        intent = event.data.object
        # Payment ID.
        pid = intent.id
        metadata = intent.metadata
        # Shopping bag from metadata.
        bag = metadata.get('bag')
        # Retrieve charge object.
        stripe_charge = stripe.Charge.retrieve(
            intent.latest_charge
        )

        # Billing details and Shipping details and Total.
        billing_details = stripe_charge.billing_details
        shipping_details = intent.shipping
        grand_total = round(stripe_charge.amount / 100, 2)

        # Clean up empty shipping details.
        for field, value in shipping_details.address.items():
            if value == "":
                shipping_details.address[field] = None

        profile = None

        order_exists = False
        attempt = 1
        while attempt <= 5:
            try:
                # Attempt to find existing order
                order = Order.objects.get(
                    full_name__iexact=shipping_details.name,
                    email__iexact=billing_details.email,
                    phone_number__iexact=shipping_details.phone,
                    country__iexact=shipping_details.address.country,
                    postcode__iexact=shipping_details.address.postal_code,
                    town_or_city__iexact=shipping_details.address.city,
                    street_address1__iexact=shipping_details.address.line1,
                    street_address2__iexact=shipping_details.address.line2,
                    county__iexact=shipping_details.address.state,
                    grand_total=grand_total,
                    original_bag=bag,
                    stripe_pid=pid,
                )
                order_exists = True
                # Exit loop if order found
                break
            except Order.DoesNotExist:
                attempt += 1
                # Wait before next attempt
                time.sleep(1)
        if order_exists:
            # If order exists send confirmation email
            self._send_confirmation_email(order)
            return HttpResponse(
                content=f'Webhook received: {event["type"]} | SUCCESS',
                status=200)
        else:
            try:
                # Create a new order if not found
                order = Order.objects.create(
                    full_name=shipping_details.name,
                    user_profile=profile,
                    email=billing_details.email,
                    phone_number=shipping_details.phone,
                    country=shipping_details.address.country,
                    postcode=shipping_details.address.postal_code,
                    town_or_city=shipping_details.address.city,
                    street_address1=shipping_details.address.line1,
                    street_address2=shipping_details.address.line2,
                    county=shipping_details.address.state,
                    original_bag=bag,
                    stripe_pid=pid,
                )
                for item_id, item_data in json.loads(bag).items():
                    # Retrieve product
                    product = Product.objects.get(id=item_id)
                    order_line_item = OrderLineItem(
                        order=order,
                        product=product,
                        quantity=item_data,
                    )
                    # Save each line item
                    order_line_item.save()
            except Exception as e:
                if order:
                    # Delete order if error occurs
                    order.delete()
                return HttpResponse(
                    content=f'Webhook received: {event["type"]} | ERROR: {e}',
                    status=500)
        # Send confirmation email for new order
        self._send_confirmation_email(order)
        return HttpResponse(
            content=f'Webhook received: {event["type"]} | Success',
            status=200)
