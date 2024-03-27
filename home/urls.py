from django.urls import path
from . import views

# Homepage URL
urlpatterns = [
    path('', views.index, name='home'),
]
