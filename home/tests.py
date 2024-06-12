from django.test import TestCase, Client
from django.urls import reverse
from django.contrib.auth.models import User
from cheesyblog.models import Post
from cheesystoreshop.models import Product, Category
from django.core.files.uploadedfile import SimpleUploadedFile

class IndexViewTests(TestCase):

    def setUp(self):
        self.client = Client()
        self.url = reverse('home')

        # Create a test user to serve as the author of posts.
        self.user = User.objects.create_user(username='testuser', password='password')

        # Create a category for products.
        self.category = Category.objects.create(name="new_arrival")

        image_content = b'\x47'
        image = SimpleUploadedFile("test_image.gif", image_content, content_type="image/gif")

        # Create test posts with the user as the author.
        self.posts = [
            Post.objects.create(
                title=f'Test Post {i}',
                content='Test Content',
                status=1,
                author=self.user,
                slug=f'test-post-{i}',
                featured_image=image)
            for i in range(4)
        ]

        # Create test products.
        self.products = [
                Product.objects.create(            
                    category=self.category,
                    sku=f'000{i}',
                    name=f"Product{i}",
                    description=f"Description{i}",
                    price="10.00",
                    rating="4.5",
                    in_stock=True)
                    for i in range(4)
              ]

    def test_index_view_get(self):
        # Simulate a GET request to the index view.
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'home/index.html')

        # Verify context data.
        self.assertIn('blog_posts1', response.context)
        self.assertIn('blog_posts2', response.context)
        self.assertIn('new_arrival', response.context)
        self.assertIn('new_arrivals', response.context)

        # Verify the correct number of blog posts and products.
        self.assertEqual(len(response.context['blog_posts1']), 3)
        self.assertEqual(len(response.context['blog_posts2']), 1)
        self.assertEqual(len(response.context['new_arrival']), 1)
        self.assertEqual(len(response.context['new_arrivals']), 3)

