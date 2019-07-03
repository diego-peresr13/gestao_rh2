from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse_lazy
from django.views.generic import ListView, DetailView
from django.views.generic.edit import CreateView, DeleteView, UpdateView
from . import models

class DocumentoListView(LoginRequiredMixin, ListView):
    context_object_name = 'documentos'
    model = models.Documento

    def get_queryset(self):
        funcionario = self.request.user.funcionario
        return models.Documento.objects.filter(funcionario = funcionario)

class DocumentoDetailView(LoginRequiredMixin, DetailView):
    context_object_name = 'documento_detail'
    model = models.Documento

class DocumentoCreateView(LoginRequiredMixin, CreateView):
    model = models.Documento
    fields = ['descricao',
              'arquivo',
              'funcionario']

class DocumentoUpdateView(LoginRequiredMixin, UpdateView):
    model = models.Documento
    fields = ['descricao',
              'arquivo',
              'funcionario']

class DocumentoDeleteView(LoginRequiredMixin, DeleteView):
    model = models.Documento
    success_url = reverse_lazy('documentos:list')
