Mini-Projet ASI
=====
The aim of this project is to set up a virtual machine with two containers, the first one is the data server which contains the postgres+postgis image with an automatically added shapefile layer, and the second one is the application server which contains the geoserver image.
at the end we have to be able to see the Paris department shapefile from the geoserver web page,. The schemas below show what we are attempting to do 
in this project we suppose that you have already installed Vagrant. If not, please [do it](https://docs.vagrantup.com/v2/installation/).

Step I: set up and configure the vagrant environment:
===
execute the appropriate script for the appropriate OS.
If you are using Linux Debian/Ubuntu (run_me.sh):
=
- In your home directory create a workspace folder: mkdir ~/workspace
- move to your workspace directory: cd ~/workspace
- clone this repository : git clone https://github.com/mohamedamjad/ASI.git
- execute the run_me.sh script: sh ~/workspace/ASI/run_me.sh (this sh script will set up a vagrant virtual machine and add the [dduportal/boot2docker V1.3.1 box](https://).
- Now that you are in the boot2docker go to the vagrant mount: cd /vagrant
- execute the configure_docker.sh script: sh configure_docker (this script will create two docker containers containing ...
- in a web browser -> 127.0.0.1:2207 (my 8080 port is busy, ) the GeoServer admin page will appear (it may take few minutes to start geoserver service). Log in with: login: admin; password: geoserver.

If you are Using Windows (run_me.bat):
=
- create a workspace folder: mkdir workspace
- move to your workspace folder: cd workspace
- clone this repository : git clone https://github.com/mohamedamjad/ASI.git
- execute the run_me.bat script (this sh script will set up a vagrant virtual machine and add the [dduportal/boot2docker V1.3.1 box](https://).
- Now that you are in boot2docker go to the vagrant mount: cd /vagrant
- execute the configure_docker.sh script: sh configure_docker (this script will create two docker containers containing ...
- in a web browser -> 127.0.0.1:2207 (my 8080 port is busy, ) the GeoServer admin page will appear (it may take few minutes to start geoserver service). Log in with: login: admin; password: geoserver.

Step II: pull and configure the docker containers
===
