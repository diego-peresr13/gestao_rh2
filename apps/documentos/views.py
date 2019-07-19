from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse_lazy, reverse
from django.views.generic import ListView, DetailView
from django.views.generic.edit import CreateView, DeleteView, UpdateView
from . import models
from django.shortcuts import render, redirect, get_object_or_404

class DocumentoListView(LoginRequiredMixin, ListView):
    context_object_name = 'documentos'
    model = models.Documento

class DocumentoDetailView(LoginRequiredMixin, DetailView):
    context_object_name = 'documento_detail'
    model = models.Documento

class DocumentoCreateView(LoginRequiredMixin, CreateView):
    model = models.Documento
    fields = ['descricao',
              'arquivo']

    def form_valid(self, form):
        ## apenas recupera os dados do FORM mas não salva no banco de dados
        documento = form.save(commit=False)
        documento.funcionario = models.Funcionario.objects.get(pk=self.kwargs['funcionario']) 
        documento.save()        
        return super(DocumentoCreateView, self).form_valid(form)              


def delete(request, pk):
    template = 'documento_confirm_delete.html'
    documento = get_object_or_404(models.Documento, pk=pk)
    funcionario = documento.funcionario.pk 

    if request.method == 'POST':
        documento.delete()
        return redirect('funcionarios:detail', pk=funcionario)
    
    context = {"documento": documento}
    return render(request, template, context)
