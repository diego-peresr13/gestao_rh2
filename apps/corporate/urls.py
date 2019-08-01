from django.urls import path
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
]