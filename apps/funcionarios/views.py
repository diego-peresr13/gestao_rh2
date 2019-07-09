from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.models import User
from django.urls import reverse_lazy
from django.views.generic import ListView, DetailView
from django.views.generic.edit import CreateView, DeleteView, UpdateView
from . import models

class FuncionarioListView(LoginRequiredMixin, ListView):
    context_object_name = 'funcionarios'
    model = models.Funcionario

    def get_queryset(self):
        empresa_session = self.request.user.funcionario.empresa
        return models.Funcionario.objects.filter(empresa = empresa_session)

class FuncionarioDetailView(LoginRequiredMixin, DetailView):
    context_object_name = 'funcionario_detail'
    model = models.Funcionario

class FuncionarioCreateView(LoginRequiredMixin, CreateView):
    model = models.Funcionario
    fields = ['nome',
              'email',
              'departamento']

    def form_valid(self, form):
        ## apenas recupera os dados do FORM mas não salva no banco de dados
        funcionario = form.save(commit=False)
        username = funcionario.email
        funcionario.empresa = self.request.user.funcionario.empresa
        funcionario.user = User.objects.create(username=username)
        funcionario.save()
        return super(FuncionarioCreateView, self).form_valid(form)


class FuncionarioUpdateView(LoginRequiredMixin, UpdateView):
    model = models.Funcionario
    fields = ['nome',
              'departamento']

class FuncionarioDeleteView(LoginRequiredMixin, DeleteView):
    model = models.Funcionario
    success_url = reverse_lazy('funcionarios:list')
