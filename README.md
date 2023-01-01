# AUTOINSTALL

>>> A script for build your custom debian ISO

This script will regenerate a debian custom ISO with your preseed and your firmware :
- The Dockerfile is for install the host who will execute generator.sh, run :
	- docker build https://github.com/rdavid000/AUTOINSTALL.git#main:docker -t debian:ISOGenerator
	- sudo docker run --name ISOGenerator --tty --interactive --network bridge -p 4444:22 debian:ISOGenerator
	- SSH Login : r2d2 / Password : 1234 (same for root)
- If you dont want use docker, run :
	- apt-get update -y
	- apt-get install git rsync genisoimage wget cpio net-tools -y
	- apt-get clean -yq
- Clone the repo :
	- git clone https://github.com/rdavid000/AUTOINSTALL.git
- Put your iso in the iso folder and rename the .cfg with the same name :
	- cd AUTOINSTALL/iso && wget -O debian-11.6.0-amd64-netinst.iso http://miroir.univ-lorraine.fr/debian-cd/11.6.0/amd64/iso-cd/debian-11.6.0-amd64-netinst.iso && cd ../isogenerator && chmod +x ./* -R
- Edit isogenerator/config.sh with your settings :
	- The FIRSTBOOT.sh will be execute at first boot. Check --SYS_PRESEED-- in config.sh.
	- The generator.sh will execute the config.sh file for replace --VARIABLE-- in the preseed.
- Run the generator :
	- chmod +x -R AUTOINSTALL/isogenerator/
	- ./generator.sh
- Open custom.iso with 7zip and check your \install.amd\initrd.gz\initrd\preseed.cfg file and \firmware\ folder for your firmware.
- If you see a file '/root/FIRSTBOOT_OK' after you install a machine then FIRSTBOOT.sh have been execute.





