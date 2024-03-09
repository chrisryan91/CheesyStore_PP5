from django.urls import path
from .views import CheesyBlogListView

urlpatterns = [
    path('', CheesyBlogListView.as_view(), name='cheesyblog'),
]