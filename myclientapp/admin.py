from django.contrib import admin

from myclientapp.models import Person


# Register your models here.

@admin.register(Person)
class PersonAdmin(admin.ModelAdmin):
    pass
