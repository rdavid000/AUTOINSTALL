#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
touch /root/FIRSTBOOT_START
apt-get update -y
apt-get upgrade -y
apt-get install openssh-server sudo -y
useradd -s /bin/bash -m r2d2 && echo 'r2d2:1234' | chpasswd
usermod -aG sudo r2d2
newgrp sudo
sed -i 's/#*X11Forwarding.*/X11Forwarding yes/' /etc/ssh/sshd_config
sed -i 's/#*X11UseLocalhost.*/X11UseLocalhost no/' /etc/ssh/sshd_config
rm /etc/systemd/system/default.target.wants/FIRSTBOOT.service
rm /etc/systemd/system/FIRSTBOOT.service
apt-get clean -yq
systemctl daemon-reload
sudo su r2d2
cd /home/r2d2
sudo apt install ca-certificates curl gnupg lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin pip -y
sudo usermod -aG docker r2d2
newgrp docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo docker build --no-cache https://github.com/rdavid000/MYKALI.git#main:docker -t mykali 2> mykali_build.log
sudo docker run --name MYKALI --tty --privileged -d --restart unless-stopped -p 4444:22 -p 4445:8080 mykali
curl https://raw.githubusercontent.com/rdavid000/Exegol/main/startup/firstboot.sh -o exegol.sh
chmod +x exegol.sh
sudo ./exegol.sh
sudo touch /root/FIRSTBOOT_END
exit 0