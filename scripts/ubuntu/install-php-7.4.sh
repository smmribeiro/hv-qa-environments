#!/bin/bash

# https://www.cloudbooklet.com/install-php-7-4-on-ubuntu/

# Make sure your Ubuntu server is having the latest packages
sudo apt update
sudo apt upgrade

# Add PPA for PHP 7.4
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update

# Install PHP 7.4 for Apache
sudo apt install php7.4

# After the installation has completed, confirm the installation
php -v

# Install PHP 7.4 Extensions
sudo apt install php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-opcache php7.4-soap php7.4-zip php7.4-intl -y

# Install Xdebug

sudo apt-get install php-xdebug

sudo phpdismod xdebug # Disable xdebug
php --version | grep Xdebug

sudo phpenmod xdebug # Enable xdebug
php --version | grep Xdebug

sudo service apache2 restart

more /etc/php/7.4/mods-available/xdebug.ini

# zend_extension=xdebug.so

# xdebug.idekey=PHPSTORM
# xdebug.remote_enable=true
# xdebug.remote_host=192.168.0.111
# xdebug.remote_port=9000
# xdebug.show_error_trace=1

# export XDEBUG_CONFIG="idekey=PHPSTORM"
