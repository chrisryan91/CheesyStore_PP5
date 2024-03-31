from django import template

register = template.Library()

@register.filter(name='to_range')
def to_range(value, end):
    return range(value, int(end) + 1)