#!/bin/bash
Config()
{
        while read ligne
        do
			eval "temp=\$`echo $ligne | awk -F= '{print $1}'`"
			echo $temp | sed 's/\//\\\//g' > temp
			sed -i "s/`echo $ligne | awk -F= '{print $1}'`/`cat ./temp`/g" $1
        done < $2
}

(
cd $(dirname $0)/$1
. ./install.conf
export no_proxy=$__ENV_NET_LINK_NOPROXY__
export http_proxy=$__ENV_NET_LINK_PROXY__
export https_proxy=$__ENV_NET_LINK_PROXY__
export ftp_proxy=$__ENV_NET_LINK_PROXY__
mkdir loopdir isofiles workspace
wget -O original.iso http://miroir.univ-lorraine.fr/debian-cd/11.6.0/amd64/iso-cd/debian-11.6.0-amd64-netinst.iso
mount -o loop original.iso loopdir
rsync -v -a -H --exclude=TRANS.TBL loopdir/ isofiles/
umount loopdir
chmod u+w isofiles
cd workspace
gzip -d < ../isofiles/install.amd/initrd.gz | cpio --extract --verbose --make-directories --no-absolute-filenames 
wget -O preseed.cfg $__ISO_GENERATOR_LINK_PRESSED__
Config 'preseed.cfg' '../install.conf'
wget --directory-prefix=../isofiles/firmware $__ISO_HARD_LINK_FIRM__
su -c 'find . | cpio -H newc --create --verbose | gzip -9 > ../isofiles/install.amd/initrd.gz'
cd ../isofiles
chmod u+w md5sum.txt
md5sum `find -follow -type f` > md5sum.txt
genisoimage -ocustom.iso -r -J -no-emul-boot -boot-load-size 4 -boot-info-table -b isolinux/isolinux.bin -c isolinux/boot.cat .
mv custom.iso ../custom.iso
cd .. 
rm -Rf iso loopdir isofiles workspace
) 2>&1 | tee -a $1/$0.log
exit 1