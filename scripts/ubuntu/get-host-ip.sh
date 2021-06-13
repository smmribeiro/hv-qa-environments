#!/bin/bash
echo "###############"
echo "# get host ip #"
echo "###############"

# How to remove CTRL-M (^M) characters from a file in Linux
sed -e "s/\r//g" /host/shared/host-ip.txt > /host/shared/host-ip-no-ctrl-m.txt

HOST_IP=$(cat /host/shared/host-ip-no-ctrl-m.txt)
echo "HOST_IP: $HOST_IP"

STRING="export HOST_IP=\"$HOST_IP\""
FILE=/home/vagrant/.profile

if  grep -q "$STRING" "$FILE" ; then
  echo "host ip already in profile file"
else
  echo "host ip not found in profile file"
  echo $STRING >> $FILE
  echo "host ip added to profile file"
fi

# c\ text - Replace (change) lines with text. - https://www.gnu.org/software/sed/manual/html_node/sed-commands-list.html
sudo sed -i "/xdebug.client_host=/c\xdebug.client_host=$HOST_IP" /etc/php/7.4/mods-available/xdebug.ini
more /etc/php/7.4/mods-available/xdebug.ini

sudo service apache2 restart
