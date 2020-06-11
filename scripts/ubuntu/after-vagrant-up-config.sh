#!/bin/bash
echo "###########################"
echo "# after vagrant up config #"
echo "###########################"

STRING="export XDEBUG_CONFIG=\"idekey=PHPSTORM\""
FILE=/home/vagrant/.profile

if  grep -q "$STRING" "$FILE" ; then
  echo "Xdebug PHPStorm IDE Key already in profile file"
else
  echo "Xdebug PHPStorm IDE Key not found in profile file"
  echo $STRING >> $FILE
  echo "Xdebug PHPStorm IDE Key added to profile file"
fi

STRING="export IA_HOME=\"/home/vagrant/InstallAnywhere 2020\""
FILE=/home/vagrant/.profile

if  grep -q "$STRING" "$FILE" ; then
  echo "IA Home already in profile file"
else
  echo "IA Home not found in profile file"
  echo $STRING >> $FILE
  echo "IA Home added to profile file"
fi

STRING="export IA_PATH_INSTALL_PROJECT_PATH=\"/host/shared/pentaho-installer/installer-tool\""
FILE=/home/vagrant/.profile

if  grep -q "$STRING" "$FILE" ; then
  echo "IA Install Project Path already in profile file"
else
  echo "IA Install Project Path not found in profile file"
  echo $STRING >> $FILE
  echo "IA Install Project Path added to profile file"
fi
