# Generated by Django 3.2.23 on 2024-03-29 22:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cheesyblog', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='post',
            name='keywords',
            field=models.TextField(blank=True, help_text='Enter specific comma-separated SEO keywords'),
        ),
    ]
