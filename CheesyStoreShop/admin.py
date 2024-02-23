from django.contrib import admin
from .models import Product, Category, CheeseType, Origin

# Register your models here.

class ProductAdmin(admin.ModelAdmin):
    list_display = (
        'sku',
        'name',
        'category',
        'origin',
        'cheesetype',
        'rating',
        'image'
    )

class CategoryAdmin(admin.ModelAdmin):
    list_display = (
        'friendly_name',
        'name'
    )

class CheeseTypeAdmin(admin.ModelAdmin):
    list_display = (
        'friendly_name',
        'name'
    )

class OriginAdmin(admin.ModelAdmin):
    list_display = (
        'friendly_name',
        'name'
    )

admin.site.register(Product, ProductAdmin)
admin.site.register(Category, CategoryAdmin)
admin.site.register(CheeseType, CheeseTypeAdmin)
admin.site.register(Origin, OriginAdmin)