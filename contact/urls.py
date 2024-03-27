from django.urls import path
from . import views

# URL Routes for Contact App.
urlpatterns = [
    path('', views.contact, name='contact'),
]
