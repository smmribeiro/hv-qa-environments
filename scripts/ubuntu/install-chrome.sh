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
wget --quiet https://chromedriver.storage.googleapis.com/2.41/chromedriver_linux64.zip -O /tmp/chromedriver_linux64.zip
unzip /tmp/chromedriver_linux64.zip -d /tmp/
sudo mv /tmp/chromedriver /usr/bin/chromedriver
sudo chown root:root /usr/bin/chromedriver
sudo chmod +x /usr/bin/chromedriver

echo "downloading selenium server jar file"

FILE=/host/java/selenium-server-standalone-3.13.0.jar

if [ -f "$FILE" ]; then
  echo "$FILE exists, moving on"
else
  curl --silent https://selenium-release.storage.googleapis.com/3.13/selenium-server-standalone-3.13.0.jar -o $FILE
fi
