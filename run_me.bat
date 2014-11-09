:: This file is the equivalent of the run_me.sh script in Windows

echo "Creating boot2docker repository ..."
mkdir boot2docker
cd boot2docker
echo "Done !"

echo "Initializing the virtual box ..."
vagrant init dduportal/boot2docker
echo "Done !"

echo "Configuring the virtual box ..."
vagrant box add dduportal/boot2docker ../boot2docker_virtualbox_1.2.0.box
::https://vagrantcloud.com/dduportal/boxes/boot2docker/versions/11/providers/virtualbox.box
echo "Done !"

echo "Configuring the Vagrantfile ..."
del Vagrantfile
xcopy /f ..\data\Vagrantfile
echo "Done !"

echo "Copying the docker configuration file ..."
xcopy /f ..\configure_docker.sh
echo "Done !"

echo "copying the shapefile folder ..."
xcopy /f ..\data\shapefile
echo "Done !"

echo "copying the sql configuration file ..."
xcopy /f ..\spatialdb.sql
echo "Done !"

echo "Starting the virtual box ..."
vagrant up
vagrant ssh
echo "Virtual box closed !"
