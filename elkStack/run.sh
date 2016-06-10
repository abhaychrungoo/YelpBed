#! /bin/bash

STACK="elkstack"

# Cleanup deployment environment
echo "Purging all ${STACK} containers"
#for container in `docker ps -a |grep $STACK | awk {'print $1'}` ; do docker stop $container ; docker rm $container ; done
docker-compose rm -f --all

# Deploy environment
docker-compose up --build 

