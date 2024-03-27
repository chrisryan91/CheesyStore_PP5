from django.shortcuts import render

# Create your views here.

def faq(request):

    # Return FAQ Page
    return render(request, 'faq/faq.html')