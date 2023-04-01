#!/bin/bash


#This is a script to install flask and gunicorn for a web application
#This script needs no input except where stated.

##### CONFIG #####

##### INSTALL PATH #####
installPath=/opt/flaskapp

##### FIREWALL PORT #####
serverPort=8000

##### END CONFIG #####

#update package cache
sudo apt-get update

#install and/or update python3 and pip3 (The process might not actually need pip but it gets installed just in case)
sudo apt-get install python3 -y
sudo apt-get install python3-pip -y

#install flask and gunicorn
sudo apt-get install python3-flask -y
sudo apt-get install gunicorn -y

#create service account (This will require user input to set the password)
sudo adduser sv_gunicorn

#create app folder and move demos in
mkdir $installPath
mv flaskHelloWorld.py $installPath
mv flaskModuleLoader.py $installPath
mv flaskModule1.py $installPath
mv gunicorn_cron.sh $installPath
sudo chmod -R a+rwx $installPath

#opens the user-specified port on the firewall (This allows access to the server from external clients)
sudo ufw allow $serverPort
sudo ufw allow ssh
sudo ufw reload
sudo ufw enable