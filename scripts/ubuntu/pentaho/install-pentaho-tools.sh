#!/bin/bash

echo "input param 1 = $1" # major version
echo "input param 2 = $2" # minor version
echo "input param 3 = $3" # box username
echo "input param 4 = $4" # box password

if [ ! -z "$2" ]; then
  echo "downloading service pack $2 from box"

  PDI_SP="PDIClient-SP-$2.bin"

  # check if the service pack already exists in the builds folder
  if [ ! -e /host/builds/sp/$PDI_SP ]; then
    echo "$PDI_SP not found, going to download"

    if [ -z "$3" ]; then
      echo "if you wish to download a service pack from box please specify your box username in the config.yaml file"
      exit 1
    fi

    if [ -z "$4" ]; then
      echo "if you wish to download a service pack from box please specify your box password in the config.yaml file"
      exit 1
    fi

    cd /host/java/
    java -cp .:selenium-server-standalone-3.13.0.jar DownloadServicePackTest "$3" "$4" "$PDI_SP" "headless"
  else
    echo "$PDI_SP already exists, no need to download"
  fi

  SERVER_SP="PentahoServer-SP-$2.bin"

  # check if the service pack already exists in the builds folder
  if [ ! -e /host/builds/sp/$SERVER_SP ]; then
    echo "$SERVER_SP not found, going to download"

    if [ -z "$3" ]; then
      echo "if you wish to download a service pack from box please specify your box username in the config.yaml file"
      exit 1
    fi

    if [ -z "$4" ]; then
      echo "if you wish to download a service pack from box please specify your box password in the config.yaml file"
      exit 1
    fi

    cd /host/java/
    java -cp .:selenium-server-standalone-3.13.0.jar DownloadServicePackTest "$3" "$4" "$SERVER_SP" "headless"
  else
    echo "$SERVER_SP already exists, no need to download"
  fi
else
  echo "minor version not specified, moving on"
fi

me="$(whoami)"
echo "current user = $me"

if [ ! -z "$1" ]; then
  echo "installing $1 GA tools"

  if [ "$me" = "root" ] ; then
    su -l vagrant -c "bash /host/scripts/ubuntu/pentaho/install-$1-ga.sh"
  fi

  if [ "$me" = "vagrant" ] ; then
    bash /host/scripts/ubuntu/pentaho/install-$1-ga.sh
  fi

  if [ ! -z "$2" ]; then
    echo "installing $2 service packs"

    # https://stackoverflow.com/questions/3510673/find-and-kill-a-process-in-one-line-using-bash-and-regex/3510850#3510850
    kill $(ps aux | grep '[p]ostgres.bin' | awk '{print $2}')
    kill $(ps aux | grep '[t]omcat' | awk '{print $2}')

    if [ "$me" = "root" ] ; then
      su -l vagrant -c "bash /host/scripts/ubuntu/pentaho/install-$1-ga-plus-sp.sh '$2'"
    fi

    if [ "$me" = "vagrant" ] ; then
      bash /host/scripts/ubuntu/pentaho/install-$1-ga-plus-sp.sh "$2"
    fi
  fi
fi

exit 0
