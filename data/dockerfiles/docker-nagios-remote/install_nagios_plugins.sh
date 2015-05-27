#!/bin/sh
if [ ! -d "/usr/local/src" ]; then
  mkdir /usr/local/src
fi
if [ ! -d "/usr/local/nagios" ]; then
  mkdir /usr/local/nagios
  mkdir /usr/local/nagios/etc
  mkdir /usr/local/nagios/bin
fi

cd /usr/local/src
wget http://nagios-plugins.org/download/nagios-plugins-2.0.3.tar.gz
tar -xzvf nagios-plugins-2.0.3.tar.gz



cd nagios-plugins-2.0.3
./configure
make
make install

chown nagios.nagios /usr/local/nagios
chown -R nagios.nagios /usr/local/nagios/libexec


