#!/bin/bash
echo "installing gui for ubuntu $1"

if [ "$1" == "16.04" ] ; then
  sudo apt-get install -y --no-install-recommends --fix-missing ubuntu-desktop
fi

if [ "$1" == "18.04" ] ; then
  sudo apt-get install -y --no-install-recommends --fix-missing ubuntu-desktop
fi
