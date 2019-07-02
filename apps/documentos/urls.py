from django.urls import path
from . import views

app_name = 'documentos'
urlpatterns = [
    path('', views.DocumentoListView.as_view(), name='list'),
    path('<int:pk>', views.DocumentoDetailView.as_view(), name='detail'),
    path('cadastrar/', views.DocumentoCreateView.as_view(), name='create'),
    path('atualizar/<int:pk>', views.DocumentoUpdateView.as_view(), name='update'),
    path('deletar/<int:pk>', views.DocumentoDeleteView.as_view(), name='delete'),
]