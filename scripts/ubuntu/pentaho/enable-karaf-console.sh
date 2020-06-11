#!/bin/bash

STRING="ssh"

DI_FILE="/home/vagrant/Pentaho/design-tools/data-integration/system/karaf/etc/org.apache.karaf.features.cfg"

if [ ! -z $(grep "$STRING" "$DI_FILE") ]; then
  echo "karaf console already enabled for Data Integration"
else
  sed -i "/^featuresBoot=.*/a \ \ $STRING,\\\\" $DI_FILE
  echo "karaf console enabled for Data Integration"
fi

ME_FILE="/home/vagrant/Pentaho/design-tools/metadata-editor/system/karaf/etc/org.apache.karaf.features.cfg"

if [ ! -z $(grep "$STRING" "$ME_FILE") ]; then
  echo "karaf console already enabled for Metadata Editor"
else
  sed -i "/^featuresBoot=.*/a \ \ $STRING,\\\\" $ME_FILE
  echo "karaf console enabled for Metadata Editor"
fi

RD_FILE="/home/vagrant/Pentaho/design-tools/report-designer/system/karaf/etc/org.apache.karaf.features.cfg"

if [ ! -z $(grep "$STRING" "$RD_FILE") ]; then
  echo "karaf console already enabled for Report Designer"
else
  sed -i "/^featuresBoot=.*/a \ \ $STRING,\\\\" $RD_FILE
  echo "karaf console enabled for Report Designer"
fi

PENTAHO_SERVER="/home/vagrant/Pentaho/server/pentaho-server/pentaho-solutions/system/karaf/etc/org.apache.karaf.features.cfg"

if [ ! -z $(grep "$STRING" "$PENTAHO_SERVER") ]; then
  echo "karaf console already enabled for Pentaho Server"
else
  sed -i "/^featuresBoot=.*/a \ \ $STRING,\\\\" $PENTAHO_SERVER
  echo "karaf console enabled for Pentaho Server"
fi

# delete Karaf caches
rm -rf /home/vagrant/Pentaho/design-tools/data-integration/system/karaf/caches
rm -rf /home/vagrant/Pentaho/design-tools/metadata-editor/system/karaf/caches
rm -rf /home/vagrant/Pentaho/design-tools/report-designer/system/karaf/caches
rm -rf /home/vagrant/Pentaho/server/pentaho-server/pentaho-solutions/system/karaf/caches

# vim /home/vagrant/.ssh/known_hosts
# delete entry

# ssh -p 8802 karaf@localhost -oHostKeyAlgorithms=+ssh-dss
# use "karaf" as password

# ssh -p 8802 admin@localhost -oHostKeyAlgorithms=+ssh-dss
# use "password" as password
