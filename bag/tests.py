from django.test import TestCase, Client
from django.urls import reverse
from django.contrib.messages import get_messages
from cheesystoreshop.models import Product

# Create your tests here.

class BagViewTests(TestCase):
    def test_bag_view(self):
        """
        Test the view_bag to ensure it renders the correct template
        """
        response = self.client.get(reverse('view_bag'))

        # Check that the response is 200 ok
        self.assertEqual(response.status_code, 200)

        # Check that the correct template was user.
        self.assertTemplateUsed(response, 'bag/bag.html')

class AddToBagViewTest(TestCase):
    def setUp(self):
        self.client = Client()
        self.product = Product.objects.create(name='Test Product', price=10.0)
        self.add_to_bag_url = reverse('add_to_bag', args=[self.product.id])
        self.redirect_url = reverse('view_bag')

    def test_add_to_bag(self):
        # Simulate a POST request to add the product to the bag
        response = self.client.post(self.add_to_bag_url, {
            'quantity': 1,
            'redirect_url': self.redirect_url
        })

        # Check that the product is in the bag
        session = self.client.session
        self.assertIn(str(self.product.id), session['bag'])
        self.assertEqual(session['bag'][str(self.product.id)], 1)

        # Check that the success message is in the messages
        messages = list(get_messages(response.wsgi_request))
        self.assertEqual(response.status_code, 302)
        self.assertEqual(str(messages[0]), f'Added {self.product.name} to your bag')

        self.assertEqual(response.status_code, 302)
        self.assertEqual(response.url, self.redirect_url)
    
    def test_update_quantity_in_bag(self):
        # Add the product to the bag first
        session = self.client.session
        session['bag'] = {str(self.product.id): 1}
        session.save()

        # Simulate a POST request to update the quantity of the product in the bag
        response = self.client.post(self.add_to_bag_url, {
            'quantity': 2,
            'redirect_url': self.redirect_url
        })

        # Check that the product quantity is updated in the bag
        session = self.client.session
        self.assertEqual(session['bag'][str(self.product.id)], 3)

        # Check that the success message is in the messages
        messages = list(get_messages(response.wsgi_request))
        self.assertEqual(len(messages), 1)
        self.assertEqual(str(messages[0]), f'Update {self.product.name} quantity to 3')
        
        # Check that the response is a redirect
        self.assertEqual(response.status_code, 302)
        self.assertEqual(response.url, self.redirect_url)