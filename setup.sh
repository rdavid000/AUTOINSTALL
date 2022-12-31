#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y -q apache2 php5 php5-curl sudo rsync genisoimage 
echo 'www-data        ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers
rm /var/www/index.html
mv * /var/www/
chmod 777 /var/www -R
service sudo restart
service apache2 restart
exit 1