#!/bin/bash
set -x

# China, Russia
# countries="1814991|2017370"

# China
countries="1814991"

date > started.txt

# Reset UFW
ufw reset

# Delete backups
rm /etc/ufw/*.*.*_*

# Allow Nginx
ufw enable
ufw allow 'Nginx Full'

# Download GeoLite2 and Unzip
rm -rf GeoLite2-Country-CSV*
wget https://geolite.maxmind.com/download/geoip/database/GeoLite2-Country-CSV.zip
unzip GeoLite2-Country-CSV.zip

cd GeoLite2-Country-CSV_*

# Block IPv4
grep -E $countries GeoLite2-Country-Blocks-IPv4.csv | awk -F ',' '{print $1}' | xargs -t -I % sudo ufw insert 1 deny from % to any

# Block IPv6
position=$(ufw status numbered | grep '(v6)' | awk 'NR>1{print $1}' RS=[ FS=] | sort -n | head -1)
grep -E $countries GeoLite2-Country-Blocks-IPv6.csv | awk -F ',' '{print $1}' | xargs -t -I % sudo ufw insert $position deny from % to any

ufw status numbered

date > finished.txt