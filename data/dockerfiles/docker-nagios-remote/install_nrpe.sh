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
wget http://downloads.sourceforge.net/project/nagios/nrpe-2.x/nrpe-2.14/nrpe-2.14.tar.gz
tar -xzvf nrpe-2.14.tar.gz



cd nrpe-2.14
./configure --enable-ssl --with-ssl=/usr/bin/openssl --with-ssl-lib=/usr/lib/x86_64-linux-gnu
make all
make install-plugin
make install-daemon
make install-daemon-config



