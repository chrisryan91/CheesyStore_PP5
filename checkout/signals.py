from django.db.models.signals import post_save, post_delete
from django.dispatch import receiver

from .models import OrderLineItem

# Signal receiver that updates the order total whenever an OrderLineItem is saved.
@receiver(post_save, sender=OrderLineItem)
def update_on_save(sender, instance, created, **kwargs):
    # Call the update_total method on the related Order object
    # to recalculate the order total after saving an OrderLineItem
    instance.order.update_total()

# Signal receiver that updates the order total whenever an OrderLineItem is deleted.
@receiver(post_delete, sender=OrderLineItem)
def update_on_deletion(sender, instance, **kwargs):

    # Call the update_total method on the related Order object
    # to recalculate the order total after deleting an OrderLineItem
    instance.order.update_total()
