# Generated by Django 3.1.1 on 2020-10-21 10:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('API', '0005_auto_20201018_2200'),
    ]

    operations = [
        migrations.CreateModel(
            name='EmailPost',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=25)),
                ('email', models.EmailField(max_length=254)),
                ('comments', models.TextField(null=True)),
            ],
        ),
        migrations.AlterField(
            model_name='heartd',
            name='sex',
            field=models.CharField(choices=[('Male', 'Male'), ('Female', 'Female')], max_length=7),
        ),
    ]