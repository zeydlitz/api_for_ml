from django.forms import ModelForm
from . models import heartd

class MyForm(ModelForm):
	def __init__(self,*args, **kwargs):
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
		self.fields['ca'].label = "Количество крупных сосудов"
		self.fields['thal'].label = "Заболевание крови"
		self.fields['slope'].label = "Наклон"
	class Meta:
		model=heartd
		fields = '__all__'
		#exclude = 'firstname'