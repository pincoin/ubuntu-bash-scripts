#!/bin/bash

cd /path/to/root
source /path/to/venv/bin/activate
cd repo
git pull
pip install -r requirements.txt
python manage.py migrate --settings=conf.settings.production
python manage.py compilemessages --settings=conf.settings.production
python manage.py collectstatic --noinput --settings=conf.settings.production
