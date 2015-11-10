"""bookDB URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
# -*- encoding: utf-8 -*-
from django.conf.urls import include, url
from django.contrib import admin
from BooksDB.views import show_books,book_details,book_delete,book_update,add_author,add_book
admin.autodiscover()
urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', show_books),
    url(r'^book_details/$', book_details),
    url(r'^book_delete/$', book_delete),
    url(r'^book_update/$', book_update),
    url(r'^add_author/$', add_author),
    url(r'^add_book/$', add_book),
        

        
]
