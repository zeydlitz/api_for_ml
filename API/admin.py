from django.contrib import admin
from .models import heartd
# Register your models here.
@admin.register(heartd)
class PostAdmin(admin.ModelAdmin):
    list_display = ('age', 'sex', 'cp', 'trestbps', 'chol')
    list_filter = ('age', 'sex', 'cp', 'trestbps', 'chol')
    # search_fields = ('age')
    # raw_id_fields = ('author')
    # date_hierarchy = 'publish'
    # ordering = ('status', 'publish')