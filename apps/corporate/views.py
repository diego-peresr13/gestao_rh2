from django.shortcuts import render
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse_lazy, reverse
from django.views.generic import ListView, DetailView
from django.views.generic.edit import CreateView, UpdateView
from . import models
import uuid
from django.shortcuts import render, redirect, get_object_or_404
from django.template.defaultfilters import slugify
from . import forms
from django.core import serializers
from django.http import HttpResponse
import json

# i001Group
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
        group.slug = slugify(uuid.uuid1())
        group.save()
        return super(GroupCreateView, self).form_valid(form)


class GroupUpdateView(LoginRequiredMixin, UpdateView):
    context_object_name = 'group-update'
    model = models.I001Group
    fields = ['cod_grupo',
              'descricao']

    def get_context_data(self, **kwargs):
        # s = models.I001Group.objects.get(slug=self.kwargs['slug'])
        s = get_object_or_404(models.I001Group, slug=self.kwargs['slug'])
        context = super().get_context_data(**kwargs)
        context['group-update'] = s
        return context


def delete_group(request, slug):
    template = 'corporate/i001group_confirm_delete.html'
    group = get_object_or_404(models.I001Group, slug=slug)

    if request.method == 'POST':
        group.delete()
        return redirect('corporate:group-list')
    
    context = {"group": group}
    return render(request, template, context)

# i002Company
class CompanyListView(LoginRequiredMixin, ListView):
    # template_name = 'group_list.html'
    context_object_name = 'company_list'
    model = models.I002Company


class CompanyDetailView(LoginRequiredMixin, DetailView):
    context_object_name = 'company_detail'
    model = models.I002Company

class CompanyCreateView(LoginRequiredMixin, CreateView):
    # template_name = "group_form.html"
    model = models.I002Company
    fields = ['cod_empresa',
              'grupo_corp',
              'cnpj',
              'razao_social',
              'data_fim_licenca',
              'ativo',
              'qtde_filiais',]
    
    def form_valid(self, form):
        ## apenas recupera os dados do FORM mas não salva no banco de dados
        company = form.save(commit=False)
        company.slug = slugify(uuid.uuid1())
        company.save()
        return super(CompanyCreateView, self).form_valid(form)


class CompanyUpdateView(LoginRequiredMixin, UpdateView):
    context_object_name = 'company-update'
    model = models.I002Company
    fields = ['cod_empresa',
              'grupo_corp',
              'cnpj',
              'razao_social',
              'data_fim_licenca',
              'ativo',
              'qtde_filiais',]

    def get_context_data(self, **kwargs):        
        s = get_object_or_404(models.I002Company, slug=self.kwargs['slug'])
        context = super().get_context_data(**kwargs)
        context['company-update'] = s
        return context


def delete_company(request, slug):
    template = 'corporate/i002company_confirm_delete.html'
    company = get_object_or_404(models.I002Company, slug=slug)

    if request.method == 'POST':
        company.delete()
        return redirect('corporate:company-list')
    
    context = {"company": company}
    return render(request, template, context)

# I003Branch
class BranchListView(LoginRequiredMixin, ListView):
    # template_name = 'group_list.html'
    context_object_name = 'branch_list'
    model = models.I003Branch


class BranchDetailView(LoginRequiredMixin, DetailView):
    context_object_name = 'branch_detail'
    model = models.I003Branch

class BranchCreateView(LoginRequiredMixin, CreateView):
    # template_name = "group_form.html"
    model = models.I003Branch
    fields = ['cod_filial',
              'empresa',
              'cnpj',
              'razao_social',
              'cnae',
              'inscr_estadual',
              'data_abertura',
              'cep',
              'endereco',
              'num_endereco',
              'compl_endereco',
              'bairro',
              'uf',
              'municipio',
              'cod_municipio',
               ]

    def form_valid(self, form):
        ## apenas recupera os dados do FORM mas não salva no banco de dados
        branch = form.save(commit=False)
        branch.slug = slugify(uuid.uuid1())
        branch.save()
        return super(BranchCreateView, self).form_valid(form)


class BranchUpdateView(LoginRequiredMixin, UpdateView):
    context_object_name = 'branch-update'
    model = models.I003Branch
    fields = ['cod_filial',
              'empresa',
              'cnpj',
              'razao_social',
              'cnae',
              'inscr_estadual',
              'data_abertura',
              'cep',
              'endereco',
              'num_endereco',
              'compl_endereco',
              'bairro',
              'uf',
              'municipio',
              'cod_municipio',
               ]

    def get_context_data(self, **kwargs):        
        s = get_object_or_404(models.I003Branch, slug=self.kwargs['slug'])
        context = super().get_context_data(**kwargs)
        context['branch-update'] = s
        return context


def delete_branch(request, slug):
    template = 'corporate/i003branch_confirm_delete.html'
    branch = get_object_or_404(models.I003Branch, slug=slug)

    if request.method == 'POST':
        branch.delete()
        return redirect('corporate:branch-list')
    
    context = {"branch": branch}
    return render(request, template, context)    


def processoExec(request):
    template = 'corporate/process_form.html'
    companies = models.I002Company.objects.all() # pylint: disable=no-member
    return render(request, template, {'companies': companies})

def FilterBranch(request):
    companyId = request.GET['param'] 
    company = get_object_or_404(models.I002Company, id=companyId)

    qs_json = serializers.serialize('json', company.i003branch_set.all())
    return HttpResponse(qs_json, content_type='application/json')
