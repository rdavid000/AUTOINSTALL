#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
wget https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.6.0-amd64-netinst.iso
apt-get update
apt-get install -y -q apache2 php php-curl sudo rsync genisoimage
echo 'www-data        ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers
rm /var/www/index.html
mv * /var/www/
chmod 777 /var/www -R
service sudo restart
service apache2 restart
exit 1