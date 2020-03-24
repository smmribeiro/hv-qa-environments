#!/bin/bash

# Install the packages necessary to add a new repository over HTTPS:
sudo apt install -y apt-transport-https software-properties-common

# Enable the CRAN repository and add the CRAN GPG key to your system using the following commands:
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

version=$(lsb_release -r -s)

if [ -z "$1" ]; then
  version=$(lsb_release -r -s)
else
  version=$1
fi

echo "installing R for ubuntu $version"

if [ "$version" == "16.04" ] ; then
  sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/'
fi

if [ "$version" == "18.04" ] ; then
  sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
fi

# Now that the apt repository is added, update the packages list and install the R package by typing:
sudo apt update
sudo apt install -y r-base

# To verify that the installation was successful run the following command which will print the R version:
R --version
