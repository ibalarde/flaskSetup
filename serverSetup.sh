#!/bin/bash


#This is a script to install flask and gunicorn for a web application
#This script needs no input except where stated.

##### INSTALL PATH #####
installPath=

##### FIREWALL PORT #####
#This variable can be changed to the port needed to run the server
#8000 for gunicorn's default, and 443 for SSL connections
serverPort=8000

############# AFTER INSTALLATION #############
#To run gunicorn as the service account, use sudo -u sv_gunicorn gunicorn [args] in the directory your application is in
#To make sure that any changes made to the source update immediately, use the --reload flag
#SSL can be used with gunicorn by starting it with the flags, --certfile=[pathToCert], --keyfile=[pathToKey], and --bind=443 (to listen for https)

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

#create folder for the application in the specified path and give service account all perms for it
mkdir $installPath
sudo chmod -R a+rwx $installPath
#sudo chmod a+rwx $installPath/..

#opens the user-specified port on the firewall (This allows access to the server from external clients))
sudo ufw allow $serverPort
sudo ufw allow ssh
sudo ufw reload
sudo ufw enable 
