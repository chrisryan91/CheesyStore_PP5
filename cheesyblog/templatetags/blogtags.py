from django import template

register = template.Library()

# The @register.filter decorator registers the following function as a custom template filter.
@register.filter
def split(value, delimiter):
    # Splits the string.
    return value.split(delimiter)