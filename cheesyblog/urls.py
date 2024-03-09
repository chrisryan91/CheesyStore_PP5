from django.urls import path
from .views import CheesyBlogListView, PostDetail

urlpatterns = [
    path('', CheesyBlogListView.as_view(), name='cheesyblog'),
    path('<slug:slug>/', PostDetail.as_view(), name='post_detail'),
]