from decimal import Decimal
from django.conf import settings
from django.shortcuts import get_object_or_404
from cheesystoreshop.models import Product


def bag_contents(request):

    bag_items = []
    total = 0
    product_count = 0
    # Get shopping bag from session.
    bag = request.session.get('bag', {})

    # Iterate through items in shopping bag.
    for item_id, quantity in bag.items():
        product = get_object_or_404(Product, pk=item_id)
        total += quantity * product.price
        product_count += quantity
        # Attach products to bag_items list.
        bag_items.append({
            'item_id': item_id,
            'quantity': quantity,
            'product': product,
        })

    # Determine delivery change if below the free deliver threshold.
    if total < settings.FREE_DELIVERY_THRESHOLD:
        delivery = total * Decimal(settings.STANDARD_DELIVERY_PERCENTAGE/100)
        free_delivery_delta = settings.FREE_DELIVERY_THRESHOLD - total
    else:
        delivery = 0
        free_delivery_delta = 0

    # Calculate grand total.
    grand_total = delivery + total

    # Prepare contect to be returned.
    context = {
        'bag_items': bag_items,
        'total': total,
        'product_count': product_count,
        'delivery': delivery,
        'free_delivery_delta': free_delivery_delta,
        'free_delivery_threshold': settings.FREE_DELIVERY_THRESHOLD,
        'grand_total': grand_total,
    }

    return context
