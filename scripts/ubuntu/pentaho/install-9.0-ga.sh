#!/bin/bash

GA_FILE=pentaho-business-analytics-9.0.0.0-378-x64
HOST_GA_FOLDER=/host/builds/business-analytics/
HOST_ZIP_FILE=$HOST_GA_FOLDER$GA_FILE.zip
BUILD_HOST=http://build.pentaho.net/hosted

VAGRANT_TEMP_FOLDER=/home/vagrant/temp/
mkdir -p $VAGRANT_TEMP_FOLDER && cd $VAGRANT_TEMP_FOLDER && pwd

if [ -f "$HOST_ZIP_FILE" ]; then
  echo "$HOST_ZIP_FILE exists, moving on to install"

  cp $HOST_ZIP_FILE $VAGRANT_TEMP_FOLDER
  unzip $GA_FILE.zip -d $VAGRANT_TEMP_FOLDER && chmod u+x $GA_FILE.bin
else
  echo "$HOST_ZIP_FILE not found. Will attempt to download from $BUILD_HOST"

  if curl --head --silent --fail $BUILD_HOST 2> /dev/null; then
    echo "Could connect to $BUILD_HOST, moving on"

    curl $BUILD_HOST/engops/9.0.0.0/378/$GA_FILE.bin -o $GA_FILE.bin && sudo chmod u+x $GA_FILE.bin
    pwd && ls -al

    zip -r -D -v $GA_FILE.zip $GA_FILE.bin && cp $GA_FILE.zip $HOST_GA_FOLDER
    pwd && ls -al
  else
    echo "Could not connect to $BUILD_HOST, check your network connection and try again"
    exit 1
  fi
fi

echo "installing 9.0 no questions"
printf '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\ny\n1\n\n1234567890\n1234567890\n\nn\nn\n' | ./$GA_FILE.bin

rm -rf $GA_FILE.*
