# Generated by Django 2.2.3 on 2019-07-30 18:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('documentos', '0003_documento_arquivo'),
    ]

    operations = [
        migrations.AlterField(
            model_name='documento',
            name='arquivo',
            field=models.FileField(default=1, upload_to='documents/'),
            preserve_default=False,
        ),
    ]