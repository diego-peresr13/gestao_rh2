from django.shortcuts import render
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse_lazy, reverse
from django.views.generic import ListView, DetailView
from django.views.generic.edit import CreateView, DeleteView, UpdateView
from . import models
import uuid
from django.shortcuts import render, redirect, get_object_or_404

# Create your views here.
class GroupListView(LoginRequiredMixin, ListView):
    # template_name = 'group_list.html'
    context_object_name = 'groups'
    model = models.I001Group


class GroupDetailView(LoginRequiredMixin, DetailView):
    context_object_name = 'group_detail'
    model = models.I001Group

class GroupCreateView(LoginRequiredMixin, CreateView):
    # template_name = "group_form.html"
    model = models.I001Group
    fields = ['cod_grupo',
              'descricao']

    
    def form_valid(self, form):
        ## apenas recupera os dados do FORM mas não salva no banco de dados
        group = form.save(commit=False)
        group.control = uuid.uuid1()
        group.save()
        return super(GroupCreateView, self).form_valid(form)


class GroupUpdateView(LoginRequiredMixin, UpdateView):
    model = models.I001Group
    fields = ['cod_grupo',
              'descricao']

def delete_group(request, control):
    template = 'corporate/i001group_confirm_delete.html'
    group = get_object_or_404(models.I001Group, control=control)

    if request.method == 'POST':
        group.delete()
        return redirect('corporate:group-list')
    
    context = {"group": group}
    return render(request, template, context)