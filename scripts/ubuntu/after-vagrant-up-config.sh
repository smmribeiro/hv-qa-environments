#!/bin/bash
echo "after vagrant up config"

#whoami
#path=${HOME}/.bash_profile
#echo "HOME: $path"

sudo cp /host/scripts/ubuntu/.bash_profile /home/vagrant/.bash_profile
ls -al /home/vagrant/.bash_profile
