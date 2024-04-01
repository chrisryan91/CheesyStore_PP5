from django.urls import path
from .views import CheesyBlogListView, PostDetail, AddBlogPost, DeleteComment

# URL routers for CheesyBlog
urlpatterns = [
    path('', CheesyBlogListView.as_view(), name='cheesyblog'),
    path('addblogpost/', AddBlogPost, name='addblogpost'),
    path('<slug:slug>/', PostDetail.as_view(), name='post_detail'),
    path('delete-comment/<int:comment_id>/', DeleteComment, name='delete_comment'),
]