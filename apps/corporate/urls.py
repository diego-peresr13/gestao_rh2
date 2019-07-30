from django.urls import path
from . import views

app_name = 'corporate'
urlpatterns = [
    path('', views.GroupListView.as_view(), name='group-list'),
    path('<int:pk>', views.GroupDetailView.as_view(), name='group-detail'),
    path('cadastrar/', views.GroupCreateView.as_view(), name='group-create'),
    path('atualizar/<int:pk>', views.GroupUpdateView.as_view(), name='group-update'),
    # path('deletar/<uuid:control>', views.GroupDeleteView.as_view(), name='group-delete'),
    path('deletar/<uuid:control>', views.delete_group, name='delete_group'),
]