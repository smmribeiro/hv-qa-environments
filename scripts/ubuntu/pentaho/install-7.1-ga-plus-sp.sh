#!/bin/bash

VERSION_NUMBER=$1

if [ -z "$VERSION_NUMBER" ] ; then
  VERSION_NUMBER=7.1.0.26
  echo "version number defaulted to $VERSION_NUMBER"
else
  echo "version number defined by user as $VERSION_NUMBER"
fi

BUILD_NUMBER=$2

if [ -z "$BUILD_NUMBER" ] ; then
  BUILD_NUMBER=212
  echo "build number defaulted to $BUILD_NUMBER"
else
  echo "build number defined by user as $BUILD_NUMBER"
fi

export INSTALLERS_BASE=/host/builds/sp/7.1/
export PENTAHO_TO_PATCH=/home/vagrant/Pentaho/

export PATCH_VERSION=$VERSION_NUMBER-$BUILD_NUMBER
echo "patch version defined as $PATCH_VERSION"

export LOG_BASE=/tmp/$PATCH_VERSION
