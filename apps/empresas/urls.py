from django.urls import path
from . import views

app_name = 'empresas'
urlpatterns = [
    path('', views.EmpresaListView.as_view(), name='list'),
    path('<slug>', views.EmpresaDetailView.as_view(), name='detail'),
    path('cadastrar/', views.EmpresaCreateView.as_view(), name='create'),
    path('atualizar/<slug>', views.EmpresaUpdateView.as_view(), name='update'),
    path('deletar/<slug>', views.EmpresaDeleteView.as_view(), name='delete'),
]
