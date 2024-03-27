from django.shortcuts import render, redirect, reverse, HttpResponse, get_object_or_404
from django.contrib import messages

from cheesystoreshop.models import Product

# Displays the shopping bag page.
def view_bag(request):
    
    # Render and return the bag template.
    return render(request, 'bag/bag.html')

# Adds items to shopping bag.
def add_to_bag(request, item_id):

    product = get_object_or_404(Product, pk=item_id)

    quantity = int(request.POST.get('quantity'))
    redirect_url = request.POST.get('redirect_url')

    # Retrieve the bag from the session - or initialise it.
    bag = request.session.get('bag', {})

    # If the item exists, update it's quantity.
    if item_id in list(bag.keys()):
        bag[item_id] += quantity
        messages.success(request, f'Update {product.name} quantity to {bag[item_id]}')
    else:
        # If the item is not in the bag, add it.
        bag[item_id] = quantity
        messages.success(request, f'Added {product.name} to your bag')

    # Save Updated Bag
    request.session['bag'] = bag
    return redirect(redirect_url)

# Adjusts the quantity of items in the bag.
def adjust_bag(request, item_id):

    product = get_object_or_404(Product, pk=item_id)

    quantity = int(request.POST.get('quantity'))
    bag = request.session.get('bag', {})

    # If the new quantity is great than 0, update the quantity.
    if quantity > 0:
        bag[item_id] = quantity
        messages.success(request, f'Updated {product.name} quantity to {bag[item_id]}')
    else:
        # If the quantity is 0 then remove.
        bag.pop(item_id)
        messages.success(request, f'Removed {product.name} from bag')

    # Save the updated bag and redirect.
    request.session['bag'] = bag
    return redirect(reverse('view_bag'))


# VIew to remove item from bag.
def remove_from_bag(request, item_id):

    try:
        product = get_object_or_404(Product, pk=item_id)
        # Retrieve bag from session.
        bag = request.session.get('bag', {})

        # Remove item.
        bag.pop(item_id)
        messages.success(request, f'Removed {product.name} from bag')

        # Save the updated bag.
        request.session['bag'] = bag
        return HttpResponse(status=200)

    except Exception as e:
        # Return error if there is one.
        messages.error(request, f'Error removing item: {e}')
        return HttpResponse(status=500)