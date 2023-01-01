# AUTOINSTALL
This script will regenerate a debian iso "custom.iso" with your preseed and your firmware :

- The Dockerfile is for install the host who will execute generator.sh
- Put your iso in the iso folder and rename the .cfg with the same name
- Edit config.sh with your settings
	- The FIRSTBOOT.sh will be execute at first boot. Check --SYS_PRESEED-- in config.sh
- Dont miss a chmod +x -R isogenerator/
- The generator.sh will execute the config.sh file for replace --VARIABLE-- in the preseed





