from django.urls import path
from . import views

# FAQ URL Route
urlpatterns = [
    path('', views.faq, name='faq'),
]