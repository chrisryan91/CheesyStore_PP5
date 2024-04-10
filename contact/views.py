from django.shortcuts import render, redirect
from django.core.mail import send_mail
from django.contrib import messages
from django.conf import settings
from django.urls import reverse
from .forms import ContactForm
from .models import ContactMessage


def contact(request):
    if request.method == 'POST':
        # Initialise form with data from the request if it is a POST request.
        form = ContactForm(request.POST)
        # Validate the form data.
        if form.is_valid():
            # Get data from form.
            name = form.cleaned_data['name']
            email = form.cleaned_data['email']
            message = form.cleaned_data['message']

            # Save the message to the database
            ContactMessage.objects.create(name=name, email=email, message=message)

            # Use Django's send_mail function to send an email.
            send_mail(
                f'Message from {name} ({email})',
                message,
                settings.DEFAULT_FROM_EMAIL,
                [settings.DEFAULT_TO_EMAIL],
                # Raise an error is sending fails.
                fail_silently=False,
            )
            messages.success(request, 'Mail sent!')

            # Redirect user.
            return redirect(reverse('contact'))

    else:
        # If not a POST request, initialize an empty form.
        form = ContactForm()

    # Prepare context data for rendering the template.
    context = {
        'form': form,
        'on_profile_page': True
    }

    # Render the contact template with context.
    return render(request, 'contact/contact.html', context)
