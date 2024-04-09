from django.shortcuts import render, get_object_or_404, redirect
from django.urls import reverse
from django.core.paginator import Paginator
from django.contrib import messages
from django.contrib.auth.decorators import login_required, user_passes_test
from django.views.generic import ListView
from django.views import View
from django.utils.text import slugify
from .models import Post, Comment
from .forms import CommentForm, BlogPostForm


# List view for displaying blog posts with pagination.
class CheesyBlogListView(ListView):
    # Specify the model to retrieve data form.
    model = Post
    # Template path.
    template_name = 'cheesyblog/cheesyblog.html'
    # Name of the variable in the template.
    context_object_name = 'posts'
    # Number of posts per page.
    paginate_by = 6
    posts = Post.objects.filter(status=1).order_by('-created_on')

    # Define the query to fetch published posts and order them.
    def get_queryset(self):
        return Post.objects.filter(status=1).order_by('-created_on')

    # Context data with total posts count and pages count.
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        total_posts = Post.objects.filter(status=1).count()
        context['total_posts'] = total_posts

        paginator = Paginator(self.get_queryset(), self.paginate_by)
        total_pages = paginator.num_pages
        context['total_pages'] = total_pages

        return context


# View for displaying a single post detail.
class PostDetail(View):

    # Handle GET requests
    def get(self, request, slug, *args, **kwargs):
        # Filter for published posts.
        queryset = Post.objects.filter(status=1)
        # Retrieve the post by slug or return 404 and Fetch approved comments.
        post = get_object_or_404(queryset, slug=slug)
        comments = post.comments.filter(approved=True).order_by('created_on')

        # Render template with the post and comments
        return render(
            request,
            'cheesyblog/cheesyblogpost.html',
            {
                "post": post,
                "comments": comments,
                "comment_form": CommentForm(),
            }
        )

    # Handle POST requests.
    def post(self, request, slug, *args, **kwargs):
        queryset = Post.objects.filter(status=1)
        post = get_object_or_404(queryset, slug=slug)
        comments = post.comments.filter(approved=True).order_by("-created_on")
        comment_form = CommentForm(data=request.POST)

        # Check if form is valid.
        if comment_form.is_valid():
            comment = comment_form.save(commit=False)
            comment.post = post
            comment.user = request.user
            # Save after associating valid comment with user.
            comment.save()
            messages.info(request, 'Comment added - awaiting approval!')
        else:
            # Initialize form again on failure on failure.
            comment_form = CommentForm()

        return render(request, "cheesyblog/cheesyblogpost.html", {
            "post": post,
            "comments": comments,
            "commented": True,
            "comment_form": comment_form,
            })


# Function to check if a user is a superuser
def is_super_user(user):
    return user.is_superuser


# View to add a new blog post with decorator to check if logged in.
@login_required
# Check if user is superuser.
@user_passes_test(is_super_user)
def AddBlogPost(request):
    # Check if request is POST
    if request.method == 'POST':
        form = BlogPostForm(request.POST, request.FILES)
        # Check if form is valid.
        if form.is_valid():
            new_post = form.save(commit=False)
            new_post.author = request.user
            new_post.slug = slugify(new_post.title)
            new_post.excerpt = new_post.content[:100]
            # Save the post and redirect to blog posts.
            new_post.save()
            messages.info(request, 'Post added - it may need approval!')
            return redirect('cheesyblog')
    else:
        # If not post initialise empty form.
        form = BlogPostForm()
    return render(request, 'cheesyblog/addblogpost.html', {'form': form})


@login_required
def DeleteComment(request, comment_id):
    # Return 404 error if product not found.
    comment = get_object_or_404(Comment, pk=comment_id)
    print(comment)

    # Delete the product if found and redirect to list of products.
    comment.delete()
    messages.info(request, 'Comment Deleted!')
    return redirect(reverse('cheesyblog'))


@login_required
def edit_comment(request, comment_id):

    # Show 404 error is product is not found.
    comment = get_object_or_404(Comment, pk=comment_id)

    # Process the form data if request is POST.
    if request.method == 'POST':
        form = CommentForm(request.POST, request.FILES, instance=comment)
        # Check if the form is valid and save if so.
        if form.is_valid():
            form.save()
            messages.info(request, 'Successfully updated comment')
            return redirect(reverse('cheesyblog'))
        else:
            messages.error(request, 'Failed to update comment')
    else:
        # If not a POST request initialise form with product instance.
        form = CommentForm(instance=comment)
        messages.info(request, 'You are editing your comment')

    # Define template and context
    template = 'cheesyblog/edit_comment.html'
    context = {
        'form': form,
        'product': comment,
        'ignore_section': True,
    }

    # Render and return the template with context.
    return render(request, template, context)
