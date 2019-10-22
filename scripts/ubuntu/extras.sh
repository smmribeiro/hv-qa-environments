#!/bin/bash
echo "installing extra packages"
sudo apt-get install -y firefox > /dev/null 2>&1
sudo apt-get install -y gedit > /dev/null 2>&1
sudo apt-get install -y libwebkitgtk-1.0-0 > /dev/null 2>&1

sudo apt-get install -y zip > /dev/null 2>&1
sudo apt-get install -y unzip > /dev/null 2>&1

sudo apt-get install -y pip > /dev/null 2>&1
sudo apt-get install -y python > /dev/null 2>&1

sudo pip install jupyterlab
