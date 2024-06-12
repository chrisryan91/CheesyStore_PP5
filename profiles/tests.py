from django.test import TestCase, Client
from django.urls import reverse
from django.contrib.auth.models import User
from .models import UserProfile
from .forms import UserProfileForm

# Create your tests here.

class ProfileViewTest(TestCase):
    def setUp(self):
        # Create a test user and user profile
        self.client = Client()
        self.user = User.objects.create_user(username='testuser', password='testpass')
        self.profile = UserProfile.objects.get_or_create(user=self.user)

        # Login the test user
        self.client.login(username='testuser', password='testpass')

    def test_profile_view_get(self):
        # Simulate a GET request to the profile view
        response = self.client.get(reverse('profile'))

        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'profiles/profile.html')
        self.assertIsInstance(response.context['form'], UserProfileForm)
        self.assertIn('orders', response.context)
        self.assertTrue(response.context['on_profile_page'])

    def test_profile_view_post_valid_data(self):
        # Simulate a POST request to the profile view with valid test data
        response = self.client.post(reverse('profile'), {
            'default_phone_number': '123456789',
            'default_postcode': '12345',
            'default_town_or_city': 'Test City',
            'default_street_address1': '123 Test Street',
            'default_street_address2': 'Suite 100',
            'default_county': 'Test County',
        })

        # Check that the response is a redirect (to the same in this case)
        self.assertEqual(response.status_code, 200)

        # Check that the success message is present
        messages = list(response.wsgi_request._messages)
        self.assertEqual(len(messages), 1)
        self.assertEqual(str(messages[0]), 'Updated profile successfully!')

    def test_profile_view_post_invalid_data(self):
        # Simulate a POST request to the profile view with valid test data
        response = self.client.post(reverse('profile'), {
            'default_phone_number': 'erferg',
            'default_postcode': 'erferf',
            'default_town_or_city': 'ergtg',
            'default_street_address1': '3rf3rf',
            'default_street_address2': 'rrf',
            'default_county': 'erftg4rf',
        })

        # Check that the response is a redirect (to the same in this case)
        self.assertEqual(response.status_code, 200)

        # Check that the success message is present
        messages = list(response.wsgi_request._messages)
        self.assertEqual(len(messages), 1)
        self.assertEqual(str(messages[0]), 'Updated profile successfully!')


    