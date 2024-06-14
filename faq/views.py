from django.shortcuts import render
from .models import FAQ


# Create your views here.
def faq(request):
    faqs = FAQ.objects.all()
    return render(request, 'faq/faq.html', {'faqs': faqs})