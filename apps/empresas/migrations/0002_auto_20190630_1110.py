# Generated by Django 2.2.2 on 2019-06-30 14:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('empresas', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='empresa',
            name='nome',
        ),
        migrations.AddField(
            model_name='empresa',
            name='bairro',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='empresa',
            name='cidade',
            field=models.CharField(blank=True, max_length=70, null=True),
        ),
        migrations.AddField(
            model_name='empresa',
            name='cnpj',
            field=models.CharField(blank=True, help_text='CNPJ da Empresa', max_length=14, null=True),
        ),
        migrations.AddField(
            model_name='empresa',
            name='complemento',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='empresa',
            name='endereco',
            field=models.TextField(blank=True, max_length=256, null=True),
        ),
        migrations.AddField(
            model_name='empresa',
            name='estado',
            field=models.CharField(blank=True, max_length=30, null=True),
        ),
        migrations.AddField(
            model_name='empresa',
            name='nome_fantasia',
            field=models.CharField(blank=True, help_text='Nome fantasia', max_length=100, null=True),
        ),
        migrations.AddField(
            model_name='empresa',
            name='num_end',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='empresa',
            name='razao_social',
            field=models.CharField(blank=True, help_text='Razão Social', max_length=100, null=True),
        ),
    ]
