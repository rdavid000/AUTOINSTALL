#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get install openssh-server sudo -y
useradd -s /bin/bash -m r2d2 && echo 'r2d2:1234' | chpasswd
usermod -aG sudo r2d2
newgrp sudo
sed -i 's/#*X11Forwarding.*/X11Forwarding yes/' /etc/ssh/sshd_config
sed -i 's/#*X11UseLocalhost.*/X11UseLocalhost no/' /etc/ssh/sshd_config
apt-get clean -yq
exit 0