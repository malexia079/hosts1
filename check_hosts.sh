#!/bin/bash
# Verifica adresele IP din /etc/hosts

while read -r ip host rest; do
    if [[ -z "$ip" || "$ip" == \#* ]]; then
        continue
    fi

    if [[ "$ip" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo "OK: $ip ($host)"
    else
        echo "INVALID: $ip ($host)"
    fi
done < /etc/hosts
