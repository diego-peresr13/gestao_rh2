from django import forms
from .models import I002Company, I003Branch


class ProcessForm(forms.Form):
    empresa = forms.ModelChoiceField(
        queryset=I002Company.objects.all(),  # pylint: disable=no-member
        label=u"Empresa",
        # widget=ModelSelect2Widget(
        #     model=I002Company,
        #     search_fields=['cod_empresa_icontains'],
        # )
    )

    filial = forms.ModelChoiceField(
        queryset=I003Branch.objects.all(),  # pylint: disable=no-member
        label=u"Filial",
        # widget=ModelSelect2Widget(
        #     model=I003Branch,
        #     search_fields=['cod_filial__icontains'],
        #     dependent_fields={'empresa': 'empresa'},
        #     max_results=500,
        # )
    )

    data_ini = forms.DateField(label=u"Data Inicial",
                               widget=forms.DateInput(
                                   format='%d/%m/%Y', attrs={'type': 'date'}),
                               input_formats=('%d/%m/%Y', ))
    data_fim = forms.DateField(label=u"Data Final",
                               widget=forms.DateInput(
                                   format='%d/%m/%Y', attrs={'type': 'date'}),
                               input_formats=('%d/%m/%Y', ))