from django.urls import path
from . import views
from .views import chat

# Homepage URL
urlpatterns = [
    path('', views.index, name='home'),
    path('chat', chat, name='chat'),
]
