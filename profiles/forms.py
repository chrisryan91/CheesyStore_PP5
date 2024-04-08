from django import forms
from .models import UserProfile


# Define a form for the UserProfile model using ModelForm as a base.
class UserProfileForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        exclude = ('user',)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        # Define placeholders for the form fields.
        placeholders = {
            'default_phone_number': 'Phone Number',
            'default_postcode': 'Postal Code',
            'default_town_or_city': 'Town or City',
            'default_street_address1': 'Street Address 1',
            'default_street_address2': 'Street Address 2',
            'default_county': 'County, State or Locality',
        }

        self.fields['default_phone_number'].widget.attrs['autofocus'] = True

        # Loop through the form fields to set their placeholders.
        for field in self.fields:
            # Skip default_country field.
            if field != 'default_country':
                if self.fields[field].required:
                    # Add a star to signify required.
                    placeholder = f'{placeholders[field]} *'
                else:
                    placeholder = placeholders[field]
                # Set the place holder attribute.
                self.fields[field].widget.attrs['placeholder'] = placeholder

            # Set CSS
            style = 'border-black rounded-0 profile-form-input'
            self.fields[field].widget.attrs['class'] = style

            # Remove fields label, except for the country field
            if field != 'default_country':  # Assuming 'country' is the name of your field
                self.fields[field].label = False
            else:
                # Explicitly set or reset the label for the country field here if needed
                self.fields['default_country'].label = 'Default country field'
