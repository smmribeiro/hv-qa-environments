#!/bin/bash

echo "input param 1 = $1" # major version
echo "input param 2 = $2" # minor version
echo "input param 3 = $3" # box username
echo "input param 4 = $4" # box password
echo "input param 5 = $5" # patch version override path
echo "input param 6 = $6" # dist

if [ ! -z "$2" ]; then
  echo "downloading service pack $2 from box"

  PDI_SP="PDIClient-SP-$2.bin"
  echo "PDI_SP = $PDI_SP"

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
  echo "SERVER_SP = $SERVER_SP"

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

  GA_SCRIPT_PATH="/host/scripts/ubuntu/pentaho/install-$1-ga.sh"
  echo "GA_SCRIPT_PATH = $GA_SCRIPT_PATH"

  if [ -e $GA_SCRIPT_PATH ]; then
      echo "installer for $1 exists, moving on"
  else
      echo "installer for $1 not found, process aborted"
      exit 1
  fi

  if [ "$me" = "root" ] ; then
    su -l vagrant -c "sh $GA_SCRIPT_PATH"
  fi

  if [ "$me" = "vagrant" ] ; then
    sh $GA_SCRIPT_PATH
  fi

  if [ ! -z "$2" ]; then
    echo "installing $2 service packs"

    SP_SCRIPT_PATH="/host/scripts/ubuntu/pentaho/install-$1-sp.sh"
    echo "SP_SCRIPT_PATH = $SP_SCRIPT_PATH"

    if [ -e $SP_SCRIPT_PATH ]; then
        echo "installer for $1 sp exists, moving on"
    else
        echo "installer for $1 sp not found, process aborted"
        exit 1
    fi

    # https://stackoverflow.com/questions/3510673/find-and-kill-a-process-in-one-line-using-bash-and-regex/3510850#3510850
    kill -9 $(ps aux | grep '[p]ostgres.bin' | awk '{print $2}')
    kill -9 $(ps aux | grep '[t]omcat' | awk '{print $2}')

    if [ "$me" = "root" ] ; then
      su -l vagrant -c "sh $SP_SCRIPT_PATH '$2' '$5'"
    fi

    if [ "$me" = "vagrant" ] ; then
      sh $SP_SCRIPT_PATH "$2" "$5"
    fi
  fi
else
  echo "no major version specified, nothing to install, moving on"
fi

# if-else block to install dist builds
if [ ! -z "$6" ]; then
  DIST_SCRIPT_PATH="/host/scripts/ubuntu/pentaho/install-dist.sh"
  echo "DIST_SCRIPT_PATH = $DIST_SCRIPT_PATH"

  if [ -e $DIST_SCRIPT_PATH ]; then
      echo "installer for dist exists, moving on"
  else
      echo "installer for dist not found, process aborted"
      exit 1
  fi

  # https://stackoverflow.com/questions/3510673/find-and-kill-a-process-in-one-line-using-bash-and-regex/3510850#3510850
  kill -9 $(ps aux | grep '[p]ostgres.bin' | awk '{print $2}')
  kill -9 $(ps aux | grep '[t]omcat' | awk '{print $2}')

  if [ "$me" = "root" ] ; then
    su -l vagrant -c "sh $DIST_SCRIPT_PATH '$6'"
  fi

  if [ "$me" = "vagrant" ] ; then
    sh $DIST_SCRIPT_PATH "$6"
  fi
else
  echo "no dist, nothing to install, moving on"
fi

exit 0
