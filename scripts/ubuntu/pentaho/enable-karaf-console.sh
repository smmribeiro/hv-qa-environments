#!/bin/bash

STRING="ssh"

DI_FILE="/home/vagrant/Pentaho/design-tools/data-integration/system/karaf/etc/org.apache.karaf.features.cfg"
ls -al $DI_FILE

if [ ! -z $(grep "$STRING" "$DI_FILE") ]; then
  echo "karaf console already enabled for Data Integration"
else
  echo "karaf console not enabled yet for Data Integration"
  cp /host/scripts/ubuntu/pentaho/pdi-org.apache.karaf.features.cfg $DI_FILE
  echo "karaf features config file updated, karaf console enabled for Data Integration"
fi

ME_FILE="/home/vagrant/Pentaho/design-tools/metadata-editor/system/karaf/etc/org.apache.karaf.features.cfg"
ls -al $ME_FILE

if [ ! -z $(grep "$STRING" "$ME_FILE") ]; then
  echo "karaf console already enabled for Metadata Editor"
else
  echo "karaf console not enabled yet for Metadata Editor"
  cp /host/scripts/ubuntu/pentaho/pme-org.apache.karaf.features.cfg $ME_FILE
  echo "karaf features config file updated, karaf console enabled for Metadata Editor"
fi

# delete Karaf caches
rm -rf /home/vagrant/Pentaho/design-tools/data-integration/system/karaf/caches
rm -rf /home/vagrant/Pentaho/design-tools/metadata-editor/system/karaf/caches

# vim /home/vagrant/.ssh/known_hosts
# delete entry
# ssh -p 8802 karaf@localhost -oHostKeyAlgorithms=+ssh-dss
# use "karaf" as password
