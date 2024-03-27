from django import forms

# Define a ContactForm class that inherits from forms.Form to create a custom form.
class ContactForm(forms.Form):

    # Define fields for name, email and message.
    name = forms.CharField(label='Your Name', max_length=100)
    email = forms.CharField(label='Your Email')
    message = forms.CharField(label='Your message', widget=forms.Textarea)