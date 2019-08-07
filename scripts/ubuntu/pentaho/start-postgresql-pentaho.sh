#!/bin/bash
echo "starting up postgresql and pentaho server"
printf '\n' | /home/vagrant/Pentaho/postgresql/bin/postgres &
ps aux | grep postgresql
/home/vagrant/Pentaho/server/pentaho-server/start-pentaho.sh
