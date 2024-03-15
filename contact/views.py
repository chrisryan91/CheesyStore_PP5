from django.shortcuts import render, redirect
from django.core.mail import send_mail
from django.contrib import messages
from django.conf import settings
from django.urls import reverse
from .forms import ContactForm

def contact(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            name = form.cleaned_data['name']
            email = form.cleaned_data['email']
            message = form.cleaned_data['message']
            
            # Send email
            send_mail(
                f'Message from {name} ({email})',
                message,
                settings.DEFAULT_FROM_EMAIL,
                [settings.DEFAULT_TO_EMAIL],
                fail_silently=False,
            )
            messages.success(request, 'Mail sent!')
            # Redirect to the same page to clear the form fields
            return redirect(reverse('contact'))
    else:
        form = ContactForm()
    context = {
        'form': form,
        'on_profile_page': True
    }
    return render(request, 'contact/contact.html', context)