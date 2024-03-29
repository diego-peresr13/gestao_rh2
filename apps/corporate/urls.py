from django.urls import path, include
from . import views

app_name = 'corporate'
urlpatterns = [    
    path('grupos/', views.GroupListView.as_view(), name='group-list'),    
    path('grupos/cadastrar/', views.GroupCreateView.as_view(), name='group-create'),
    path('grupos/atualizar/<slug>', views.GroupUpdateView.as_view(), name='group-update'),
    path('grupos/deletar/<slug>', views.delete_group, name='delete_group'),
    path('empresas/', views.CompanyListView.as_view(), name='company-list'),    
    path('empresas/cadastrar/', views.CompanyCreateView.as_view(), name='company-create'),
    path('empresas/atualizar/<slug>', views.CompanyUpdateView.as_view(), name='company-update'),
    path('empresas/deletar/<slug>', views.delete_company, name='delete_company'), 
    path('filiais/', views.BranchListView.as_view(), name='branch-list'),    
    path('filiais/cadastrar/', views.BranchCreateView.as_view(), name='branch-create'),
    path('filiais/atualizar/<slug>', views.BranchUpdateView.as_view(), name='branch-update'),
    path('filiais/deletar/<slug>', views.delete_branch, name='delete_branch'), 
    path('processo/', views.processoExec, name='processo'),
    path('processo/filterBranch/', views.FilterBranch, name='filterBranch'),
    path('processo/CallProcessoExec/', views.CallProcessoExec, name='CallProcessoExec'),
    path('processos/', views.ProcessoListView.as_view(), name='processos'),
]