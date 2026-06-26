#!/bin/bash

cd /home/ubuntu/django-app

source venv/bin/activate

nohup python manage.py runserver 0.0.0.0:8000 > server.log 2>&1 &
