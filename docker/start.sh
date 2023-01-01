#!/bin/bash
service ssh start
echo -e "HELLO AUTOINSTALL\n"
cd /root/ && git clone https://github.com/rdavid000/AUTOINSTALL.git
cd AUTOINSTALL/iso && wget -O debian-11.6.0-amd64-netinst.iso http://miroir.univ-lorraine.fr/debian-cd/11.6.0/amd64/iso-cd/debian-11.6.0-amd64-netinst.iso
cd ../isogenerator && chmod +x ./* -R
./generator.sh
echo -e "Your cutom_debian-11.6.0-amd64-netinst.iso is in /root/AUTOINSTALL/isogenerator\nYou can run ./generator.sh again if you have to modify isogenerator/config.sh" 