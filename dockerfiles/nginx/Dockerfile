#NGINX comes with nrpe
FROM goodgoblin/nrpe
ENV NAGIOS_HOME /opt/nagios
# Install Nginx.
RUN \
  apt-get update && \
  apt-get install -y nginx && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# add nginx check to nrpe config file
COPY custom_nrpe_commands.cfg /etc/nagios/nrpe.d/
# add supervisor config
COPY supervisord.conf /etc/supervisor/supervisord.conf
# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]
# Define working directory.
WORKDIR /etc/nginx

# Define default command.
ENTRYPOINT ["supervisord"]
CMD ["-n", "-c", "/etc/supervisor/supervisord.conf"]

# Expose ports.
EXPOSE 80
EXPOSE 443
EXPOSE 5667
EXPOSE 5666
