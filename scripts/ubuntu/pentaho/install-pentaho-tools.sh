#!/bin/bash

# major version
echo "input param 1 = $1"

# minor version
echo "input param 2 = $2"

# box username
echo "input param 3 = $3"

# box password
echo "input param 4 = $4"

me="$(whoami)"
echo "current user = $me"

if [ "$1" == "7.1" ] ; then
  echo "installing 7.1 GA tools"

  if [ "$me" == "root" ] ; then
    su -l vagrant -c "sh /host/scripts/ubuntu/pentaho/install-7.1-ga.sh"
  fi

  if [ "$me" == "vagrant" ] ; then
    sh /host/scripts/ubuntu/pentaho/install-7.1-ga.sh
  fi

  if [ ! -z "$2" ]; then
    echo "downloading service pack $2 from box"

    # check if the service pack already exists in the builds folder

    PDI_SP="PDIClient-SP-$2.bin"

    if [ ! -e /host/builds/sp/$PDI_SP ]; then
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

    # check if the service pack already exists in the builds folder

    SERVER_SP="PentahoServer-SP-$2.bin"

    if [ ! -e /host/builds/sp/$SERVER_SP ]; then
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

    echo "installing $2 service packs"

    # https://stackoverflow.com/questions/3510673/find-and-kill-a-process-in-one-line-using-bash-and-regex/3510850#3510850
    kill $(ps aux | grep '[p]ostgres.bin' | awk '{print $2}')
    kill $(ps aux | grep '[t]omcat' | awk '{print $2}')

    if [ "$me" == "root" ] ; then
      su -l vagrant -c "sh /host/scripts/ubuntu/pentaho/install-7.1-ga-plus-sp.sh '$2'"
    fi

    if [ "$me" == "vagrant" ] ; then
      sh /host/scripts/ubuntu/pentaho/install-7.1-ga-plus-sp.sh "$2"
    fi
  else
    echo "minor version not specified, moving on"
  fi
fi

exit 0
