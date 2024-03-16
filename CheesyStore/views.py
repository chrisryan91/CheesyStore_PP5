from django.shortcuts import render

# Define the custom 404 view
def custom_400(request, exception=None):
    return render(request, '400.html', {}, status=400)

# Define the custom 404 view
def custom_403(request, exception=None):
    return render(request, '403.html', {}, status=403)

# Define the custom 404 view
def custom_404(request, exception=None):
    return render(request, '404.html', {}, status=404)
    
# Define the custom 404 view
def custom_500(request, exception=None):
    return render(request, '500.html', {}, status=500)