from django.urls import path
from . import views

app_name = 'funcionarios'
urlpatterns = [
    path('', views.FuncionarioListView.as_view(), name='list'),
    path('<int:pk>', views.FuncionarioDetailView.as_view(), name='detail'),
    path('cadastrar/', views.FuncionarioCreateView.as_view(), name='create'),
    path('atualizar/<int:pk>', views.FuncionarioUpdateView.as_view(), name='update'),
    path('deletar/<int:pk>', views.FuncionarioDeleteView.as_view(), name='delete'),
]