#!/bin/bash

echo "input param 1 = $1"
echo "input param 2 = $2"
echo "input param 3 = $3"
echo "input param 4 = $4"

if [ "$1" == "7.1" ] ; then
  echo "installing 7.1 GA tools"
  runuser -l vagrant -c 'sh /host/scripts/ubuntu/pentaho/install-7.1-ga.sh'

  if [ ! -z "$2" ]; then
    echo "downloading service pack $2 from box"

    PDI_SP="PDIClient-SP-$2.bin"
    SERVER_SP="PentahoServer-SP-$2.bin"

    cd /host/java/
    java -cp .:selenium-server-standalone-3.13.0.jar DownloadServicePackTest "$3" "$4" "$PDI_SP" "headless"
    java -cp .:selenium-server-standalone-3.13.0.jar DownloadServicePackTest "$3" "$4" "$SERVER_SP" "headless"

    echo "installing $2 service pack"

    su -l vagrant -c "sh /host/scripts/ubuntu/pentaho/install-7.1-ga-plus-sp.sh '$2'"
  fi
fi
