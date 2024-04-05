from django import template

register = template.Library()


# The @register.filter decorator registers the function as a custom template.
@register.filter
def split(value, delimiter):
    # Splits the string.
    return value.split(delimiter)
