#!/bin/bash
(
cd /root
sleep 60
chmod +x config.sh
. config.sh
echo "export no_proxy=$__ENV_PROXY__" > /etc/rc.local
echo "export http_proxy=$__ENV_PROXY__" >> /etc/rc.local
echo "export https_proxy=$__ENV_PROXY__" >> /etc/rc.local
echo "export ftp_proxy=$__ENV_PROXY__" >> /etc/rc.local
echo '/root/client/STEP_1.sh' >> /etc/rc.local
echo 'exit 0' >> /etc/rc.local
apt-get update
apt-get -y install subversion
svn checkout $__INS_SVN__/client/
chmod 700 -R client
) 2>&1 | tee -a $0.log
reboot