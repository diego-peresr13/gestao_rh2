from django.urls import path
from . import views

app_name = 'departamentos'
urlpatterns = [
    path('', views.DepartamentoListView.as_view(), name='list'),
    path('<int:pk>', views.DepartamentoDetailView.as_view(), name='detail'),
    path('cadastrar/', views.DepartamentoCreateView.as_view(), name='create'),
    path('atualizar/<int:pk>', views.DepartamentoUpdateView.as_view(), name='update'),
    path('deletar/<int:pk>', views.DepartamentoDeleteView.as_view(), name='delete'),
]