from django import forms
# Imports custom widget for clearable file inputs.
from .widgets import CustomClearableFileInput
from .models import Product, Category

# Form class for adding and editing products.
class ProductForms(forms.ModelForm):

    # Specifies the model to build the form field and include all fields from the model in the form.
    class Meta:
        model = Product
        exclude = ('sku',)

    # Customises image field to use a custom widgets.
    image = forms.ImageField(label='Image', required=False, widget=CustomClearableFileInput)

    # Custom initialisation to set up form fields.
    def __init__(self, *args, **kwargs):
        
        # Call to the superclass's __init__ method.
        super().__init__(*args, **kwargs)
        # Retrieve all Category instances and create a list of tuples for dropdown menu.
        categories = Category.objects.all()
        friendly_names = [(c.id, c.get_friendly_name()) for c in categories]

        # Set the category field to user-friendly names.
        self.fields['category'].choices = friendly_names
        # Iterate over the form fields and apply class styling.
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'border-black rounded-0'