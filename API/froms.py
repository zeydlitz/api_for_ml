from django.forms import ModelForm
from .models import physical, EmailPost
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
        self.fields['gender'].label = "Пол"
        self.fields['self_employed'].label = "Самозанятость"
        self.fields['family_history'].label = "Психические заболевания в семье"
        self.fields['treatment'].label = "Вы обращались к врачу из-за проблем с психическим здоровьем?"
        self.fields['work_interfere'].label = "Считаете ли вы, что психическое здоровье мешает вашей работе и как часто?"
        self.fields['no_employees'].label = "Количество сотрудников в компании?"
        self.fields['remote_work'].label = "Вы находитесь на удаленной работе?"
        self.fields['tech_company'].label = "Работаете в технологической комапании?"
        self.fields[
            'benefits'].label = "Ваш работодатель предоставляет помощь для решения проблем с психическим здоровьем?"
        self.fields['care_options'].label = "Знаете ли вы виды этой помощи?"
        self.fields[
            'wellness_program'].label = "Ваш работодатель когда-либо обсуждал психическое здоровье как часть оздоровительной программы сотрудника?"
        self.fields[
            'seek_help'].label = "Ваш работодатель предоставляет ресурсы, чтобы узнать больше о проблемах психического здоровья и как обратиться за помощью?"
        self.fields[
            'anonymity'].label = "У вас есть возжомность анонимного решения проблем связанных с психическим здооврьем?"
        self.fields['leave'].label = "Насколько легко вам взять отпуск по болезни из-за психического расстройства?"
        self.fields[
            'mental_health_consequence'].label = "Считаете ли вы, что обсуждение проблемы психического здоровья с вашим работодателем будет иметь негативные последствия?"
        self.fields[
            'phys_health_consequence'].label = "Считаете ли вы, что обсуждение проблемы физического здоровья с вашим работодателем будет иметь негативные последствия?"
        self.fields['coworkers'].label = "Хотели бы вы обсудить проблему психического здоровья со своими коллегами?"
        self.fields[
            'supervisor'].label = "Хотели бы вы обсудить проблему психического здоровья со своим непосредственным руководителем?"
        self.fields[
            'mental_health_interview'].label = "Не могли бы вы поднять вопрос о психическом здоровье с потенциальным работодателем на собеседовании?"
        self.fields[
            'phys_health_interview'].label = "Не могли бы вы поднять вопрос о физическом здоровье с потенциальным работодателем на собеседовании?"
        self.fields[
            'mental_vs_physical'].label = "Считаете ли вы, что ваш работодатель относится к психическому здоровью так же серьезно, как и к физическому?"
        self.fields[
            'obs_consequence'].label = "Слышали ли вы или наблюдали ли вы о негативных последствиях для коллег с психическими расстройствами на вашем рабочем месте?"
        self.fields['age_range'].label = "Диапазон возраста"
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
        model = physical
        fields = '__all__'
        widgets = {
            'age': forms.NumberInput(attrs={'list': 'datalist'}),
        }
# exclude = 'firstname'
