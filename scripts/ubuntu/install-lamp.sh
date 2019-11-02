#!/bin/bash

# Install Apache
sudo apt-get update -y
sudo apt-get install -y apache2
sudo systemctl start apache2.service

# Install MySQL
# sudo apt-get install mysql-server -y
# sudo /usr/bin/mysql_secure_installation

# Install PHP
sudo apt-get install -y php
sudo apt-get install -y php-{bcmath,bz2,intl,gd,mbstring,mysql,xml,zip}
sudo apt-get install -y lib{apache2-mod-php,mcrypt-dev}

# Start Apache and MySQL on boot
sudo systemctl enable apache2.service
sudo systemctl enable mysql.service
sudo systemctl restart apache2.service

# For mod_rewrite, you'd use this command to enable it.
# sudo a2enmod rewrite

# To disable it, execute this command.
# sudo a2dismod rewrite

# install composer
sudo apt-get install -y composer

# install Laravel
composer global require laravel/installer

echo "export PATH=~/.config/composer/vendor/bin:\$PATH" > ~/.bash_profile
ls -al ~/.bash_profile
more ~/.bash_profile

laravel --version

# laravel new project_name
