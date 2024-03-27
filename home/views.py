from django.shortcuts import render
from cheesyblog.models import Post
from cheesystoreshop.models import Product

# Views for index.html - homepage
def index(request):
    # Fetch the last three latest blog posts.
    blog_posts1 = Post.objects.filter(status=1).order_by('-created_on')[:3]

    # Fetch the latest blog post.
    blog_posts2 = Post.objects.filter(status=1).order_by('-created_on')[:1]

    # Query products in new_arrivals category.
    category_name = "new_arrival"

    # Fetch the latest arrivals.
    new_arrival = Product.objects.filter(category__name=category_name).order_by('-id')[:1]

    # Fetch the three latest arrivals.
    new_arrivals = Product.objects.filter(category__name=category_name).order_by('-id')[:3]

    context = {'blog_posts1': blog_posts1,
               'blog_posts2': blog_posts2,
               'new_arrival': new_arrival,
               'new_arrivals': new_arrivals,}
               
    # Render and return the 'home/index.html' template with context.
    return render(request, 'home/index.html', context)