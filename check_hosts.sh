#!/bin/bash
# Verifica daca un host are o anumita adresa IP, folosind un server DNS

# Functia primeste 3 parametri: nume host, adresa IP, server DNS
verifica_ip() {
    host="$1"
    ip="$2"
    dns="$3"

    rezultat=$(dig +short @"$dns" "$host")

    if echo "$rezultat" | grep -qx "$ip"; then
        return 0
    else
        return 1
    fi
}

DNS="8.8.8.8"

while read -r ip host rest; do
    if [[ -z "$ip" || "$ip" == \#* ]]; then
        continue
    fi

    if verifica_ip "$host" "$ip" "$DNS"; then
        echo "OK: $host are adresa $ip"
    else
        echo "DIFERIT: $host nu are adresa $ip"
    fi
done < /etc/hosts
