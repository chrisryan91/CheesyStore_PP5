from django.test import TestCase, Client
from django.urls import reverse
from django.core import mail
from django.conf import settings
from .models import ContactMessage
from .forms import ContactForm

# Create your tests here.

class ContactViewTests(TestCase):

  def setUp(self):
    self.client = Client()
    self.url = reverse('contact')

  def test_contact_view_get(self):
    # Simulate a GET request to the contact view.
    response = self.client.get(self.url)
    self.assertEqual(response.status_code, 200)
    self.assertTemplateUsed(response, "contact/contact.html")
    self.assertIsInstance(response.context["form"], ContactForm)

  def test_contact_view_post_valid_data(self):
    # Simulate a POST request with valid form data.
    data = {
      'name': 'Test User',
      'email': 'test@example.com',
      'message': 'This is a test message.'
    }
    response = self.client.post(self.url, data)

    # Check redirection after form submission.
    self.assertRedirects(response, self.url)

    # Check that the message was saved to the database.
    self.assertEqual(ContactMessage.objects.count(), 1)
    contact_message = ContactMessage.objects.first()
    self.assertEqual(contact_message.name, 'Test User')
    self.assertEqual(contact_message.email, 'test@example.com')
    self.assertEqual(contact_message.message, 'This is a test message.')

    # Check that an email was sent.
    self.assertEqual(len(mail.outbox), 1)
    email = mail.outbox[0]
    self.assertEqual(email.subject, 'Message from Test User (test@example.com)')
    self.assertEqual(email.body, 'This is a test message.')
    self.assertEqual(email.from_email, settings.DEFAULT_FROM_EMAIL)
    self.assertEqual(email.to, [settings.DEFAULT_TO_EMAIL])

def test_contact_view_post_invalid_data(self):
      # Simulate a POST request with valid form data.
    data = {
      'name': '',
      'email': 'test',
      'message': ''
    }
    response = self.client.post(self.url, data)

    # Check that the response is OK but form contains errors.
    self.assertEqual(response.code, 200)
    self.assertTemplateUsed(response.context['form'], 'contact/contact.html')
    self.assertInInstance(response.context['form'], ContactForm)
    self.assertTrue(response.context['form'].errors)

    # Check that no message was saved
    self.assertEqual(ContactMessage.objects.count(), 0)

    # Check that no email was sent.
    self.assertEqual(len(mail.outbox), 0)