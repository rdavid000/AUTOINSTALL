# AUTOINSTALL
- The Dockerfile is for install the host who will execute generator.sh
- Put your iso you want custom in the iso folder and rename the .cfg with the same name
- Edit config.sh with your settings
- The generator.sh will execute the config file for replace "__VARIABLE__" in the preseed
- The FIRSTBOOT.sh will be execute at first boot (look the last line of the preseed.cfg in iso folder)



