#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
touch /root/FIRSTBOOT_OK
apt-get update -y
apt-get install openssh-server sudo -y
useradd -s /bin/bash -m r2d2 && echo 'r2d2:1234' | chpasswd
usermod -aG sudo r2d2
newgrp sudo
sed -i 's/#*X11Forwarding.*/X11Forwarding yes/' /etc/ssh/sshd_config
sed -i 's/#*X11UseLocalhost.*/X11UseLocalhost no/' /etc/ssh/sshd_config
apt-get clean -yq
rm /etc/systemd/system/default.target.wants/FIRSTBOOT.service
rm /etc/systemd/system/FIRSTBOOT.service
systemctl daemon-reload
exit 0