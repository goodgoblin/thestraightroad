#
FROM ubuntu:14.10
ENV NAGIOS_HOME /opt/nagios
#NSCA, PLUGINS and NRPE
RUN apt-get update
RUN apt-get install -y build-essential xinetd wget libmcrypt-dev libssl-dev openssl
RUN useradd -m nagios
RUN groupadd nagcmd
ADD nsca.cfg /tmp/
ADD install_nsca.sh .
ADD install_nagios_plugins.sh .
ADD install_nrpe.sh .
RUN ./install_nsca.sh


# Expose ports.
EXPOSE 5667
