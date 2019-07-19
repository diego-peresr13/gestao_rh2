from django.urls import path
from . import views

app_name = 'documentos'
urlpatterns = [
    path('<funcionario>', views.DocumentoListView.as_view(), name='list'),
    path('<int:pk>', views.DocumentoDetailView.as_view(), name='detail'),
    path('incluir/<funcionario>', views.DocumentoCreateView.as_view(), name='create'),
    path('deletar/<int:pk>', views.delete, name='delete'),
]