#!/bin/bash

STRING="ssh"

DI_FILE="/home/vagrant/Pentaho/design-tools/data-integration/system/karaf/etc/org.apache.karaf.features.cfg"
ls -al $DI_FILE

if [ ! -z $(grep "$STRING" "$DI_FILE") ]; then
  echo "karaf console already enabled for Data Integration"
else
  echo "karaf console not enabled yet for Data Integration"
  sed -i "/^featuresBoot=.*/a \ \ $STRING,\\\\" $DI_FILE
fi

ME_FILE="/home/vagrant/Pentaho/design-tools/metadata-editor/system/karaf/etc/org.apache.karaf.features.cfg"
ls -al $ME_FILE

if [ ! -z $(grep "$STRING" "$ME_FILE") ]; then
  echo "karaf console already enabled for Metadata Editor"
else
  echo "karaf console not enabled yet for Metadata Editor"
  sed -i "/^featuresBoot=.*/a \ \ $STRING,\\\\" $ME_FILE
fi

# delete Karaf caches
rm -rf /home/vagrant/Pentaho/design-tools/data-integration/system/karaf/caches
rm -rf /home/vagrant/Pentaho/design-tools/metadata-editor/system/karaf/caches

# vim /home/vagrant/.ssh/known_hosts
# delete entry
# ssh -p 8802 karaf@localhost -oHostKeyAlgorithms=+ssh-dss
# use "karaf" as password
