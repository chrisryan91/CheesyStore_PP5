from django.urls import path
from .views import CheesyBlogListView, PostDetail, AddBlogPost

urlpatterns = [
    path('', CheesyBlogListView.as_view(), name='cheesyblog'),
    path('addblogpost/', AddBlogPost, name='addblogpost'),
    path('<slug:slug>/', PostDetail.as_view(), name='post_detail'),
]