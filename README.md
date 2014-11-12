Mini-Projet ASI
=======
The aim of this project is to set up a virtual machine with two containers, the first one is the data server which contains the postgres+postgis image with an automatically added shapefile layer, and the second one is the application server which contains the geoserver image.
at the end we will be able to see the Paris department shapefile from the geoserver web page, and its atribute table from the pgAdmin client interface. The schemas below show what we are attempting to do.
In this project we suppose that you have already installed Vagrant. If not, please [do it](https://docs.vagrantup.com/v2/installation/).

![Alt text](images/diagramme1.png?raw=true)
- Technically :
![diagramme logique](images/diagramme2.png?raw=true)

Step I: set up and configure the vagrant environment:
====
execute the appropriate script for the appropriate OS.
If you are using Linux Debian/Ubuntu (run_me.sh):
=
- In your home directory create a workspace folder: `mkdir ~/workspace`
- move to your workspace directory: `cd ~/workspace`
- clone this repository : `git clone https://github.com/mohamedamjad/ASI.git`
- execute the run_me.sh script: `sh ~/workspace/ASI/run_me.sh` (this sh script will set up a vagrant virtual machine with the appropriate forwarded port and add the [dduportal/boot2docker V1.3.1 box](https://vagrantcloud.com/dduportal/boxes/boot2docker/versions).

If you are Using Windows (run_me.bat):
=
- create a workspace folder: `mkdir workspace`
- move to your workspace folder: `cd workspace`
- clone this repository : `git clone https://github.com/mohamedamjad/ASI.git`
- execute the run_me.bat script: `run_me.bat` (this bat script will set up a vagrant virtual machine and add the [dduportal/boot2docker V1.3.1 box](https://vagrantcloud.com/dduportal/boxes/boot2docker/versions).

Step II: pull and configure the docker containers
====

- Now that you are in the boot2docker, go to the vagrant mount: `cd /vagrant`
- execute the configure_docker.sh script: `sh configure_docker.sh` (this script will create two docker containers: postgis and geoserver the first one contains the [Postgres+PostGIS image](https://registry.hub.docker.com/u/jamesbrink/postgresql/) and the second one contains the [Geoserver image](https://registry.hub.docker.com/u/kartoza/geoserver/) .
- this script will also automatically add a shapefile to our geodatabase using the shp2pgsql plugin.

Step III: Access to the geo-database from the pgAdmin desktop interface
====

- Fill the connection form with the appropriate IP adress (localhost), user (postgres), Password (postgres) and forwarded port (2201) . Like the screenshot bellow.
![pgadmin3](images/pgadmin1.png?raw=true)
- In your public schema, you can vizualise your automatically added spatialdb table.
![pgadmin_table](images/atribute_table.png?raw=true).

Step IV: Access to the geo-database from the geoserver admin web page
====
Now we will try to vizualise our shapefile from the geoserver admin web page.
- First of all we need to log in into the geoserver web interface: 127.0.0.1:2207 (my 8080 port is busy).
login: admin
passwd: geoserver
- to connect the geoserver container with the postgis one: Entrepôt-> Ajouter un entrepôt, and fill the form like shown in the image bellow (passwd=postgres).
![details de connexion](images/geoserver_1.png?raw=true).
- If everything is OK, we need to publish our geodatabase: click Publier.
![connexion réussit](images/geoserver_2.png?raw=true).
- You'll have a new form, keep the default parameters, choose : Emprise native and valdiate the form
![emprise](images/geoserver_3.png?raw=true)
- Final step (Haaallelujah!!): Prévisualisation des couches-> click on the name of your layer and choose OpenLayers
![shapefile](images/geoserver_5.png?raw=true)
