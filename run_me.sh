#!/bin/sh
echo "Creating boot2docker repository"
mkdir boot2docker
cd boot2docker
echo "Done !"

echo "Initializing the virtual box ..."
vagrant init dduportal/boot2docker
echo "Done !"

echo "Configuring the virtual box"
vagrant box add dduportal/boot2docker ../boot2docker_virtualbox_1.2.0.box
#https://vagrantcloud.com/dduportal/boxes/boot2docker/versions/11/providers/virtualb$
echo "Done !"

echo "Configuring the Vagrantfile ..."
rm Vagrantfile
cp  ../data/Vagrantfile ../boot2docker
echo "Done !"

echo "Starting the virtual box"
vagrant up
sleep 10
vagrant ssh
echo "Virtual box closed !"
