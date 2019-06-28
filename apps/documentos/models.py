from django.db import models

class Documento(models.Model):
    descricao = models.CharField(max_length=256)

    def __str__(self):
        return self.descricao
