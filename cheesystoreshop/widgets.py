from django.forms.widgets import ClearableFileInput
from django.utils.translation import gettext_lazy as _


# Define a custom widget that extends Django's ClearableFileInput widget.
class CustomClearableFileInput(ClearableFileInput):
    clear_checkbox_label = _('Remove')
    initial_text = _('Current Image')
    input_text = _('')
    name = 'products/custom_widget_templates/custom_clearable_file_input.html'
    template_name = name
