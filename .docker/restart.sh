#!/bin/sh
 
cd
cd dev/projects/docker-amp/.docker/

docker-compose down
docker rm $(docker ps -a -q)
docker rmi $(docker images -q) -f

docker-compose build
docker-compose up -d