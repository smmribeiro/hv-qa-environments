#!/bin/bash

# https://www.linuxuprising.com/2018/07/how-to-fix-could-not-get-lock.html
# How To Fix `Could not get lock /var/lib/dpkg/lock - open (11 Resource temporarily unavailable)` Errors
sudo rm /var/lib/apt/lists/lock

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

export R_HOME="/usr/lib/R" && echo $R_HOME
export R_LIBS_USER=/usr/lib/R/lib/ && echo $R_LIBS_USER
export LD_LIBRARY_PATH=/usr/lib/R/lib/ && echo $LD_LIBRARY_PATH

sudo R CMD javareconf

# sudo R
# install.packages("rJava", lib = "/usr/lib/R/lib/")
# ls -al /usr/lib/R/lib/
