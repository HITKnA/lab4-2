# -*- coding: utf-8 -*-
"""
Created on Fri Nov 06 19:42:29 2015

@author: Kevinyyyx
"""

from django import forms
from models import Book
class AddBookForm(forms.ModelForm):
    class Meta:
        model = Book
        fields = "__all__"