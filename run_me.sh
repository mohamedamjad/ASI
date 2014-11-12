#!/bin/sh
echo "Creating boot2docker repository"
mkdir boot2docker
cd boot2docker
echo "Done !"

echo "Initializing the virtual box ..."
vagrant init dduportal/boot2docker
echo "Done !"

echo "Configuring the virtual box"
vagrant box add dduportal/boot2docker https://vagrantcloud.com/dduportal/boxes/boot2docker/versions/12/providers/virtualbox.box
echo "Done !"

echo "Configuring the Vagrantfile ..."
rm Vagrantfile
cp  ../data/Vagrantfile ../boot2docker
echo "Done !"

echo "Copying the docker configuration file ..."
cp ../script/configure_docker.sh ../boot2docker
echo "Done !"

echo "copying the shapefile folder ..."
cp -r ../data/shapefile ../boot2docker
echo "Done !"

echo "copying the sql configuration file ..."
cp ../script/spatialdb.sql ../boot2docker
echo "Done !"

echo "Starting the virtual box"
vagrant up
sleep 10
vagrant ssh
echo "Virtual box closed !"
