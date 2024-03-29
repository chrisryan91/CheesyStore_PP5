from django.conf import settings
from django.http import HttpResponse
from django.views.decorators.http import require_POST
from django.views.decorators.csrf import csrf_exempt

from checkout.webhook_handler import StripeWH_Handler

# Import Stripe for processing payments.
import stripe

# Decorators to ensure this view can only be accessed via POST and is exempt from CSRF verification.
@require_POST
@csrf_exempt
def webhook(request):
    # Get the Webhook secret and Stripe secret key from Django settings.
    wh_secret = settings.STRIPE_WH_SECRET
    stripe_secret_key = settings.STRIPE_SECRET_KEY

    # Set the Stripe API key
    stripe.api_key = stripe_secret_key

    # Get the payload from the incoming request and the Stripe signature from the request headers.
    payload = request.body
    sig_header = request.META['HTTP_STRIPE_SIGNATURE']
    event = None

    try:
        # Construct the event using the library function to validate and parse the request.
        event = stripe.Webhook.construct_event(
        payload, sig_header, wh_secret
        )
    except ValueError as e:
        # If the payload is invalid return 400 error.
        return HttpResponse(status=400)
    except stripe.error.SignatureVerificationError as e:
        # If the signature verification fails also return 400 error.
        return HttpResponse(status=400)
    except Exception as e:
        # For any other exceptions also return 400 error.
        return HttpResponse(content=e, status=400)

    # Instantiate the handler class that contains methods for handling different event types.
    handler = StripeWH_Handler(request)

    # A mapping of event types to the handler methods.
    event_map = {
        'payment_intent.succeeded': handler.handle_payment_intent_succeeded,
        'payment_intent.payment_failed': handler.handle_payment_intent_payment_failed,
    }

    # Get the event type from the Stripe event.
    event_type = event['type']
    # Fetch the corresponding event handler from the map and default to generic handler if not found.
    event_handler = event_map.get(event_type, handler.handle_event)

    # Call the event handler with the event object and return its response
    response = event_handler(event)
    return response
