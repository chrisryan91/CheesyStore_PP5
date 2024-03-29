from django.contrib import admin
from .models import Post, Comment
# Import the Summernote editor integration
from django_summernote.admin import SummernoteModelAdmin

# Register the Post model with the admin site.
@admin.register(Post)
# Inherits from SummernoteModelAdmin for rich text editing
class PostAdmin(SummernoteModelAdmin):
    # Configure the list display in the admin panel to show these fields
    list_display = ('title', 'slug', 'status', 'created_on')
    # Enable searching within the title and content fields
    search_fields = ['title', 'content']
    # Automatically fill the slug field based on the title to avoid manual entry
    prepopulated_fields = {'slug': ('title',)}
    # Filter options.
    list_filter = ('status', 'created_on')
    # Specify which fields should use the Summernote rich-text editor
    summernote_fields = ('content',)

    fieldsets = (
        (None, {
            'fields': ('title', 'slug', 'author', 'status')
        }),
        ('Content', {
            'fields': ('content', 'keywords'),
            'classes': ('collapse',),
        }),
    )

# Register the Comment model with the admin site using a custom admin class
@admin.register(Comment)
class CommentAdmin(admin.ModelAdmin):
    # Configure the list display to show these specific fields for each comment
    list_display = ('user', 'body', 'post', 'created_on', 'approved')
    # Adjust or remove these fields based on your actual model definitions.
    search_fields = ['user', 'post']
    # Filter options.
    list_filter = ('approved', 'created_on')
    # Custom admin action to approve comments directly from the list view
    actions = ['approve_comments']

    # Define a custom action.
    def approve_comments(self, request, queryset):
        # Marks approved selected comments.
        queryset.update(approved=True)
    # Provide a short description for the action
    approve_comments.short_description = "Mark selected comments as approved"