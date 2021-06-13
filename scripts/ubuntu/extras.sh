#!/bin/bash
echo "installing extra packages"

UBUNTU_VERSION=$1

if [ -z "$UBUNTU_VERSION" ]; then
  UBUNTU_VERSION="16.04"
fi

sudo apt-get install -y firefox > /dev/null 2>&1
sudo apt-get install -y gedit > /dev/null 2>&1
sudo apt-get install -y libwebkitgtk-1.0-0 > /dev/null 2>&1

sudo apt-get install -y zip > /dev/null 2>&1
sudo apt-get install -y unzip > /dev/null 2>&1

sudo apt-get install ubuntu-cleaner > /dev/null 2>&1

sudo apt-get install -y ffmpeg

sudo apt install -y webp

sudo apt-get install -y snap
sudo snap install notepad-plus-plus
