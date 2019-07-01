from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponseRedirect
from django.template.defaultfilters import slugify
from django.urls import reverse_lazy
from django.views.generic import ListView, DetailView
from django.views.generic.edit import CreateView, DeleteView, UpdateView
from . import models

class EmpresaListView(LoginRequiredMixin, ListView):
    context_object_name = 'empresas'
    model = models.Empresa

class EmpresaDetailView(LoginRequiredMixin, DetailView):
    context_object_name = 'empresa_detail'
    model = models.Empresa

    def get_context_data(self, **kwargs):
        s = models.Empresa.objects.get(slug=self.kwargs['slug'])
        context = super().get_context_data(**kwargs)
        context['empresa_detail'] = s
        return context


class EmpresaCreateView(LoginRequiredMixin, CreateView):
    model = models.Empresa
    fields = ['nome_fantasia',
              'razao_social',
              'cnpj',
              'endereco',
              'num_end',
              'complemento',
              'bairro',
              'cidade',
              'estado']

    def form_valid(self, form):
        self.object = form.save()
        self.object.slug = slugify(self.object.razao_social)
        self.object.save()
        return HttpResponseRedirect(self.get_success_url())


class EmpresaUpdateView(LoginRequiredMixin, UpdateView):
    model = models.Empresa
    fields = ['nome_fantasia',
              'endereco',
              'num_end',
              'complemento',
              'bairro',
              'cidade',
              'estado']


class EmpresaDeleteView(LoginRequiredMixin, DeleteView):
     model = models.Empresa
     success_url = reverse_lazy('empresas:list')
