#
FROM ubuntu:14.10
ENV NAGIOS_HOME /opt/nagios
RUN apt-get update
RUN apt-get install -y build-essential xinetd wget libmcrypt-dev libssl-dev openssl
#SUPERVISOR
RUN apt-get install -y supervisor

#PLUGINS and NRPE
RUN apt-get install -y nagios-nrpe-server nagios-plugins
COPY nrpe.cfg /etc/nagios/

# Expose ports.
EXPOSE 5666

# NRPE startup script to keep in foreground
COPY foreground_nrpe.sh /opt/nagios/bin/start_nrpe.sh
RUN chown -R nagios:nagios /opt/nagios/bin
ENTRYPOINT ["supervisord"]
CMD ["-n", "-c", "/etc/supervisor/supervisord.conf"]
