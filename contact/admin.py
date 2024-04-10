from django.contrib import admin

# Register your models here.

from django.contrib import admin
from .models import ContactMessage

class ContactMessageAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', 'created_at')
    list_filter = ('created_at',)
    search_fields = ('name', 'email', 'message')
    date_hierarchy = 'created_at'
    readonly_fields = ('name', 'email', 'message', 'created_at')

    def has_add_permission(self, request, obj=None):
        # Disable adding new messages through the admin
        return False

    def has_delete_permission(self, request, obj=None):
        # Optionally, disable deleting messages through the admin
        return True

admin.site.register(ContactMessage, ContactMessageAdmin)