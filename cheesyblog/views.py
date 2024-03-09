from django.shortcuts import render, get_object_or_404
from django.views.generic import ListView
from django.views import View
from .models import Post

class CheesyBlogListView(ListView):
    model = Post
    template_name = 'cheesyblog/cheesyblog.html'
    context_object_name = 'posts'
    paginate_by = 6

    def get_queryset(self):
        return Post.objects.filter(status=1).order_by('-created_on')
    
class PostDetail(View):

    def get(self, request, slug, *args, **kwargs):
        queryset = Post.objects.filter(status=1)
        post = get_object_or_404(queryset, slug=slug)
        comments = post.comments.filter(approved=True).order_by('created_on')

        return render(
            request,
            'cheesyblog/cheesyblogpost.html',
            {
                "post": post,
                "comments": comments
            },
        )