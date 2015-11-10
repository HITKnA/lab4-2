#!/user/bin/python
# -*- encoding: utf-8 -*-
from django.shortcuts import render,get_object_or_404,render_to_response
from django.http import HttpResponseRedirect
# Create your views here.
from .models import Book,Author


def show_books(request):
    
    books_list = Book.objects.order_by('AuthorID')
    '''
    context = {'books_list': books_list}
    return render(request, 'show_books.html', context)
    '''
    
         
    errors = []
    if 'q' in request.GET:
        q = request.GET['q']
        if not q:
            errors.append('Enter a search term.')
        elif len(q) > 20:
            errors.append('Please enter at most 20 characters.')
        else:
            search_author = Author.objects.filter(Name__icontains=q)
            
            if  len(search_author) == 0 :
                errors.append('there is no such author named '+q)
                books_list = []
            else:            
                for author in search_author:                    
                    books_list = Book.objects.filter(AuthorID = author.AuthorID)    
                    if len(books_list) == 0:                        
                        books_list = []
                        errors.append(q+" has no books")
                        
            return render(request,'show_books.html',
                                  {'books_list': books_list,'errors':errors, 'query': q})
    return render(request,'show_books.html',
                              {'books_list': books_list,'errors': errors})
                                  
def book_details(request):
    bookID = request.GET['id']
    book = Book.objects.get(id=bookID)
    author = book.AuthorID.Name 
    return render_to_response('book_details.html',locals())
    
def book_delete(request):
    
    if 'id' in request.GET:
        ID = request.GET['id']
        book = Book.objects.get(id=ID)
        book_Title = book.Title
        book.delete()
    return render_to_response ('delete.html',locals())

def book_update(request):
    if 'id' in request.GET:
        ID = request.GET['id']
        book = Book.objects.get(id=ID)
       
    if 'name' in request.GET:   
        name = request.GET['name']
        
        try:
                author = Author.objects.get(Name=name)
        except:
                add_author(request)
                return render_to_response('update.html',locals())
        else:
                book.AuthorID = author 
                book.Publisher = request.GET['publisher']
                book.Title = request.GET['title']
                book.PublishDate = request.GET['publishdate']
                book.Price = request.GET['price']
                book.save()
            
    return render_to_response('update.html',locals())


def add_author(request):
    if 'id' in request.GET:
        book = Book.objects.get(id=request.GET['id'])
    if 'AuthorID' in request.GET:
        if not (len(request.GET['AuthorID']) == 0 or len(request.GET['Name'])==0 or len(request.GET['Age'])==0 or len(request.GET['Country'])==0):
            Author.objects.create(
                AuthorID = request.GET['AuthorID'],
                Name = request.GET['Name'],
                Age = request.GET['Age'],
                Country = request.GET['Country'],
                )
            return HttpResponseRedirect("../../add_author/",locals())
    return render_to_response('add_author.html',locals())


from BooksDB.form import AddBookForm
from django import forms
def add_book(request):
    if 'success' in request.GET:
        is_success = True
    if  request.method == 'GET':
        book_form = AddBookForm(request.GET)    
        if book_form.is_valid():        
            book_form.save()            
            return HttpResponseRedirect("../../add_book/?success=1",locals())
            
    else:
        book_form = AddBookForm()
    return render_to_response('add_book.html',locals())