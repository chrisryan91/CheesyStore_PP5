from django.db import models
from django.conf import settings

    # Represents a category for the products.
class Category(models.Model):

    # Corrects to correct plural name for the admin display.
    class Meta:
        verbose_name_plural = 'Categories'

    # Official name and user-friendly name.
    name = models.CharField(max_length=254)
    friendly_name = models.CharField(max_length=254, null=True, blank=True)

    def __str__(self):
        # String representation of Category model.
        return self.name
    
    def get_friendly_name(self):
        # Return user-friendly name.
        return self.friendly_name

# Categorises by type of cheese.
class CheeseType(models.Model):

    # Official name of the model and user-friendly name.
    name = models.CharField(max_length=254)
    friendly_name = models.CharField(max_length=254, null=True, blank=True)

    def __str__(self):
        # String representation of CheeseType model.
        return self.name
    
    def get_friendly_name(self):
        # Return user-friendly name.
        return self.friendly_name
    
# Categorises by origin of cheese.
class Origin(models.Model):

    # Official name of the model and user-friendly name.
    name = models.CharField(max_length=254)
    friendly_name = models.CharField(max_length=254, null=True, blank=True)

    def __str__(self):
        # String representation of Origin model.
        return self.name
    
    def get_friendly_name(self):
        # Return user-friendly name.
        return self.friendly_name

# Model to represent each product for sale.
class Product(models.Model):
    # Category of the product.
    category = models.ForeignKey('Category', null=True, blank=True, on_delete=models.SET_NULL)
    # Type of cheese.
    cheesetype = models.ForeignKey('CheeseType', null=True, blank=True, on_delete=models.SET_NULL)
    # Origin of cheese.
    origin = models.ForeignKey('Origin', null=True, blank=True, on_delete=models.SET_NULL)
    sku = models.CharField(max_length=254, null=True, blank=True)
    name = models.CharField(max_length=254)
    description = models.TextField()
    price = models.DecimalField(max_digits=6, decimal_places=2)
    rating = models.DecimalField(max_digits=6, decimal_places=2, null=True, blank=True)
    in_stock = models.BooleanField(default=True, null=True, blank=True)
    image_url = models.URLField(max_length=1024, null=True, blank=True)
    image = models.ImageField(null=True, blank=True)

    def __str__(self):
        # String representation.
        return self.name
    
class Rating(models.Model):
    product = models.ForeignKey(Product, related_name='ratings', on_delete=models.CASCADE)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    stars = models.IntegerField()

    class Meta:
        unique_together = (('user', 'product'),)
        index_together = (('user', 'product'),)