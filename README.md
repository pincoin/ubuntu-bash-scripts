# ufw
uncomplicated firewall management bash scripts

# Scripts
## geoip2.sh
* Deny from IPv4/IPv6 hosts by Countries
* `countries="1814991"`: China
* `countries="1814991|2017370"`: China, Russia
* `sudo bash geoip2.sh`

## ssh-postgres.sh
* Allow from trusted hosts
* `sudo bash ssh-postgres.sh allow 192.168.0.1`
* `sudo bash ssh-postgres.sh disallow 192.68.0.1`
