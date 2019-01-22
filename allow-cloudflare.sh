#!/bin/bash
set -x

ufw='/usr/sbin/ufw'

# Reset UFW
$ufw --force reset

# Delete backups
rm /etc/ufw/*.*.*_*

# Default Policy
$ufw default deny incoming
$ufw default allow outgoing

# Allow Nginx
$ufw --force enable
$ufw allow 'Nginx Full'

cd "$(dirname "$0")";
wget https://www.cloudflare.com/ips-v4 -O ipv4.txt
wget https://www.cloudflare.com/ips-v6 -O ipv6.txt

cat ipv4.txt ipv6.txt | xargs -t -I % $ufw allow from %

rm -f ipv4.txt ipv6.txt
