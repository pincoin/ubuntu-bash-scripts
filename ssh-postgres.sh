#!/bin/bash
set -x

PORTS=("22" "5432")

if [ $# -eq 2 ]; then
    if [ "$1" = "allow" ]; then
        for port in ${PORTS[@]}; do
            ufw allow from $2 to any port $port proto tcp
        done
    elif [ "$1" = "disallow" ]; then
        for port in ${PORTS[@]}; do
            ufw delete allow from $2 to any port $port proto tcp
        done
    fi
fi
