from django.contrib import admin
from .models import Order, OrderLineItem


# Define an admin interface of OrderLineItemAdminInLine model.
class OrderLineItemAdminInline(admin.TabularInline):
    model = OrderLineItem
    readonly_fields = ('lineitem_total',)


# Define an inline admin interface for Order model.
class OrderAdmin(admin.ModelAdmin):

    # Include OrderLineItemAdminInline allowing editing of Line Items.
    inlines = (OrderLineItemAdminInline,)

    # Define readonly fields.
    readonly_fields = ('order_number', 'date',
                       'delivery_cost', 'order_total',
                       'grand_total', 'original_bag', 'stripe_pid',)

    # Define layout of fields.
    fields = ('order_number', 'user_profile', 'date', 'full_name',
              'email', 'phone_number', 'country',
              'postcode', 'town_or_city', 'street_address1',
              'street_address2', 'county', 'delivery_cost',
              'order_total', 'grand_total', 'original_bag', 'stripe_pid',)

    # Define what fields to display.
    list_display = ('order_number', 'date', 'full_name',
                    'order_total', 'delivery_cost',
                    'grand_total',)

    # Set Default Ordering
    ordering = ('-date',)


# Register the Order model with the custom OrderAdmin
admin.site.register(Order, OrderAdmin)
