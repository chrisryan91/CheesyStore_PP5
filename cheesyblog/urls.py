from django.urls import path
from . import views
from .views import CheesyBlogListView, PostDetail, AddBlogPost

# URL routers for CheesyBlog
urlpatterns = [
    path('', CheesyBlogListView.as_view(), name='cheesyblog'),
    path('addblogpost/', AddBlogPost, name='addblogpost'),
    path('<slug:slug>/', PostDetail.as_view(), name='post_detail'),
    path(
        'delete/<int:comment_id>/',
        views.DeleteComment,
        name='delete_comment'
    ),
    path(
        'edit/<int:comment_id>/',
        views.edit_comment,
        name='edit_comment'
    ),
]
