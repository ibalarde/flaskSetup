# service.sh
# sets up and enables gunicorn as a service

sudo mv gunicorn.service /etc/systemd/service/
sudo systemctl start gunicorn
sudo systemctl enable gunicorn
