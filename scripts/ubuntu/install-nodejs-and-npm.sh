#!/bin/bash

sudo apt-get update

sudo apt-get install -y nodejs
nodejs -v

sudo apt-get install -y libssl1.0-dev
sudo apt-get install -y nodejs-dev
sudo apt-get install -y node-gyp
sudo apt-get install -y npm
npm -v

sudo npm install -g cordova

sudo apt-get install -y gradle

yes | /home/vagrant/Android/Sdk/tools/bin/sdkmanager --licenses && yes | sdkmanager --update
