#!/bin/sh
if [ ! -d "/usr/local/src" ]; then
  mkdir /usr/local/src
fi
if [ ! -d "${NAGIOS_HOME}" ]; then
  mkdir ${NAGIOS_HOME}
  mkdir ${NAGIOS_HOME}/etc
  mkdir ${NAGIOS_HOME}/bin
fi

cd /usr/local/src
wget http://downloads.sourceforge.net/project/nagios/nsca-2.x/nsca-2.7.2/nsca-2.7.2.tar.gz
tar -xzvf nsca-2.7.2.tar.gz

cd nsca-2.7.2
./configure --with-nsca-user=nagios --with-nsca-grp=nagios
make all
cp sample-config/nsca.cfg sample-config/send_nsca.cfg ${NAGIOS_HOME}/etc/
cp src/send_nsca src/nsca ${NAGIOS_HOME}/bin/
cp /tmp/nsca.cfg ${NAGIOS_HOME}/etc/nsca.cfg
chown nagios:nagios ${NAGIOS_HOME}/bin/nsca ${NAGIOS_HOME}/bin/send_nsca
chown nagios.nagcmd ${NAGIOS_HOME}/etc/nsca.cfg ${NAGIOS_HOME}/etc/send_nsca.cfg
chmod g+r ${NAGIOS_HOME}/etc/nsca.cfg

