from django import template

register = template.Library()

@register.filter
def split(value, delimiter):
    """Splits the string on the delimiter."""
    return value.split(delimiter)