from django import forms
from .models import Order

class OrderForm(forms.ModelForm):
    class Meta:
        model = Order  # Specifies the Django model to base the form on
        # Defines the fields from the model to be included in the form
        fields = ('full_name', 'email', 'phone_number',
                  'street_address1', 'street_address2',
                  'town_or_city', 'postcode', 'country',
                  'county',)

    def __init__(self, *args, **kwargs):
        # Override the default __init__ method to provide additional functionality
        super().__init__(*args, **kwargs)  # Call to the superclass's __init__ method
        # Define placeholders that will be shown in the form fields
        placeholders = {
            'full_name': 'Full Name',
            'email': 'Email Address',
            'phone_number': 'Phone Number',
            'postcode': 'Postal Code',
            'town_or_city': 'Town or City',
            'street_address1': 'Street Address 1',
            'street_address2': 'Street Address 2',
            'county': 'County, State or Locality',
        }

        self.fields['full_name'].widget.attrs['autofocus'] = True  # Autofocus on the first field
        for field in self.fields:
            if field != 'country':  # Exclude the 'country' field from custom styling
                if self.fields[field].required:
                    placeholder = f'{placeholders[field]} *'  # Add asterisk for required fields
                else:
                    placeholder = placeholders[field]
                self.fields[field].widget.attrs['placeholder'] = placeholder  # Set placeholder text
            self.fields[field].widget.attrs['class'] = 'stripe-style-input'  # Add CSS class for styling
            self.fields[field].label = False  # Hide the field's label
