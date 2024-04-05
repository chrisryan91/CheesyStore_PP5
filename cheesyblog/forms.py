from .models import Comment, Post
from django import forms


# CommentForm for submitting comments on blog posts.
class CommentForm(forms.ModelForm):
    # Meta class to specify which model the form is associated with.
    class Meta:
        model = Comment
        fields = ('body',)


# BlogPostForm for submitting new blog posts or editing existing ones.
class BlogPostForm(forms.ModelForm):
    # Meta class defines the model and fields for the form.
    class Meta:
        model = Post
        fields = ['title', 'content', 'featured_image', 'status']
