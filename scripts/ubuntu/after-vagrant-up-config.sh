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
