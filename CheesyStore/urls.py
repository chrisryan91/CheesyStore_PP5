from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from django.conf.urls import handler404, handler500, handler403, handler400
import CheesyStore.views as error_views

# Error Handlers
handler400 = error_views.custom_400
handler403 = error_views.custom_403
handler404 = error_views.custom_404
handler500 = error_views.custom_500

urlpatterns = [
    # Url Routes
    path('admin/', admin.site.urls),

    # Summernote for Admin Panel
    path('summernote/', include('django_summernote.urls')),

    # django-allauth Authentication Routes
    path('accounts/', include('allauth.urls')),

    # Home App
    path('', include('home.urls')),

    # Store App
    path('products/', include('cheesystoreshop.urls')),

    # Shopping Bag App
    path('bag/', include('bag.urls')),

    # Checkout App
    path('checkout/', include('checkout.urls')),

    # User Profile App
    path('profile/', include('profiles.urls')),

    # Contact App
    path('contact/', include('contact.urls')),

    # Blog App
    path('cheesyblog/', include('cheesyblog.urls')),

    # Frequently Asked Questions
    path('faq/', include('faq.urls')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
