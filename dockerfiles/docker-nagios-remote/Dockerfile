#
FROM goodgoblin/nsca
ENV NAGIOS_HOME /opt/nagios
RUN apt-get install -y libssl-dev openssl

#PLUGINS and NRPE
ADD install_nagios_plugins.sh .
ADD install_nrpe.sh .
RUN ./install_nagios_plugins.sh
RUN ./install_nrpe.sh
COPY nrpe.cfg /usr/local/nagios/etc/nrpe.cfg
RUN chown nagios:nagios /usr/local/nagios/etc/nrpe.cfg
# Expose ports.
EXPOSE 5666

# supervisord
RUN apt-get install -y systemd
# entrypoint
COPY run.sh /srv/run
RUN chmod +x /srv/run
CMD ["/srv/run"]

