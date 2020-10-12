from django.forms import ModelForm
from . models import heartd

class MyForm(ModelForm):
	class Meta:
		model=heartd
		fields = '__all__'
		#exclude = 'firstname'