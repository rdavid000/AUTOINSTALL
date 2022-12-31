#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
wget https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.6.0-amd64-netinst.iso
apt-get update
apt-get install -y -q apache2 php php-curl sudo rsync genisoimage
rm /var/www/index.html
echo 'www-data        ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers
service sudo restart
service apache2 restart
exit 1