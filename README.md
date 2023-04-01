# README
## for setting up a flask app with gunicorn

## IMPORTANT:
__Make sure that the following files are in this folder:__
- `serverSetup.sh`
- `flaskHelloWorld.py`
- `flaskModuleLoader.py`
- `flaskModule1.py`
- `gunicorn_cron.sh`

## Before install
Before beginning the installation process, there are several configuration-related items that need to be set up. To begin, open the file `serverSetup.sh` and go to the `INSTALL PATH` section. You should notice an variable called `installPath`, which is the location that the script will prepare for your application. By default, it will install the server in /opt/flaskapp/, which should be fine for must use cases. However, if you need to put it somewhere else, you can change the variable to whatever path you need. (If you pass the script a directory that doesn't exist, it will try to create it.)
__NOTE: To install in /opt, serverSetup will need to be run with root privileges.__
Next, go to the `FIREWALL PORT` section. This is where you can specify which port you want to run your application on.
Conventional ports you may want to open are:
- 80: Default port for HTTP connections
- 443: Default port for SSL connections

By default, port 80 will be opened, so no change is needed if your app will use that. 
Finally, to allow serverSetup to be run, run `chmod +x serverSetup.sh`

## Installation and post-install
To start the install, run `sudo ./serverSetup.sh`. No user input is needed until the service account is set up, at which point it will prompt you for credentials for the new user. Once the script finishes, you should have an empty folder at the path you specified earlier, which has been set up with the proper permissions. To test the new install, move the provided `flaskHelloWorld.py` into the server directory, and run it with the command `gunicorn -w 1 -b 0.0.0.0 flaskHelloWorld:app`. You can then access the page by going to your server's IP at port 8000.

## Running gunicorn on boot (with cron)
If you want gunicorn to be a start-up service, you will want to set it up with `cron`. First, go to the application directory and open `gunicorn_service.sh`, then change the two placeholders to your directory and app name, respectively.
Next, in order to have cron start the server on boot, open the file `/etc/crontab` as root and add the line `@reboot sv_gunicorn [install path]/gunicorn_cron.sh`.

## Gunicorn options
- `-w`: Specifies the number of workers to start
- `-b`: Can be used to bind gunicorn to a specific interface and port.
- `--reload`: Restarts the workers when a change to the application is detected.