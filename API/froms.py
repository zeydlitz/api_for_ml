from django.forms import ModelForm
from .models import heartd, EmailPost
from django import forms


class EmailPostForm(ModelForm):
    comments = forms.CharField(widget=forms.Textarea(attrs={"rows": 6, "cols": 22}))

    # def init(self,*args, **kwargs):
    #     super(EmailPostForm, self).__init__(*args, **kwargs)
    #     self.fields['commentss'].widget.attrs['rows'] = 6
    #     self.fields['comments'].widget.attrs['cols'] = 22
    #     # widgets = {'comments': forms.Textarea(attrs={'rows': 6,
    #     #                                            'cols': 22},), }
    class Meta:
        model = EmailPost
        fields = '__all__'


class MyForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(MyForm, self).__init__(*args, **kwargs)
        self.fields['age'].label = "Возраст"
        self.fields['age']
        self.fields['sex'].label = "Пол"
        self.fields['cp'].label = "Боль в груди"
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
        # widgets = {
        #     'age': forms.NumberInput(attrs={'class': 'form_l'}),
        #     'sex': forms.Select(attrs={'class': 'form_l'}),
        #     'cp': forms.Select(attrs={'class': 'form_l'}),
        #     'trestbps': forms.NumberInput(attrs={'class': 'form_l'}),
        #     'chol': forms.NumberInput(attrs={'class': 'form_l'}),
        #     'fbs': forms.Select(attrs={'class': 'form_l'}),
        #     'restecg': forms.Select(attrs={'class': 'form_l'}),
        #     'thalach': forms.NumberInput(attrs={'class': 'form'}),
        #     'exang': forms.Select(attrs={'class': 'form_l'}),
        #     'oldpeak': forms.NumberInput(attrs={'class': 'form_l'}),
        #     'slope': forms.NumberInput(attrs={'class': 'form_l'}),
        #     'ca': forms.Select(attrs={'class': 'form_l'}),
        #     'thal': forms.Select(attrs={'class': 'form_l'}),
        # }

    class Meta:
        model = heartd
        fields = '__all__'
        widgets = {
            'age': forms.NumberInput(attrs={'list':'datalist'}),
            'trestbps': forms.NumberInput(attrs={'list': 'datalist1'}),
            'chol': forms.NumberInput(attrs={'list': 'datalist2'}),
            'thalach': forms.NumberInput(attrs={'list': 'datalist3'})
        }
# exclude = 'firstname'
