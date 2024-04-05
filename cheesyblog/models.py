from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone

# Choices for the status of posts
STATUS = ((0, "Draft"), (1, "Published"))


# Post model definition for blog posts.
class Post(models.Model):
    title = models.CharField(max_length=100, unique=True)
    slug = models.SlugField(max_length=200, unique=True)
    author = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name="post")
    updated_on = models.DateTimeField(auto_now=True)
    content = models.TextField()
    featured_image = models.ImageField(null=True, blank=True)
    excerpt = models.TextField(blank=True)
    created_on = models.DateTimeField(auto_now_add=True)
    status = models.IntegerField(choices=STATUS, default=0)
    keywords = models.TextField(
        help_text="Enter specific comma-separated SEO keywords",
        blank=True)

    # Meta options to specify ordering of posts.
    class Meta:
        ordering = ['-created_on']

    # String representation of the Post model.
    def __str__(self):
        return self.title


# Comment model definition for blog comments.
class Comment(models.Model):
    post = models.ForeignKey(
        Post,
        on_delete=models.CASCADE,
        related_name="comments"
    )
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='comments_user'
    )
    body = models.TextField(max_length=1000)
    created_on = models.DateTimeField(default=timezone.now)
    approved = models.BooleanField(default=False)

    # Meta options to specify ordering of comments in queries.
    class Meta:
        ordering = ['created_on']

    # String representation of the Comment model.
    def __str__(self):
        return f"Comment {self.body[:20]}... by {self.user}"
