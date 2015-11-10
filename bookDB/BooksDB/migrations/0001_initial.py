# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Author',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('AuthorID', models.CharField(max_length=10)),
                ('Name', models.CharField(max_length=20)),
                ('Age', models.IntegerField(default=0)),
                ('Country', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='Book',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('Title', models.CharField(max_length=100)),
                ('Publisher', models.CharField(max_length=30)),
                ('PublishDate', models.DateField(null=True, blank=True)),
                ('ISBN', models.CharField(max_length=30)),
                ('Price', models.FloatField(max_length=10)),
                ('AuthorID', models.ForeignKey(to='BooksDB.Author')),
            ],
        ),
    ]
