from django.test import TestCase
from django.urls import reverse
from django.core.paginator import Paginator
from django.contrib.auth.models import User
from cheesyblog.models import Post, Comment
from django.utils.text import slugify
from django.core.files.uploadedfile import SimpleUploadedFile
from django.contrib.messages import get_messages
from django.contrib.messages.storage.fallback import FallbackStorage

class CheesyBlogListViewTest(TestCase):
    @classmethod
    def setUpTestData(cls):
        # Create a user to be the author of the posts
        test_user = User.objects.create_user(username='testuser', password='12345')

        image_content = b'\x47'
        image = SimpleUploadedFile("test_image.gif", image_content, content_type="image/gif")

        # Create 13 posts with status=1 (published)
        number_of_posts = 13
        for post_id in range(number_of_posts):
            Post.objects.create(
                title=f'Test Post {post_id}',
                slug=slugify(f'Test Post {post_id}'),
                content='Test content',
                status=1,
                author=test_user,
                featured_image=image  # Explicitly setting to None
            )

        # Create 2 posts with status=0 (unpublished)
        for post_id in range(2):
            Post.objects.create(
                title=f'Unpublished Post {post_id}',
                slug=slugify(f'Unpublished Post {post_id}'),
                content='Test content',
                status=0,
                author=test_user,
                featured_image=image  # Explicitly setting to None
            )

    def test_view_url_exists_at_desired_location(self):
        response = self.client.get('/cheesyblog/')
        self.assertEqual(response.status_code, 200)

    def test_view_accessible(self):
        url = reverse('cheesyblog')
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)

    def test_pagination_is_six(self):
        response = self.client.get(reverse('cheesyblog'))
        self.assertEqual(response.status_code, 200)
        self.assertTrue(response.context['is_paginated'] is True)
        self.assertEqual(len(response.context['posts']), 6)

    def test_context_data(self):
        response = self.client.get(reverse('cheesyblog'))
        self.assertTrue('total_posts' in response.context)
        self.assertTrue('total_pages' in response.context)
        self.assertEqual(response.context['total_posts'], 13)

        paginator = Paginator(Post.objects.filter(status=1).order_by('-created_on'), 6)
        self.assertEqual(response.context['total_pages'], paginator.num_pages)

    def test_only_published_posts_posted(self):
        response = self.client.get(reverse('cheesyblog'))
        self.assertEqual(response.status_code, 200)
        self.assertNotContains(response, 'Unpublished Post')

class PostDetailViewTestCase(TestCase):
    def setUp(self):
        self.user = User.objects.create_user(username='testuser', password='password')
        post_title = 'Test Post'
        image_content = b'\x47'
        image = SimpleUploadedFile("test_image.gif", image_content, content_type="image/gif")
        self.post = Post.objects.create(
            title='Test Post',
            content='This is a test post content.',
            author=self.user,
            status=1,
            featured_image=image 
        )
        self.post.slug = slugify(post_title)
        self.post.save()

        self.comment = Comment.objects.create(
            post=self.post,
            user=self.user,
            body='This is a test comment.',
            approved=True  # Assuming the comment is approved
        )
        self.comment.save()
    
    def test_get_post_detail(self):
        url = reverse('post_detail', kwargs={'slug': self.post.slug})
        response = self.client.get(url)

        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'cheesyblog/cheesyblogpost.html')

        self.assertIn('post', response.context)
        self.assertIn('comments', response.context)

    def test_post_comment(self):
        url = reverse('post_detail', kwargs={'slug': self.post.slug})
        comment_data = {
            'content': 'This is a test comment.'
        }

        # Simulate a logged-in user
        self.client.force_login(self.user)

        # Submit a POST request to add a comment
        response = self.client.post(url, comment_data)

        # Check if the comment is added successfully
        self.assertEqual(response.status_code, 200)
        self.assertIn('commented', response.context)
        self.assertTrue(response.context['commented'])

        # Check if the comment is associated with the correct post and user
        self.assertEqual(self.post.comments.count(), 1)

def test_add_blog_post(self):
    # Log in as superuser
    self.client.login(username='admin', password='password')

    # Create a POST request with form data
    form_data = {
        'title': 'Test Post',
        'content': 'This is a test post content.',
        'featured_image': None,  # Adjust as needed
        'status': 'draft',  # Adjust as needed
    }
    response = self.client.post(reverse('AddBlogPost'), form_data)

    # Check if the post was added successfully
    self.assertEqual(response.status_code, 302)  # 302 is the redirect status code

    # Verify that the post is saved in the database
    saved_posts = Post.objects.all()
    self.assertTrue(saved_posts.exists())  # Check if any posts exist
    self.assertEqual(saved_posts.count(), 1)  # Check if there's exactly one post
    self.assertEqual(saved_posts[0].title, 'Test Post')  # Verify the title of the saved post

class DeleteCommentTestCase(TestCase):
    def setUp(self):
        # Create a superuser for testing
        self.superuser = User.objects.create_superuser(username='admin', email='admin@example.com', password='password')

        # Create a blog post
        self.blog_post = Post.objects.create(title="Test Post", content="Test Content", author=self.superuser)

        # Create a comment associated with the blog post
        self.comment = Comment.objects.create(post=self.blog_post, user=self.superuser, body="Test Comment")

    def test_delete_comment(self):
        # Log in as superuser
        self.client.login(username='admin', password='password')

        # Get the URL for deleting the comment
        delete_comment_url = reverse('delete_comment', kwargs={'comment_id': self.comment.pk})

        # Make a GET request to delete the comment
        response = self.client.get(delete_comment_url)

        # Check if the comment was deleted successfully
        self.assertEqual(response.status_code, 302)  # 302 is the redirect status code
        self.assertFalse(Comment.objects.filter(pk=self.comment.pk).exists())

        # Check if the success message is displayed
        storage = get_messages(response.wsgi_request)
        messages = list(storage)
        self.assertEqual(len(messages), 1)
        self.assertEqual(str(messages[0]), 'Comment Deleted!')

    def test_delete_comment_requires_login(self):
        # Get the URL for deleting the comment
        delete_comment_url = reverse('delete_comment', kwargs={'comment_id': self.comment.pk})

        # Make a GET request without logging in
        response = self.client.get(delete_comment_url)

        # Check if the user is redirected to the login page
        self.assertEqual(response.status_code, 302)  # 302 is the redirect status code
        self.assertTrue(response.url.startswith('/accounts/login/'))  # Assuming your login URL is /accounts/login/

class EditCommentTestCase(TestCase):
    def setUp(self):
        # Create a superuser for testing
        self.superuser = User.objects.create_superuser(username='admin', email='admin@example.com', password='password')

        # Create a blog post
        self.blog_post = Post.objects.create(title="Test Post", content="Test Content", author=self.superuser)

        # Create a comment associated with the blog post
        self.comment = Comment.objects.create(post=self.blog_post, user=self.superuser, body="Test Comment")

    def test_edit_comment(self):
        # Log in as superuser
        self.client.login(username='admin', password='password')

        # Get the URL for editing the comment
        edit_comment_url = reverse('edit_comment', kwargs={'comment_id': self.comment.pk})

        # Make a GET request to edit the comment
        response = self.client.get(edit_comment_url)

        # Check if the response is successful
        self.assertEqual(response.status_code, 200)  # 200 is the success status code

        # Check if the form is present in the response context
        self.assertIn('form', response.context)

    def test_edit_comment_requires_login(self):
        # Get the URL for editing the comment
        edit_comment_url = reverse('edit_comment', kwargs={'comment_id': self.comment.pk})

        # Make a GET request without logging in
        response = self.client.get(edit_comment_url)

        # Check if the user is redirected to the login page
        self.assertEqual(response.status_code, 302)  # 302 is the redirect status code
        self.assertTrue(response.url.startswith('/accounts/login/'))  # Assuming your login URL is /accounts/login/