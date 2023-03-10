#!/bin/bash
service ssh start
echo -e "\n\nHello, i will build /root/AUTOINSTALL/isogenerator/custom_debian-11.6.0-amd64-netinst.iso for you...\n"
mknod /dev/loop0 -m0660 b 7 0
cd /root/ && git clone https://github.com/rdavid000/AUTOINSTALL.git
cd AUTOINSTALL/iso && wget -O debian-11.6.0-amd64-netinst.iso http://miroir.univ-lorraine.fr/debian-cd/11.6.0/amd64/iso-cd/debian-11.6.0-amd64-netinst.iso
cd ../isogenerator && chmod +x ./* -R
./generator.sh
mv /root/AUTOINSTALL/isogenerator/custom* /home/r2d2/
cd /home/r2d2/
chmod 777 `ls custom_*`
echo -e "\n\nYour /home/r2d2/cutom_debian-11.6.0-amd64-netinst.iso is ready \nYou can run ./generator.sh again if you have to modify isogenerator/config.sh\n"
exit 0