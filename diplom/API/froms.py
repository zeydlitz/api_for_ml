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
        self.fields['family_history'].label = "Заболевания в семье"
        self.fields['treatment'].label = "Проходили лечение?"
        self.fields['work_interfere'].label = "Если у вас есть психическое заболевание, считаете ли вы, что оно мешает вашей работе?"
        self.fields['no_employees'].label = "How many employees does your company or organization have?"
        self.fields['remote_work'].label = "Вы находитесь на удаленке?"
        self.fields['tech_company'].label = "Работаете в тех. комапании?"
        self.fields['benefits'].label = "Ваш работодатель предоставляет преимущества психического здоровья?"
        self.fields['care_options'].label = "Знаете ли вы варианты психического здоровья вашего работодателя?"
        self.fields['wellness_program'].label = "Ваш работодатель когда-либо обсуждал психическое здоровье как часть программы Wellness сотрудника?"
        self.fields['seek_help'].label = "Ваш работодатель предоставляет ресурсы, чтобы узнать больше о проблемах психического здоровья и как обратиться за помощью?"
        self.fields['anonymity'].label = "Анонимнсоть заболевания"
        self.fields['leave'].label = "Получение отдыха из-за заболевания"
        self.fields['mental_health_consequence'].label = "Do you think that discussing a mental health issue with your employer would have negative consequences?"
        self.fields['phys_health_consequence'].label = "Do you think that discussing a physical health issue with your employer would have negative consequences?"
        self.fields['coworkers'].label = "Would you be willing to discuss a mental health issue with your coworkers?"
        self.fields['supervisor'].label = "Would you be willing to discuss a mental health issue with your direct supervisor(s)?"
        self.fields['mental_health_interview'].label = "Would you bring up a mental health issue with a potential employer in an interview?"
        self.fields['phys_health_interview'].label = "Would you bring up a physical health issue with a potential employer in an interview?"
        self.fields['mental_vs_physical'].label = "Do you feel that your employer takes mental health as seriously as physical health?"
        self.fields['obs_consequence'].label = "Have you heard of or observed negative consequences for coworkers with mental health conditions in your workplace?"
        self.fields['age_range'].label = "age_range"
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
        # widgets = {
        #     'age': forms.NumberInput(attrs={'list':'datalist'}),
        #     'trestbps': forms.NumberInput(attrs={'list': 'datalist1'}),
        #     'chol': forms.NumberInput(attrs={'list': 'datalist2'}),
        #     'thalach': forms.NumberInput(attrs={'list': 'datalist3'})
        # }
# exclude = 'firstname'
