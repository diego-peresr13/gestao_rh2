from django.db import models
from django.urls import reverse


class Empresa(models.Model):
    nome_fantasia = models.CharField(max_length=100, null=True, blank=True)
    razao_social = models.CharField(max_length=100)
    slug = models.SlugField('Atalho')
    cnpj = models.CharField(max_length=14)
    endereco = models.CharField(max_length=256, null=True, blank=True)
    num_end = models.IntegerField(null=True, blank=True)
    complemento = models.CharField(max_length=50, null=True, blank=True)
    bairro = models.CharField(max_length=50, null=True, blank=True)
    cidade = models.CharField(max_length=70, null=True, blank=True)
    estado = models.CharField(max_length=30, null=True, blank=True)

    def __str__(self):
        return self.razao_social

    def get_absolute_url(self):
        return reverse('empresas:detail', kwargs={'slug': self.slug})

    class Meta:
        ordering = ['razao_social']
