# README
## for setting up a flask app with gunicorn

## IMPORTANT:
__Make sure that the following files are in this folder:__
- `serverSetup.sh`
- `flaskHelloWorld.py`

## Before install
Before beginning the installation process, there are several configuration-related items that need to be set up. To begin, open the file `serverSetup.sh` and go to the `INSTALL PATH` section. You should notice an variable called `installPath`, which is the location that the script will prepare for your application. You may also notice that this variable is empty, so you will need to designate a location. Conventionally, you would want to set it to a subfolder in /opt, however, you can give it a path to somewhere more suitable. If you pass the script a directory that doesn't exist, it will try to create it.
__NOTE: To install in /opt, serverSetup will need to be run with root privileges.__
Next, go to the `FIREWALL PORT` section. This is where you can specify which port you want to run your application on.
Conventional ports you may want to open are:
- 8000: Default port gunicorn will run on.
- 443: Default port for SSL connections (more on SSL later on, don't use if you don't need it)
By default, port 8000 will be opened, so no change is needed if your app will use that. 
Finally, to allow serverSetup to be run, run `chmod +x serverSetup.sh`

## Installation and post-install
To start the install, run `sudo ./serverSetup.sh`. It will then begin the install process. No user input is needed until the service account is set up, at which point it will prompt you for credentials for the new user. Once the script finishes, you should have an empty folder at the path you specified earlier, which has been set up with the proper permissions. To test the new install, move the provided `flaskHelloWorld.py` into the server directory, and run it with the command `gunicorn -w 1 -b 0.0.0.0 flaskHelloWorld:app`. You can then access the page by going to your server's IP at port 8000.

## Other steps
In order to run gunicorn as the service account, put `sudo -u sv_gunicorn` before the command. Gunicorn can be run with several options, a short list of which can be found at the bottom of this README. 

## Gunicorn options
- `-w`: Specifies the number of workers to start
- `-b`: Can be used to bind gunicorn to a specific interface and port.
- `--reload`: Restarts the workers when a change to the application is detected.