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
