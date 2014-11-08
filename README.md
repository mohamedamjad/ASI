Mini-Projet ASI
=====
The aim of this project is to set up a virtual machine containing two containers that host a geoserver and a postgres+postgis images.
in this project we suppose that you have already installed Vagrant. If not, please [do it](https://www.google.com).
If you are using Linux Debian/Ubuntu
==
- In your home directory create a workspace folder: mkdir ~/workspace
- move to your workspace directory: cd ~/workspace
- clone this repository : git clone https://github.com/mohamedamjad/ASI.git
- execute the run_me.sh script: sh ~/workspace/ASI/run_me.sh (this sh script will set up a vagrant virtual machine and add the [dduportal/boot2docker V1.3.1 box](https://).
- Now that you are in the boot2docker go to the vagrant mount: cd /vagrant
- execute the configure_docker.sh script: sh configure_docker (this script will create two docker containers containing ...
- in a web browser -> 127.0.0.1:8080 the GeoServer admin page will appear. Log in with: 



If you are Using Windows
==
