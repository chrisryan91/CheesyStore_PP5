from django.views.generic import ListView
from .models import Post

class CheesyBlogListView(ListView):
    model = Post
    template_name = 'cheesyblog/cheesyblog.html'
    context_object_name = 'posts'
    paginate_by = 6

    def get_queryset(self):
        return Post.objects.filter(status=1).order_by('-created_on')