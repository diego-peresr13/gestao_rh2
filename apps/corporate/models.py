from django.db import models
from django.urls import reverse

# Create your models here.
class I001Group(models.Model):
    cod_grupo = models.CharField(max_length=3)   
    descricao = models.CharField(max_length=255)
    slug   = models.SlugField('Atalho')

    def __str__(self):
        return self.cod_grupo

    def get_absolute_url(self):
        return reverse('corporate:group-list')

class I002Company(models.Model):
    grupo_corp = models.ForeignKey(I001Group, related_name='empresas', on_delete=models.PROTECT)
    slug   = models.SlugField('Atalho')
    cod_empresa = models.CharField(max_length=3)
    cnpj = models.CharField(max_length=14)
    razao_social = models.CharField(max_length=255)
    chave_licenca = models.CharField(max_length=255, blank=True, null=True)
    data_fim_licenca = models.DateField(blank=True, null=True)
    ativo = models.CharField(max_length=1, blank=True, null=True)
    qtde_filiais = models.BigIntegerField()

    def __str__(self):
        return '%s - %s' % (self.cod_empresa, self.razao_social)

    # def __str__(self):
    #     return self.cod_empresa


    def get_absolute_url(self):
        return reverse('corporate:company-list')

  
class I003Branch(models.Model):
    empresa = models.ForeignKey(I002Company, on_delete=models.PROTECT)
    slug   = models.SlugField('Atalho')
    cod_filial = models.CharField(max_length=6)
    razao_social = models.CharField(max_length=60)
    matriz_filial = models.CharField(max_length=1, blank=True, null=True)
    cnpj = models.CharField(max_length=14)
    nire = models.CharField(max_length=14, blank=True, null=True)
    cnae = models.CharField(max_length=7, blank=True, null=True)
    inscr_estadual = models.CharField(max_length=14)
    cep = models.CharField(max_length=8, blank=True, null=True)
    endereco = models.CharField(max_length=60, blank=True, null=True)
    num_endereco = models.CharField(max_length=10, blank=True, null=True)
    compl_endereco = models.CharField(max_length=60, blank=True, null=True)
    bairro = models.CharField(max_length=60, blank=True, null=True)
    uf = models.CharField(max_length=2, blank=True, null=True)
    municipio =  models.CharField(max_length=50, blank=True, null=True)    
    cod_municipio = models.CharField(max_length=12, blank=True, null=True)    
    data_abertura = models.DateField(blank=True, null=True)
    ativo = models.CharField(max_length=1)    

    class Meta:
        unique_together = (('cod_filial', 'empresa'),)

    def __str__(self):
        return '%s: %s' % (self.cod_filial, self.razao_social)

    def get_absolute_url(self):
        return reverse('corporate:branch-list')