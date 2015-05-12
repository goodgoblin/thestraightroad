#TSR comes with nrpe
FROM goodgoblin/tsr_ruby
ENV NAGIOS_HOME /opt/nagios
#install git
RUN apt-get install -y git
#tsr home
RUN mkdir /usr/local/tsr
#tsr build_spot
RUN mkdir /usr/local/tsr/app
# add build script
COPY tsr_build_script.sh /usr/local/tsr/build
COPY tsr_install_app.sh /usr/local/tsr/
COPY tsr_start_app.sh /usr/local/tsr/
#add docker file
COPY Dockerfile.build /usr/local/tsr/Dockerfile
# run the build script
ENTRYPOINT ["/usr/local/tsr/build"]

