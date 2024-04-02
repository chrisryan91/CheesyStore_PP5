import json
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import render, redirect, reverse, get_object_or_404
from django.http import JsonResponse
from django.views import View
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db.models import Q, Avg
from django.db.models.functions import Lower

from .models import Product, Category, CheeseType, Origin, Rating
from .forms import ProductForms

# A view to display products in their entirety or based on request parameters.
def all_products(request):

    # Start with all products.
    products = Product.objects.all()
    query = None
    categories = None
    cheesetypes = None
    origins = None
    sort = None
    direction = None

    # Handle sorting and filtering based on query parameters.
    if request.GET:

        # Sorting functionality.
        if 'sort' in request.GET:
            if 'sort' in request.GET:
                sortkey = request.GET['sort']
                sort = sortkey
                if sortkey == 'name':
                    sortkey = 'lower_name'
                    products = products.annotate(lower_name=Lower('name'))

                if sortkey == 'category':
                    sortkey == 'category__name'

                if 'direction' in request.GET:
                    direction = request.GET['direction']
                    if direction == 'desc':
                        sortkey = f'-{sortkey}'
                
                products = products.order_by(sortkey)

        print(request.GET)

        # Filtering by category, cheesetype or origin.
        if 'category' in request.GET:
            categories = request.GET['category'].split(',')
            products = products.filter(category__name__in=categories)
            categories = Category.objects.filter(name__in=categories)

        if 'cheesytype' in request.GET:
            cheesetypes = request.GET['cheesytype'].split(',')
            products = products.filter(cheesetype__name__in=cheesetypes)
            cheesetypes = CheeseType.objects.filter(name__in=cheesetypes)

        if 'origin' in request.GET:
            origins = request.GET['origin'].split(',')
            products = products.filter(origin__name__in=origins)
            origins = Origin.objects.filter(name__in=origins)

        # Search functionality.
        if 'q' in request.GET:
            query = request.GET['q']
            if not query:
                messages.error(request, "You didn't enter any search criteria!")
                return redirect(reverse('products'))
            
            queries = Q(name__icontains=query) | Q(description__icontains=query)
            products = products.filter(queries)

    # Implement pagination.
    paginator = Paginator(products, 18)
    page = request.GET.get('page')
    try:
        products = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an interget, show first page.
        products = paginator.page(1)
    except EmptyPage:
        # If page is out of range, show last page.
        products = paginator.page(paginator.num_pages)

    # Prepare the context for the template and it's sorting. 
    current_sorting = f'{sort}_{direction}'
    context = {
        'products': products,
        'search_term': query,
        'current_categories': categories,
        'current_cheesetypes': cheesetypes,
        'current_origins': origins,
        'current_sorting': current_sorting,
    }

    # Render the template with the context.    
    return render(request, 'products/products.html', context)

# A view for displaying the details of a specific product.
def product_detail(request, product_id):
    product = get_object_or_404(Product, pk=product_id)
    user_rating = None
    if request.user.is_authenticated:
        # Try to get the existing rating for this user and product
        rating_query = Rating.objects.filter(product=product, user=request.user).first()
        if rating_query:
            user_rating = rating_query.stars
    return render(request, 'products/product_detail.html', {'product': product, 'user_rating': user_rating})

# A view to add a product with a decorator to restrict access to superusers.
@login_required
def add_product(request):

    if not request.user.is_superuser:
        
        # Return error message is user is not a superuser.
        messages.error(request, 'Sorry only store owners can do that')
        return redirect(reverse('home'))

    if request.method == 'POST':
        form = ProductForms(request.POST, request.FILES)
        if form.is_valid():
            # Save the form if it is valid and provide success message.
            product = form.save()
            messages.info(request, 'Successfully added product!')
            return redirect(reverse('product_detail', args=[product.id]))
        else:
            # Return error message otherwise.
            messages.error(request, 'Failed to add product!!')
    else:
        form = ProductForms()

    # Prepare template and context.
    template = 'products/add_product.html'
    context = {
        'form': form,
        'ignore_section': True,
    }

    # Return template with context.
    return render(request, template, context)


# A view to edit a product with a decorator to restrict access to superusers.
@login_required
def edit_product(request, product_id):

    # Check if the user is a superuser and return error if not.
    if not request.user.is_superuser:
        messages.error(request, 'Sorry only store owners can do that')
        return redirect(reverse('home'))

    # Show 404 error is product is not found.
    product = get_object_or_404(Product, pk=product_id)

    # Process the form data if request is POST.
    if request.method == 'POST':
        form = ProductForms(request.POST, request.FILES, instance=product)
        # Check if the form is valid and save if so.
        if form.is_valid():
            form.save()
            messages.info(request, 'Successfully updated product')
            return redirect(reverse('product_detail', args=[product.id]))
        else:
            messages.error(request, 'Failed to update product')
    else:
        # If not a POST request initialise form with product instance.
        form = ProductForms(instance=product)
        messages.info(request, f'You are editing {product.name}')

    # Define template and context
    template = 'products/edit_product.html'
    context = {
        'form': form,
        'product': product,
        'ignore_section': True,
    }

    # Render and return the template with context.
    return render(request, template, context)


# A view to edit a product with a decorator to restrict access to superusers.
@login_required
def delete_product(request, product_id):
    # Check if the user is a superuser.
    if not request.user.is_superuser:
        messages.error(request, 'Sorry only store owners can do that')
        # Redirect to homepage if not a superuser.
        return redirect(reverse('home'))

    # Return 404 error if product not found.
    product = get_object_or_404(Product, pk=product_id)

    # Delete the product if found, provide success message and redirect to list of products.
    product.delete()
    messages.info(request, 'Product Deleted!')
    return redirect(reverse('products'))

class RateProduct(View):
    def post(self, request, *args, **kwargs):
        print("called")

        if not request.user.is_authenticated:
            print("not authenticated")
            return JsonResponse({'error': 'Authentication required'}, status=401)

        # Parsing JSON data from request body
        data = json.loads(request.body)
        product_id = data.get('product_id')
        stars = data.get('stars')

        try:
            stars = int(stars)
            if stars < 1 or stars > 5:
                raise ValueError("Rating must be between 1 and 5.")
        except ValueError as e:
            return JsonResponse({'error': str(e)}, status=400)
        except TypeError:
            return JsonResponse({'error': 'Invalid input'}, status=400)

        try:
            product_id = int(product_id)
        except (ValueError, TypeError):
            return JsonResponse({'error': 'Invalid product ID'}, status=400)

        product = get_object_or_404(Product, pk=product_id)

        rating, created = Rating.objects.update_or_create(
            user=request.user, product=product,
            defaults={'stars': stars}
        )

        # Recalculate the average rating
        new_average_rating = product.ratings.aggregate(avg_rating=Avg('stars'))['avg_rating']
        product.rating = round(new_average_rating, 2) if new_average_rating is not None else None
        product.save()

        return JsonResponse({'success': 'Rating updated', 'new_average_rating': float(product.rating) if product.rating else None})
