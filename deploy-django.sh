#!/bin/bash

sudo -u $1 -H bash -C 'update.sh'
sudo kill -HUP `cat /path/to/run/uwsgi.pid`
# systemctl restart uwsgi
