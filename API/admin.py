from django.contrib import admin
from .models import physical


# Register your models here.
@admin.register(physical)
class PostAdmin(admin.ModelAdmin):
    pass
    # list_display = ('Age', 'Gender')
    # list_filter = ('Age', 'Gender')
    # search_fields = ('age')
    # raw_id_fields = ('author')
    # date_hierarchy = 'publish'
    # ordering = ('status', 'publish')
