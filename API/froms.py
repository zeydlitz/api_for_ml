from django.forms import ModelForm
from .models import heartd
from django import forms


class MyForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(MyForm, self).__init__(*args, **kwargs)
        self.fields['age'].label = "Возраст"
        self.fields['sex'].label = "Пол"
        self.fields['cp'].label = "Уровень Боли"
        self.fields['trestbps'].label = "Артериальное давление"
        self.fields['chol'].label = "Холестерин"
        self.fields['fbs'].label = "Уровень сахара"
        self.fields['restecg'].label = "Результат кардиографии"
        self.fields['thalach'].label = "Максимльная частота пульса"
        self.fields['exang'].label = "Стенокардия"
        self.fields['oldpeak'].label = "Dep"
        self.fields['slope'].label = "Наклон"
        self.fields['ca'].label = "Количество крупных сосудов"
        self.fields['thal'].label = "Заболевание крови"

        widgets = {
            'age': forms.NumberInput(attrs={'class': 'form_l'}),
            'sex': forms.Select(attrs={'class': 'form_l'}),
            'cp': forms.Select(attrs={'class': 'form_l'}),
            'trestbps': forms.NumberInput(attrs={'class': 'form_l'}),
            'chol': forms.NumberInput(attrs={'class': 'form_l'}),
            'fbs': forms.Select(attrs={'class': 'form_l'}),
            'restecg': forms.Select(attrs={'class': 'form_l'}),
            'thalach': forms.NumberInput(attrs={'class': 'form'}),
            'exang': forms.Select(attrs={'class': 'form_l'}),
            'oldpeak': forms.NumberInput(attrs={'class': 'form_l'}),
            'slope': forms.NumberInput(attrs={'class': 'form_l'}),
            'ca': forms.Select(attrs={'class': 'form_l'}),
            'thal': forms.Select(attrs={'class': 'form_l'}),
        }

    class Meta:
        model = heartd
        fields = '__all__'
# exclude = 'firstname'
