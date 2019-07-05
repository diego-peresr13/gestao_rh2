from django.urls import path
from . import views

app_name = 'documentos'
urlpatterns = [
    path('', views.DocumentoListView.as_view(), name='list'),
    path('<int:pk>', views.DocumentoDetailView.as_view(), name='detail'),
    path('incluir/', views.DocumentoCreateView.as_view(), name='create'),
    path('deletar/<int:pk>', views.DocumentoDeleteView.as_view(), name='delete'),
]