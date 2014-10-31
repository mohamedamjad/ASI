#!/bin/sh
echo "Pulling the PostGIS container ..."
docker pull jameblink/postgresql

echo "Killing all existing containers"
docker kill $(docker ps -a -q)
docker rm $(docker ps -a -q)

echo "Launching postgreSQL+PostGIS image ..."
docker run --name postgis -p 5432:5432 -d jamesbrink/postgresql
