from django.shortcuts import render, get_object_or_404, redirect
from django.core.paginator import Paginator
from django.contrib import messages
from django.contrib.auth.decorators import login_required, user_passes_test
from django.views.generic import ListView
from django.views import View
from django.utils.text import slugify
from .models import Post
from .forms import CommentForm, BlogPostForm

class CheesyBlogListView(ListView):
    model = Post
    template_name = 'cheesyblog/cheesyblog.html'
    context_object_name = 'posts'
    paginate_by = 6
    posts = Post.objects.filter(status=1).order_by('-created_on')

    def get_queryset(self):
        return Post.objects.filter(status=1).order_by('-created_on')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        total_posts = Post.objects.filter(status=1).count()
        context['total_posts'] = total_posts

        paginator = Paginator(self.get_queryset(), self.paginate_by)
        total_pages = paginator.num_pages
        context['total_pages'] = total_pages

        return context
    
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
                "comments": comments,
                "comment_form": CommentForm()
            },
        )
    
    def post(self, request, slug, *args, **kwargs):
        queryset = Post.objects.filter(status=1)
        post = get_object_or_404(queryset, slug=slug)
        comments = post.comments.filter(approved=True).order_by("-created_on")

        comment_form = CommentForm(data=request.POST)
        if comment_form.is_valid():
            comment = comment_form.save(commit=False)
            comment.post = post
            comment.user = request.user
            comment.save()
            messages.success(request, 'Comment added - awaiting approval!')
        else:
            comment_form = CommentForm()

        return render(
            request,
            "cheesyblog/cheesyblogpost.html",
            {
                "post": post,
                "comments": comments,
                "commented": True,
                "comment_form": comment_form,
            },
        )
    
def is_super_user(user):

    return user.is_superuser
    
@login_required
@user_passes_test(is_super_user)
def AddBlogPost(request):
    if request.method == 'POST':
        form = BlogPostForm(request.POST, request.FILES)
        if form.is_valid():
            new_post = form.save(commit=False)  # Don't save the form to the database yet
            new_post.author = request.user  # Set the author to the currently logged-in user

            new_post.slug = slugify(new_post.title)
            new_post.excerpt = new_post.content[:100]

            new_post.save()  # Now save the post to the database
            return redirect('cheesyblog')  # Redirect to a new URL
    else:
        form = BlogPostForm()
    return render(request, 'cheesyblog/addblogpost.html', {'form': form})