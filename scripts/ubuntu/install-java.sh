#!/bin/bash
echo "installing java"

sudo add-apt-repository ppa:openjdk-r/ppa > /dev/null 2>&1

sudo apt-get update > /dev/null 2>&1

sudo apt-get install -y openjdk-11-jre > /dev/null 2>&1
sudo apt-get install -y openjdk-11-jdk > /dev/null 2>&1

sudo update-alternatives --config java > /dev/null 2>&1
sudo update-alternatives --config javac > /dev/null 2>&1
