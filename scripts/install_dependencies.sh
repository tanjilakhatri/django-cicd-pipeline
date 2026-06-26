#!/bin/bash

cd /home/ubuntu

sudo apt update

sudo apt install -y python3 python3-pip python3-venv

cd /home/ubuntu/django-app

python3 -m venv venv

source venv/bin/activate

pip install --upgrade pip

pip install -r requirements.txt

python manage.py migrate

python manage.py collectstatic --noinput
