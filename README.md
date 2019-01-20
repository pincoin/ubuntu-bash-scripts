# ufw
uncomplicated firewall management bash scripts

# Scripts
## geolite2.sh
Deny from IPv4/IPv6 hosts by Countries

### Variables
* `countries="1814991"`: China
* `countries="1814991|2017370"`: China, Russia

### Run
```
sudo bash geolite2.sh
```

### Crontab Example
2:10 AM 15th of every month 

```
10 2 15 * * /bin/bash /path/to/geolite2.sh
```

## allow-whitelist.sh
Allow/Disallow from whitelist

### Variables
Change the following default ports into your private ports
```
PORTS=("22" "5432")
```

### Run
Allow
```
sudo bash allow-whitelist.sh allow 192.168.0.1
```

Disallow
```
sudo bash allow-whitelist.sh disallow 192.68.0.1
```
