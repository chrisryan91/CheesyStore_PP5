from django import forms

class ContactForm(forms.Form):
    name = forms.CharField(label='Your Name', max_length=100)
    email = forms.CharField(label='Your Email')
    message = forms.CharField(label='Your message', widget=forms.Textarea)