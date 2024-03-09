from django.shortcuts import render

# Create your views here.

from django.shortcuts import render

# Create your views here.

def cheesyblog(request):
    
    return render(request, 'cheesyblog/cheesyblog.html')