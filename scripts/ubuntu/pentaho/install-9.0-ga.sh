#!/bin/bash

FILE=/host/builds/business-analytics/pentaho-business-analytics-9.0.0.0-302-x64.bin
BUILD_HOST=http://build.pentaho.net/hosted

if [ -f "$FILE" ]; then
  echo "$FILE exists, moving on to install"
else
  echo "$FILE not found. Will attempt to download from $BUILD_HOST"

  if curl --head --silent --fail $BUILD_HOST 2> /dev/null; then
    echo "Could connect to $BUILD_HOST, moving on"

    curl $BUILD_HOST/9.0-QAT/302/pentaho-business-analytics-9.0.0.0-302-x64.bin -o $FILE
  else
    echo "Could not connect to $BUILD_HOST, check your network connection and try again"
    exit 1
  fi
fi

echo "installing 9.0 no questions"
printf '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\ny\n1\n\n1234567890\n1234567890\n\nn\nn\n' | /host/builds/business-analytics/pentaho-business-analytics-9.0.0.0-302-x64.bin
