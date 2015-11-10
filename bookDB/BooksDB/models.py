
# Create your models here.
from django.db import models

# Create your models here.
class Author(models.Model):
    AuthorID = models.CharField(max_length=10)
    Name = models.CharField(max_length=20)
    #email = models.EmailField(blank=True,verbose_name='e-mail' )
    Age = models.IntegerField(default=0)
    Country = models.CharField(max_length=30)
    def __unicode__(self):
       return self.Name

class Book(models.Model):
    Title = models.CharField(max_length=100)
    AuthorID = models.ForeignKey(Author)
    Publisher = models.CharField(max_length=30)
    PublishDate = models.DateField(blank=True, null=True)
    ISBN = models.CharField(max_length=30)
    Price = models.FloatField(max_length=10)
    
    def __unicode__(self):
       return self.Title