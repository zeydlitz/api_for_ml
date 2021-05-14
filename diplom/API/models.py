from django.db import models
from django.urls import reverse
from django.core.validators import MaxValueValidator, MinValueValidator


class EmailPost(models.Model):
    name = models.CharField(max_length=25)
    email = models.EmailField()
    comments = models.TextField(null=True)


class physical(models.Model):
    Gender = (
        ('male', 'male'),
        ('female', 'female'),
        ('trans', 'trans')
    )
    self_emp = (
        ('No', 'No'),
        ('Yes', 'Yes')
    )
    family_his = (
        ('No', 'No'),
        ('Yes', 'Yes')
    )
    treatment = (
        ('No', 'No'),
        ('Yes', 'Yes')
    )
    remote_work = (
        ('No', 'No'),
        ('Yes', 'Yes')
    )
    tech_company = (
        ('No', 'No'),
        ('Yes', 'Yes')
    )
    obs_consequence = (
        ('No', 'No'),
        ('Yes', 'Yes')
    )
    mental_vs_physical = (
        ('No', 'No'),
        ('Yes', 'Yes'),
        ("Don't know", "Don't know")
    )
    anonymity = (
        ('No', 'No'),
        ('Yes', 'Yes'),
        ("Don't know", "Don't know")
    )
    seek_help = (
        ('No', 'No'),
        ('Yes', 'Yes'),
        ("Don't know", "Don't know")
    )
    wellness_program = (
        ('No', 'No'),
        ('Yes', 'Yes'),
        ("Don't know", "Don't know")
    )
    benefits = (
        ('No', 'No'),
        ('Yes', 'Yes'),
        ("Don't know", "Don't know")
    )
    phys_health_interview = (
        ('No', 'No'),
        ('Yes', 'Yes'),
        ("Maybe", "Maybe")
    )
    mental_health_interview = (
        ('No', 'No'),
        ('Yes', 'Yes'),
        ("Maybe", "Maybe")
    )
    care_opt = (
        ('No', 'No'),
        ('Yes', 'Yes'),
        ("Not sure", "Not sure")
    )
    phys_health_consequence = (
        ('No', 'No'),
        ('Yes', 'Yes'),
        ("Maybe", "Maybe")
    )
    mental_health_consequence = (
        ('No', 'No'),
        ('Yes', 'Yes'),
        ("Maybe", "Maybe")
    )
    work_interfere = (
        ("Don't know", "Don't know"),
        ("Never", 'Never'),
        ('Often', 'Often'),
        ('Rarely', 'Rarely'),
        ('Sometimes', 'Sometimes')
    )
    no_emp = (
        ('1-5', '1-5'),
        ('6-25', '6-25'),
        ('26-100', '26-100'),
        ('100-500', '100-500'),
        ('500-1000', '500-1000'),
        ('More than 1000', 'More than 1000')
    )
    leave = (
        ("Don't know", "Don't know"),
        ('Somewhat difficult', 'Somewhat difficult'),
        ('Somewhat easy', 'Somewhat easy'),
        ('Very difficult', 'Very difficult'),
        ('Very easy', 'Very easy'),
    )
    coworkers = (
        ('No', 'No'),
        ('Yes', 'Yes'),
        ("Some of them", "Some of them")
    )
    supervisor = (
        ('No', 'No'),
        ('Yes', 'Yes'),
        ("Some of them", "Some of them")
    )
    age_range = (
        ('0-20', '0-20'),
        ('21-30', '21-30'),
        ('31-65', '31-65'),
        ('66-100', '66-100')
    )

    age = models.PositiveSmallIntegerField(validators=[MaxValueValidator(79), MinValueValidator(0)])
    gender = models.CharField(choices=Gender, max_length=15)
    self_employed = models.CharField(choices=self_emp, max_length=15)
    family_history = models.CharField(choices=family_his, max_length=15)
    treatment = models.CharField(choices=treatment, max_length=15)
    work_interfere = models.CharField(choices=work_interfere, max_length=15)
    no_employees = models.CharField(choices=no_emp, max_length=20)
    remote_work = models.CharField(choices=remote_work, max_length=15)
    tech_company = models.CharField(choices=tech_company, max_length=15)
    benefits = models.CharField(choices=benefits, max_length=15)
    care_options = models.CharField(choices=care_opt, max_length=15)
    wellness_program = models.CharField(choices=wellness_program, max_length=15)
    seek_help = models.CharField(choices=seek_help, max_length=15)
    anonymity = models.CharField(choices=anonymity, max_length=15)
    leave = models.CharField(choices=leave, max_length=20)
    mental_health_consequence = models.CharField(choices=mental_health_consequence, max_length=15)
    phys_health_consequence = models.CharField(choices=phys_health_consequence, max_length=15)
    coworkers = models.CharField(choices=coworkers, max_length=15)
    supervisor = models.CharField(choices=supervisor, max_length=15)
    mental_health_interview = models.CharField(choices=mental_health_interview, max_length=15)
    phys_health_interview = models.CharField(choices=phys_health_interview, max_length=15)
    mental_vs_physical = models.CharField(choices=mental_vs_physical, max_length=15)
    obs_consequence = models.CharField(choices=obs_consequence, max_length=15)
    age_range = models.CharField(choices=age_range, max_length=15)

    def __str__(self):
        template = f'{self.age} {self.gender}'
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
    parent_mlalgorithm = models.ForeignKey(MLAlgorithm, on_delete=models.CASCADE, related_name="status")


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
