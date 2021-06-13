#!/bin/bash
echo "installing google chrome"

# https://serverfault.com/questions/500764/dpkg-reconfigure-unable-to-re-open-stdin-no-file-or-directory
# dpkg-preconfigure: unable to re-open stdin: No such file or directory
# dpkg-reconfigure: unable to re-open stdin: No file or directory
export DEBIAN_FRONTEND=noninteractive

# Install Google Chrome
sudo curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
sudo echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
sudo apt-get -y update
sudo apt-get -y install google-chrome-stable

echo "installing chrome driver"

# Install ChromeDriver
LATEST_RELEASE=$(wget https://chromedriver.storage.googleapis.com/LATEST_RELEASE -q -O -)
echo $LATEST_RELEASE

URL=https://chromedriver.storage.googleapis.com/$LATEST_RELEASE/chromedriver_linux64.zip
echo $URL

wget --no-check-certificate --quiet $URL -O /host/shared/chromedriver_linux64.zip
sudo unzip /host/shared/chromedriver_linux64.zip -d /host/shared/
sudo mv /host/shared/chromedriver /usr/bin/chromedriver
sudo chown root:root /usr/bin/chromedriver
sudo chmod +x /usr/bin/chromedriver
