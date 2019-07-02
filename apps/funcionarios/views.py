from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse_lazy
from django.views.generic import ListView, DetailView
from django.views.generic.edit import CreateView, DeleteView, UpdateView
from . import models

class FuncionarioListView(LoginRequiredMixin, ListView):
    context_object_name = 'funcionarios'
    model = models.Funcionario

class FuncionarioDetailView(LoginRequiredMixin, DetailView):
    context_object_name = 'funcionario_detail'
    model = models.Funcionario

class FuncionarioCreateView(LoginRequiredMixin, CreateView):
    model = models.Funcionario
    fields = ['nome',
              'user',
              'departamento',
              'empresa']

class FuncionarioUpdateView(LoginRequiredMixin, UpdateView):
    model = models.Funcionario
    fields = ['nome',
              'departamento']

class FuncionarioDeleteView(LoginRequiredMixin, DeleteView):
    model = models.Funcionario
    success_url = reverse_lazy('funcionarios:list')
