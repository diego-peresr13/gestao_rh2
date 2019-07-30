# Generated by Django 2.2.3 on 2019-07-30 19:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='I001Group',
            fields=[
                ('grupo_corp', models.BigIntegerField(primary_key=True, serialize=False)),
                ('descricao', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='I002Company',
            fields=[
                ('empresa', models.BigIntegerField(primary_key=True, serialize=False)),
                ('cod_empresa', models.CharField(max_length=3)),
                ('cnpj', models.CharField(max_length=14)),
                ('razao_social', models.CharField(max_length=255)),
                ('chave_licenca', models.CharField(blank=True, max_length=255, null=True)),
                ('data_fim_licenca', models.DateField(blank=True, null=True)),
                ('ativo', models.CharField(blank=True, max_length=1, null=True)),
                ('qtde_filiais', models.BigIntegerField()),
                ('grupo_corp', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='empresas', to='corporate.I001Group')),
            ],
        ),
        migrations.CreateModel(
            name='I003Branch',
            fields=[
                ('filial', models.BigIntegerField(primary_key=True, serialize=False)),
                ('cod_filial', models.CharField(max_length=6)),
                ('razao_social', models.CharField(max_length=60)),
                ('matriz_filial', models.CharField(blank=True, max_length=1, null=True)),
                ('cnpj', models.CharField(max_length=14)),
                ('nire', models.CharField(blank=True, max_length=14, null=True)),
                ('cnae', models.CharField(blank=True, max_length=7, null=True)),
                ('inscr_estadual', models.CharField(max_length=14)),
                ('cep', models.CharField(blank=True, max_length=8, null=True)),
                ('endereco', models.CharField(blank=True, max_length=60, null=True)),
                ('num_endereco', models.CharField(blank=True, max_length=10, null=True)),
                ('compl_endereco', models.CharField(blank=True, max_length=60, null=True)),
                ('bairro', models.CharField(blank=True, max_length=60, null=True)),
                ('uf', models.CharField(blank=True, max_length=2, null=True)),
                ('municipio', models.CharField(blank=True, max_length=50, null=True)),
                ('cod_municipio', models.CharField(blank=True, max_length=12, null=True)),
                ('data_abertura', models.DateField(blank=True, null=True)),
                ('ativo', models.CharField(max_length=1)),
                ('empresa', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='filiais', to='corporate.I002Company')),
            ],
            options={
                'unique_together': {('cod_filial', 'empresa')},
            },
        ),
    ]