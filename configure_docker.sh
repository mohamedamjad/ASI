#!/bin/sh
echo "Pulling the PostGIS image ..."
docker pull jameblink/postgresql

echo "Killing all existing containers"
docker kill $(docker ps -a -q)
docker rm $(docker ps -a -q)

echo "Launching postgreSQL+PostGIS image ..."
docker run --name postgis -p 5432:5432 -d jamesbrink/postgresql

echo "Configuring postgis and creating a geodatabase with a shapefile"
docker run --link postgis:db -ti -v /vagrant:/vagrant jamesbrink/postgresql sh -c 'exec psql -h "$DB_PORT_5432_TCP_ADDR" -p "$DB_PORT_5432_TCP_PORT" -U postgres -f /vagrant/spatialdb.sql && shp2pgsql -I -s 2154 /vagrant/shapefile/75.shp postgres.spatialdb | psql -d spatialdb'

echo "Pulling the geoserver image"
docker pull kartoza/geoserver

echo "Launching postgreSQL+PostGIS image ..."
docker run --name geoserver -p 8080:8080 -d kartoza/geoserver
