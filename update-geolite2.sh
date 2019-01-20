#!/bin/bash
set -x

cd "$(dirname "$0")";
rm -rf GeoLite2-Country*
wget https://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz
tar zxvf GeoLite2-Country.tar.gz
cd GeoLite2-Country_*

if [ -z "$1" ]; then
    echo 'destination not specified'
else
    cp GeoLite2-Country.mmdb $1
fi
