from django.shortcuts import render
from cheesyblog.models import Post
from cheesystoreshop.models import Product

def index(request):
    blog_posts1 = Post.objects.filter(status=1).order_by('-created_on')[:3]
    blog_posts2 = Post.objects.filter(status=1).order_by('-created_on')[:1]

    category_name = "new_arrival"
    new_arrival = Product.objects.filter(category__name=category_name).order_by('-id')[:1]

    context = {'blog_posts1': blog_posts1,
               'blog_posts2': blog_posts2,
               'new_arrival': new_arrival,}
               
    return render(request, 'home/index.html', context)