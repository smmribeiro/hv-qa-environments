#!/bin/bash
echo "###############"
echo "# get host ip #"
echo "###############"

# How to remove CTRL-M (^M) characters from a file in Linux
sed -e "s/\r//g" /host/shared/host-ip.txt > /host/shared/host-ip-no-ctrl-m.txt

IP=$(cat /host/shared/host-ip-no-ctrl-m.txt)
echo "The host IP address is: $IP"

sudo sed -i "/xdebug.remote_host=/c\xdebug.remote_host=$IP" /etc/php/7.4/mods-available/xdebug.ini
#more /etc/php/7.4/mods-available/xdebug.ini

sudo service apache2 restart
