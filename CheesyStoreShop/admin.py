from django.contrib import admin
from .models import Product, Category, CheeseType, Origin, Rating

# ProductAdmin Configuration.
class ProductAdmin(admin.ModelAdmin):
    # Specify the fields to display in the admin list view.
    list_display = (
        'sku',
        'name',
        'category',
        'origin',
        'cheesetype',
        'rating',
        'image',
        'in_stock'
    )

# CategoryAdmin Configuration.
class CategoryAdmin(admin.ModelAdmin):
    # Display fields for categories to make navigation and identification easier.
    list_display = (
        'friendly_name',
        'name'
    )

# CheeseType Configuration.
class CheeseTypeAdmin(admin.ModelAdmin):
    # Configuration for CheeseType model to improve admin interface.
    list_display = (
        'friendly_name',
        'name'
    )

# Cheese Origin Configuration.
class OriginAdmin(admin.ModelAdmin):
    # Display fields for the admin model.
    list_display = (
        'friendly_name',
        'name'
    )

class RatingAdmin(admin.ModelAdmin):
    list_display = ('product', 'user', 'stars')
    list_filter = ('product', 'user')
    search_fields = ('product__name', 'user__username')

# Register the models and their admin classes
admin.site.register(Rating, RatingAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(Category, CategoryAdmin)
admin.site.register(CheeseType, CheeseTypeAdmin)
admin.site.register(Origin, OriginAdmin)