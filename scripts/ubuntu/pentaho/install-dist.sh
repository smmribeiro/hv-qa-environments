#!/bin/bash

DIST_URL=$1
echo $DIST_URL

DIST_FILE=$(echo "$DIST_URL"  | sed 's/.*\///')
echo $DIST_FILE

HOST_GA_FOLDER=/host/builds/dist/
HOST_ZIP_FILE=$HOST_GA_FOLDER$DIST_FILE.zip
BUILD_HOST=http://build.pentaho.net/hosted

VAGRANT_TEMP_FOLDER=/home/vagrant/temp/
mkdir -p $VAGRANT_TEMP_FOLDER && cd $VAGRANT_TEMP_FOLDER && pwd

if [ -f "$HOST_ZIP_FILE" ]; then
  echo "$HOST_ZIP_FILE exists, moving on to install"

  cp $HOST_ZIP_FILE $VAGRANT_TEMP_FOLDER
  unzip $DIST_FILE.zip -d $VAGRANT_TEMP_FOLDER && chmod u+x $DIST_FILE
else
  echo "$HOST_ZIP_FILE not found. Will attempt to download from $BUILD_HOST"

  if curl --head --silent --fail $BUILD_HOST 2> /dev/null; then
    echo "Could connect to $BUILD_HOST, moving on"

    curl $DIST_URL -o $DIST_FILE && sudo chmod u+x $DIST_FILE
    pwd && ls -al

    zip -r -D -v $DIST_FILE.zip $DIST_FILE && cp $DIST_FILE.zip $HOST_GA_FOLDER
    pwd && ls -al
  else
    echo "Could not connect to $BUILD_HOST, check your network connection and try again"
    exit 1
  fi
fi

echo "installing dist no questions"
printf '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\ny\n1\n\n1234567890\n1234567890\n\nn\nn\n' | ./$DIST_FILE

rm -rf $DIST_FILE.*
