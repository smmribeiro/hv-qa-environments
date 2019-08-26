#!/bin/bash

more /home/vagrant/Pentaho/postgresql/data/postgresql.conf | grep listen_addresses
sed -i -e 's/127.0.0.1/*/g' /home/vagrant/Pentaho/postgresql/data/postgresql.conf
more /home/vagrant/Pentaho/postgresql/data/postgresql.conf | grep listen_addresses

more /home/vagrant/Pentaho/postgresql/data/postgresql.conf | grep "#port"
sed -i -e 's/#port/port/g' /home/vagrant/Pentaho/postgresql/data/postgresql.conf
more /home/vagrant/Pentaho/postgresql/data/postgresql.conf | grep "port"

echo "host all all 0.0.0.0/0 trust" >> /home/vagrant/Pentaho/postgresql/data/pg_hba.conf
