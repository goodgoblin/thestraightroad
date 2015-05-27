#!/bin/bash


# USE the trap if you need to also do manual cleanup after the service is stopped,
#     or need to start multiple services in the one container
trap "echo TRAPed signal" HUP INT QUIT KILL TERM

# start service in background here
/etc/init.d/nagios-nrpe-server start

echo "[hit enter key to exit] or run 'docker stop <container>'"
read

# stop service and clean up here
echo "stopping nagios-nrpe-server"
/etc/init.d/nagios-nrpe-server stop
echo "exited $0"
