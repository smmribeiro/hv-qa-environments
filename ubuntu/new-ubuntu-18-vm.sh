#!/bin/bash

# $1 = folder name / vm name
# $2 = Pentaho major version to test
# $3 = Pentaho minor version to test
# $4 = vm box version - https://app.vagrantup.com/ubuntu/boxes/bionic64/[version]
# for example:
# https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20191021.0.0 -> "20191021.0.0"
# https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20191018.0.0 -> "20191018.0.0"
# https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20191014.0.0 -> "20191014.0.0"
# This parameter can be empty and the last available version will be assumed or the local one if any

if [[ -z $1 || -z $2 || -z $3 || -z $4 ]]; then
  me=`basename "$0"`

  echo "right usage: $0 folder-and-vm-name major-version-to-test minor-version-to-test vm-box-version"
  exit 1
fi

mkdir $1
cp base/config.yaml $1/config.yaml
cp base/Vagrantfile $1/Vagrantfile
sed -i "s/VM_NAME/$1/g" $1/config.yaml
sed -i "s/VM_TEST_MAJOR_VERSION/$2/g" $1/config.yaml
sed -i "s/VM_TEST_MINOR_VERSION/$3/g" $1/config.yaml
sed -i "s/VM_BASE_OS/ubuntu\/bionic64/g" $1/config.yaml
sed -i "s/VM_BOX_VERSION/$4/g" $1/config.yaml
sed -i "s/VM_OS_VERSION/18.04/g" $1/config.yaml
sed -i "s/VM_IP_ADDRESS/192.168.100.100/g" $1/config.yaml
