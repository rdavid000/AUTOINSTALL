# AUTOINSTALL
This script will regenerate a debian iso "custom.iso" with your preseed and your firmware :

- The Dockerfile is for install the host who will execute generator.sh
- Put your iso in the iso folder and rename the .cfg with the same name
	exemple : cd ./iso && wget -O debian-11.6.0-amd64-netinst.iso http://miroir.univ-lorraine.fr/debian-cd/11.6.0/amd64/iso-cd/debian-11.6.0-amd64-netinst.iso && cd ../isogenerator
- Edit config.sh with your settings
- Edit config.sh with your settings
- The generator.sh will execute the config.sh file for replace "__VARIABLE__" in the preseed
- The FIRSTBOOT.sh will be execute at first boot
- Dont miss a chmod +x -R 



