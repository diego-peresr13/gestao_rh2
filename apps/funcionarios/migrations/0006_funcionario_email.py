# Generated by Django 2.2.2 on 2019-07-03 13:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('funcionarios', '0005_auto_20190702_1731'),
    ]

    operations = [
        migrations.AddField(
            model_name='funcionario',
            name='email',
            field=models.EmailField(default=1, max_length=100, unique=True),
            preserve_default=False,
        ),
    ]