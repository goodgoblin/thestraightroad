#!/bin/bash
git clone $1 /usr/local/tsr/app
cd /usr/local/tsr
tar zcf Dockerfile.tar.gz Dockerfile app tsr_install_app.sh tsr_start_app.sh
curl -v -X POST -H "Content-Type:application/tar" --data-binary '@Dockerfile.tar.gz' http://192.168.33.10:4243/build?t=goodgoblin/tsr_sample


