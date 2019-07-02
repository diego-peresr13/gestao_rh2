from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse_lazy, reverse
from django.views.generic import ListView, DetailView
from django.views.generic.edit import CreateView, DeleteView, UpdateView
from . import models

class DepartamentoListView(LoginRequiredMixin, ListView):
    context_object_name = 'departamentos'
    model = models.Departamento

class DepartamentoDetailView(LoginRequiredMixin, DetailView):
    context_object_name = 'departamento_detail'
    model = models.Departamento

class DepartamentoCreateView(LoginRequiredMixin, CreateView):
    model = models.Departamento
    fields = ['nome',
              'empresa']


class DepartamentoUpdateView(LoginRequiredMixin, UpdateView):
    model = models.Departamento
    fields = ['nome',
              'empresa']

class DepartamentoDeleteView(LoginRequiredMixin, DeleteView):
    model = models.Departamento
    success_url = reverse_lazy('departamentos:list')


