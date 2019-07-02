from django.db import models
from django.urls import reverse

from apps.funcionarios.models import Funcionario

class Documento(models.Model):
    descricao = models.CharField(max_length=256)
    funcionario = models.ForeignKey(Funcionario, on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return self.descricao

    def get_absolute_url(self):
        return reverse('documentos:detail', kwargs={'pk': self.pk})
