#!/bin/bash

STRING="ssh"
FILE="/home/vagrant/Pentaho/design-tools/data-integration/system/karaf/etc/org.apache.karaf.features.cfg"
ls -al $FILE

if [ ! -z $(grep "$STRING" "$FILE") ]; then
  echo "karaf console already enabled"
else
  echo "karaf console not enabled yet"
  cp /host/scripts/ubuntu/pentaho/org.apache.karaf.features.cfg $FILE
  echo "karaf features config file updated, karaf console enabled"
fi

# delete Karaf caches
rm -rf /home/vagrant/Pentaho/design-tools/data-integration/system/karaf/caches
rm -rf /home/vagrant/Pentaho/server/pentaho-server/pentaho-solutions/system/karaf/caches

# ssh -p 8802 karaf@localhost -oHostKeyAlgorithms=+ssh-dss
# use "karaf" as password
