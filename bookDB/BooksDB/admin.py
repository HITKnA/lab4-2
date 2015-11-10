
# Register your models here.
from django.contrib import admin
from BooksDB.models import  Author, Book


class AuthorAdmin(admin.ModelAdmin):
    list_display = ('Name',)
    search_fields = ('Name',)
    
class BookAdmin(admin.ModelAdmin):
    list_display = ('Title', 'PublishDate')
    list_filter = ('PublishDate',)
    date_hierarchy = 'PublishDate'
    #filter_horizontal = ('Authors',)
   
#admin.site.register(Publisher)
admin.site.register(Author,AuthorAdmin)
admin.site.register(Book,BookAdmin)