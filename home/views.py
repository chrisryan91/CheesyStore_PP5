from django.shortcuts import render
from cheesyblog.models import Post

def index(request):
    blog_posts1 = Post.objects.filter(status=1).order_by('-created_on')[:3]
    blog_posts2 = Post.objects.filter(status=1).order_by('-created_on')[:1]
    context = {'blog_posts1': blog_posts1, 'blog_posts2': blog_posts2}
               
    return render(request, 'home/index.html', context)