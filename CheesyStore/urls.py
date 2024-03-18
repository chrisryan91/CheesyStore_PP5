from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from django.conf.urls import handler404, handler500, handler403, handler400
import CheesyStore.views as error_views

handler400 = error_views.custom_400
handler403 = error_views.custom_403
handler404 = error_views.custom_404
handler500 = error_views.custom_500

urlpatterns = [
    path('admin/', admin.site.urls),
    path('summernote/', include('django_summernote.urls')),
    path('accounts/', include('allauth.urls')),
    path('', include('home.urls')),
    path('products/', include('cheesystoreshop.urls')),
    path('bag/', include('bag.urls')),
    path('checkout/', include('checkout.urls')),
    path('profile/', include('profiles.urls')),
    path('contact/', include('contact.urls')),
    path('cheesyblog/', include('cheesyblog.urls')),
    path('faq/', include('faq.urls')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

