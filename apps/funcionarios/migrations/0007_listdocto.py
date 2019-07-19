# Generated by Django 2.2.3 on 2019-07-19 13:32

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('funcionarios', '0006_funcionario_email'),
    ]

    operations = [
        migrations.CreateModel(
            name='ListDocto',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('descricao', models.CharField(max_length=256)),
                ('arquivo', models.FileField(blank=True, null=True, upload_to='documents/')),
                ('funcionario', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='funcionarios.Funcionario')),
            ],
        ),
    ]
