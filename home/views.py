from django.shortcuts import render
from cheesyblog.models import Post

def index(request):

    blog_posts = Post.objects.filter(status=1).order_by('-created_on')[:3]
    return render(request, 'home/index.html', {'blog_posts': blog_posts})