from django.urls import path
from .views import chat

# Homepage URL
urlpatterns = [
    path('chat', chat, name='chat'),
]
