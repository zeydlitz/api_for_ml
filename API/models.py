from django.db import models
from django.urls import reverse
from django.core.validators import MaxValueValidator, MinValueValidator

class EmailPost(models.Model):
    name = models.CharField(max_length=25)
    email = models.EmailField()
    comments = models.TextField(null=True)

class heartd(models.Model):
    pol = (
        ('Male', 'Male'),
        ('Female', 'Female')
    )
    chest_pain=(
        (1, 'Typical angina'),
        (2, 'Atypical angina'),
        (3, 'Non-anginal pain'),
        (4, 'Asymptomatic')
    )
    saxar=(
        (1,'Lower than 120mg/ml'),
        (0,'Greater than 120mg/ml')
    )
    rest=(
        (0, 'Normal'),
        (1, 'Having ST-T wave abnormality'),
        (2, 'Hypertrophy')
    )
    ang=(
        (1,True),
        (0,False)
    )
    number=(
        (1,'upsloping'),
        (2,'flat'),
        (3,'downsloping')
    )
    amount=(
        (1,1),
        (2,2),
        (3,3)
    )
    t=(
        (1,'Normal'),
        (2,'Fixed defect'),
        (3,'Reversable defect'),
        (4,'Nan')
    )

    age = models.PositiveSmallIntegerField(validators=[MaxValueValidator(79),MinValueValidator(20)])
    sex = models.CharField(choices=pol,max_length=7)
    cp = models.IntegerField(choices=chest_pain)
    trestbps = models.PositiveSmallIntegerField(validators=[MaxValueValidator(200),MinValueValidator(90)])
    chol = models.PositiveSmallIntegerField(validators=[MaxValueValidator(570),MinValueValidator(120)])
    fbs = models.IntegerField(choices=saxar)
    restecg = models.IntegerField(choices=rest)
    thalach = models.PositiveSmallIntegerField(validators=[MaxValueValidator(230),MinValueValidator(40)])
    exang = models.IntegerField(choices=ang)
    oldpeak = models.FloatField( validators=[MinValueValidator(0.0), MaxValueValidator(6.3)])
    slope = models.IntegerField(choices=number)
    ca = models.IntegerField(choices=amount)
    thal = models.IntegerField(choices=t)
    def __str__(self):
        template = f'{self.age} {self.sex}'
        return template

    def get_absolute_url(self):  # new
        return reverse('forms', args=[str(self.id)])

# Create your models here.

class Endpoint(models.Model):
    name = models.CharField(max_length=128)
    owner = models.CharField(max_length=128)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)

class MLAlgorithm(models.Model):
    name = models.CharField(max_length=128)
    description = models.CharField(max_length=1000)
    code = models.CharField(max_length=50000)
    version = models.CharField(max_length=128)
    owner = models.CharField(max_length=128)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    parent_endpoint = models.ForeignKey(Endpoint, on_delete=models.CASCADE)

class MLAlgorithmStatus(models.Model):
    status = models.CharField(max_length=128)
    active = models.BooleanField()
    created_by = models.CharField(max_length=128)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    parent_mlalgorithm = models.ForeignKey(MLAlgorithm, on_delete=models.CASCADE, related_name = "status")

class MLRequest(models.Model):
    input_data = models.CharField(max_length=10000)
    full_response = models.CharField(max_length=10000)
    response = models.CharField(max_length=10000)
    feedback = models.CharField(max_length=10000, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    parent_mlalgorithm = models.ForeignKey(MLAlgorithm, on_delete=models.CASCADE)

class ABTest(models.Model):
    title = models.CharField(max_length=10000)
    created_by = models.CharField(max_length=128)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    ended_at = models.DateTimeField(blank=True, null=True)
    summary = models.CharField(max_length=10000, blank=True, null=True)

    parent_mlalgorithm_1 = models.ForeignKey(MLAlgorithm, on_delete=models.CASCADE, related_name="parent_mlalgorithm_1")
    parent_mlalgorithm_2 = models.ForeignKey(MLAlgorithm, on_delete=models.CASCADE, related_name="parent_mlalgorithm_2")
