#!/bin/sh
echo "Pulling the PostGIS image ..."
docker pull jamebrink/postgresql

echo "Killing all existing containers"
docker kill $(docker ps -a -q)
docker rm $(docker ps -a -q)

echo "Launching postgreSQL+PostGIS image ..."
docker run --name postgis -p 5432:5432 -d jamesbrink/postgresql

echo "Configuring postgis and creating a geodatabase: spatialdb"
docker run --link postgis:db -ti -v /vagrant:/vagrant jamesbrink/postgresql sh -c 'exec psql -h "$DB_PORT_5432_TCP_ADDR" -p "$DB_PORT_5432_TCP_PORT" -U postgres -f /vagrant/spatialdb.sql'
docker run --link postgis:db -ti -v /vagrant:/vagrant jamesbrink/postgresql sh -c 'exec shp2pgsql -W "LATIN1" -I -s 2154 /vagrant/shapefile/75-.shp public.spatialdb | psql -h "$DB_PORT_5432_TCP_ADDR" -p "$DB_PORT_5432_TCP_PORT" -U postgres -d spatialdb'

echo "Pulling the geoserver image"
docker pull kartoza/geoserver

echo "Launching postgreSQL+PostGIS image ..."
docker run --name geoserver -p 8080:8080 -d kartoza/geoserver

echo "The two containers are seted up !"
echo "wait few seconds the geoserver service is starting..."
sleep 10
echo "from your web browser go to : 127.0.0.1:8080/geoserver"
echo "login: admin Password: geoserver"
echo "from your admin page: Ajouter un entrepôt-> PostGIS"
echo "and fill the form with the informations below :"
echo "Nom de la source de donnees : spatialdb"
echo "Host : "
echo "Port : 5432"
echo "Schema : postgres"
echo "User : postgres"
echo "Password : postgres"



