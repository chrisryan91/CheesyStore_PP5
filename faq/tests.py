from django.test import TestCase, Client
from django.urls import reverse

class FaqViewTests(TestCase):

    def setUp(self):
        self.client = Client()
        self.url = reverse('faq')  # Update this if your URL pattern name is different

    def test_faq_view_get(self):
        # Simulate a GET request to the FAQ view.
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'faq/faq.html')
