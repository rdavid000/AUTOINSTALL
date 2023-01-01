#!/bin/bash
__SYS_HOSTNAME__='IGetPreseed'
__SYS_DOMAIN__=''
__SYS_PROXY__=''
__SYS_PASSWORD__='1234'
__SYS_PRESEED__="cp /preseed.cfg /target/root; wget -O /target/etc/systemd/system/FIRSTBOOT.service https://raw.githubusercontent.com/rdavid000/AUTOINSTALL/main/startup/FIRSTBOOT.service; wget -O /target/root/FIRSTBOOT.sh https://raw.githubusercontent.com/rdavid000/AUTOINSTALL/main/startup/FIRSTBOOT.sh; chroot /target chmod +x /etc/systemd/system/FIRSTBOOT.service; chroot /target chmod +x /root/FIRSTBOOT.sh; systemctl enable FIRSTBOOT.service;"
__INS_FIRMWARE__='http://r.david000.free.fr/firmware-realtek_0.36_all.deb'
__INS_ISO__='debian-11.6.0-amd64-netinst'
__NET_IP__='192.168.200.203'
__NET_MASK__='255.255.255.0'
__NET_GW__='192.168.200.1'
__NET_DNS__='192.168.200.1'
