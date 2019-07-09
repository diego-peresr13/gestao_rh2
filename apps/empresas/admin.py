from django.contrib import admin
from .models import Empresa


class EmpresaAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('razao_social',)}

admin.site.register(Empresa, EmpresaAdmin)



