#!/bin/bash
__SYS_HOSTNAME__='MYROBOT'
__SYS_DOMAIN__='WORKGROUP'
__SYS_PROXY__=''
__SYS_PASSWORD__='1234'
__SYS_PRESEED__='cp /preseed.cfg /target/root; wget -O /target/root/FIRSTBOOT.sh https://raw.githubusercontent.com/rdavid000/AUTOINSTALL/main/startup/firstboot.sh; chroot /target chmod +x /root/FIRSTBOOT.sh; chroot /target echo -e "#!/bin/bash\n ./FIRSTBOOT.sh" > /etc/rc.local;'
__INS_FIRMWARE__='http://r.david000.free.fr/firmware-realtek_0.36_all.deb'
__INS_ISO__='debian-11.6.0-amd64-netinst'