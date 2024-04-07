#!/bin/bash

# Trova le righe contenenti "{{ authelia_host }} {{ wireguard_host }}" e aggiunge "yyy.yy"
#sed -i '/{{ authelia_host }} {{ wireguard_host }}/s/$/ vps.ovok.it/' roles/bunkerweb/templates/env.j2

# Trova la riga "# Adguard" e aggiunge prima di essa le nuove righe
#sed -i '/# Adguard/i\# Test\n\
#vps.ovok.it_REVERSE_PROXY_URL=/\n\
#vps.ovok.it_REVERSE_PROXY_HOST=http://vps:8080' roles/bunkerweb/templates/env.j2

# Esegui il comando docker run
#myTestContainer=$(sudo docker run --rm -dit --network wg_network --name vps -p 8080:80 -v "./htdocs":/usr/local/apache2/htdocs/ httpd:2.4)
#docker run --rm -dit --network my_network --name vps -p 8080:80 -v "$(pwd)/../htdocs/myfile.txt":/usr/local/apache2/htdocs/index.html httpd:2.4

# Esegui il comando bash bootstrap.sh
bash bootstrap.sh

# Ottieni informazioni sulla rete my_network e sui container ad essa collegati
myFirstNetwork=$(sudo docker inspect wg_network)

# Ottieni informazioni su iptables
myIptables=$(sudo iptables-save)

# Ottieni informazioni sulle porte in ascolto usando ss
myListeningPorts=$(sudo ss -tuln)

# Ottieni informazioni sul networking per tutti i container in esecuzione
myContainerNetworking=$(sudo docker network inspect bridge)

# Salva i risultati
echo "$myFirstNetwork" > network_info.txt
echo "$myIptables" >> network_info.txt
echo "$myListeningPorts" >> network_info.txt
echo "$myContainerNetworking" >> network_info.txt

cat network_info.txt