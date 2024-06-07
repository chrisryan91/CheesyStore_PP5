import json
from django.test import TestCase
from django.urls import reverse
from unittest.mock import patch, MagicMock, Mock
from django.contrib.sessions.middleware import SessionMiddleware
from django.contrib.messages.middleware import MessageMiddleware
from django.test import RequestFactory
from django.contrib.auth.models import User
from django.conf import settings
from django.contrib.messages import get_messages
from django.contrib.messages.storage.fallback import FallbackStorage
from django.http import HttpResponse

from checkout.views import cache_checkout_data, checkout
from checkout.forms import OrderForm
from checkout.models import Order, OrderLineItem, Product
from profiles.models import UserProfile
from bag.contexts import bag_contents


# Create your tests here.

class CacheCheckoutDataTest(TestCase):
    
    def setUp(self):
        self.factory = RequestFactory()
        self.user = User.objects.create_user(username='testuser', password='12345')
        self.stripe_secret_key = 'sk_test_4eC39HqLyjWDarjtT1zdp7dc'

    @patch('checkout.views.stripe.PaymentIntent.modify')
    @patch('checkout.views.settings.STRIPE_SECRET_KEY', 'sk_test_4eC39HqLyjWDarjtT1zdp7dc')
    def test_cache_checkout_data_success(self, mock_modify):
        # Mock request
        request = self.factory.post('cache_checkout_data/', {
            'client_secret': 'pi_1GqIC8AaGBPfsxZf',
            'save_info': 'on'
        })
        request.user = self.user
        request.session = {'bag': {'item1': 1, 'item2': 2}}

        # Setup message storage for the request
        messages = FallbackStorage(request)
        setattr(request, '_messages', messages)

        # Call the view
        response = cache_checkout_data(request)

        # Check that Stripe API was called with the correct parameters
        mock_modify.assert_called_once_with(
            'pi_1GqIC8AaGBPfsxZf',
            metadata = {
                'bag': json.dumps({'item1': 1, 'item2': 2}),
                'save_info': 'on',
                'username': 'testuser',
            }
        )

        # Check response
        self.assertEqual(response.status_code, 200)

    @patch('checkout.views.stripe.PaymentIntent.modify', side_effect=Exception('Stripe error'))
    @patch('checkout.views.settings.STRIPE_SECRET_KEY', 'sk_test_4eC39HqLyjWDarjtT1zdp7dc')
    def test_cache_checkout_data_error(self, mock_modify):
        # Mock request
        request = self.factory.post('/cache_checkout_data', {
            'client_secret': 'pi_1GqIC8AaGBPfsxZf_secret_HdAawW7XJ1fl5o',
            'save_info': 'on'
        })
        request.user = self.user
        request.session = {'bag': {'item1': 1, 'item2': 2}}

        # Setup message storage for the request
        messages = FallbackStorage(request)
        setattr(request, '_messages', messages)

        # Call the view
        response = cache_checkout_data(request)

        # Check that Stripe API was called
        mock_modify.assert_called_once_with(
            'pi_1GqIC8AaGBPfsxZf',
            metadata = {
                'bag': json.dumps({'item1': 1, 'item2': 2}),
                'save_info': 'on',
                'username': 'testuser',
            }
        )

        # Check response
        self.assertEqual(response.status_code, 400)
        self.assertIn('Stripe error', response.content.decode())


if __name__ == '__main__':
    TestCase.main()

class CheckoutViewTest(TestCase):
    def setUp(self):
        self.factory = RequestFactory()
        self.user = User.objects.create_user(username='testuser', password='testpassword')
        self.product = Product.objects.create(name='Test Product', price=100)
        self.bag = {str(self.product.id): 2}
        self.stripe_public_key = 'pk_test_12345'
        self.stripe_secret_key = 'sk_test_12345'

    def add_middleware(self, request):
        # Add session and messages middleware to the request
        session_middleware = SessionMiddleware()
        session_middleware.process_request(request)
        request.session.save()
        
        message_middleware = MessageMiddleware()
        message_middleware.process_request(request)
        request._messages = FallbackStorage(request)
    
    @patch('checkout.views.stripe.PaymentIntent.create')
    @patch('checkout.views.settings.STRIPE_PUBLIC_KEY', 'pk_test_12345')
    @patch('checkout.views.settings.STRIPE_SECRET_KEY', 'sk_test_12345')
    def test_checkout_view_get_empty_bag(self, mock_payment_intent_create):
        # Test GET request with empty bag
        request = self.factory.get(reverse('checkout'))
        request.user = self.user
        self.add_middleware(request)

        response = checkout(request)

        # Check redirection to products page
        self.assertEqual(response.status_code, 302)
        self.assertEqual(response.url, reverse('products'))

        # Check message
        messages = list(get_messages(request))
        self.assertEqual(len(messages), 1)
        self.assertEqual(str(messages[0]), "There's nothing in your bag.")

    @patch('checkout.views.stripe.PaymentIntent.create')
    @patch('checkout.views.settings.STRIPE_PUBLIC_KEY', 'pk_test_12345')
    @patch('checkout.views.settings.STRIPE_SECRET_KEY', 'sk_test_12345')
    def test_checkout_view_post_valid_form(self, mock_payment_intent_create):
        # Test POST request with valid form data
        mock_payment_intent_create.return_value = MagicMock(client_secret='test_secret')
        request = self.factory.post(reverse('checkout'), {
            'full_name': 'Test User',
            'email': 'test@example.com',
            'phone_number': '123456789',
            'country': 'US',
            'postcode': '12345',
            'town_or_city': 'Test City',
            'street_address1': '123 Test St',
            'street_address2': '',
            'county': 'Test County',
            'client_secret': 'pi_1GqIC8AaGBPfsxZf_secret_HdAawW7XJ1fl5o',
        })
        request.user = self.user
        self.add_middleware(request)
        request.session['bag'] = self.bag

        response = checkout(request)
        
        # Check redirection to checkout success page
        self.assertEqual(response.status_code, 302)
        order = Order.objects.first()
        self.assertEqual(response.url, reverse('checkout_success', args=[order.order_number]))

        # Check that the order was created
        self.assertEqual(Order.objects.count(), 1)
        self.assertEqual(OrderLineItem.objects.count(), 1)
        order = Order.objects.first()
        self.assertEqual(order.full_name, 'Test User')
        self.assertEqual(order.original_bag, json.dumps(self.bag))

class CheckoutSuccessViewTestCase(TestCase):
    def setUp(self):
        # Create a test user
        self.user = User.objects.create_user(
            username='testuser', email='test@example.com', password='password'
        )
        # Create a test order
        self.order = Order.objects.create(
            order_number='123456', phone_number='1234567890', country='US', postcode='12345',
            town_or_city='City', street_address1='Street 1', street_address2='Street 2',
            county='County'
        )
        # Create a test user profile if it doesn't exist
        if not UserProfile.objects.filter(user=self.user).exists():
            self.user_profile = UserProfile.objects.create(
                user=self.user, default_phone_number='1234567890', default_country='US',
                default_postcode='12345', default_town_or_city='City', default_street_address1='Street 1',
                default_street_address2='Street 2', default_county='County'
            )


    def test_checkout_success_authenticated_save_info(self):
        # Simulate an authenticated user and saving info
        self.client.force_login(self.user)
        session = self.client.session
        session['save_info'] = True
        session.save()

        response = self.client.get(reverse('checkout_success', args=['123456']))
        self.assertEqual(response.status_code, 200)

        # Check if the order is linked to the user profile and user profile info is updated
        updated_order = Order.objects.get(order_number='123456')
        # Access user_profile from the setup method
        user_profile = UserProfile.objects.get(user=self.user)
        self.assertEqual(updated_order.user_profile, user_profile)

    def test_checkout_success_authenticated_no_save_info(self):
        # Simulate an authenticated user without saving info
        self.client.force_login(self.user)
        session = self.client.session
        session['save_info'] = False
        session.save()

        response = self.client.get(reverse('checkout_success', args=['123456']))
        self.assertEqual(response.status_code, 200)

        # Check if the order is linked to the user profile
        updated_order = Order.objects.get(order_number='123456')
        # Access user_profile from the setup method
        user_profile = UserProfile.objects.get(user=self.user)
        self.assertEqual(updated_order.user_profile, user_profile)
        # Add more assertions for other fields if needed

    def test_checkout_success_unauthenticated(self):
        # Simulate an unauthenticated user
        session = self.client.session
        session['save_info'] = True
        session.save()

        response = self.client.get(reverse('checkout_success', args=['123456']))
        self.assertEqual(response.status_code, 200)

        # Ensure order is not linked to any user profile
        updated_order = Order.objects.get(order_number='123456')
        self.assertIsNone(updated_order.user_profile)

    def test_checkout_success_no_bag_in_session(self):
        # Simulate a scenario where 'bag' key is not in session
        session = self.client.session
        session['save_info'] = True
        session.save()

        response = self.client.get(reverse('checkout_success', args=['123456']))
        self.assertEqual(response.status_code, 200)

        # Ensure 'bag' key is removed from session
        self.assertNotIn('bag', self.client.session)