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
. ./config.sh
mkdir loopdir isofiles workspace
cp ../iso/$__INS_ISO__.iso .
mount -o loop $__INS_ISO__.iso loopdir
rsync -v -a -H --exclude=TRANS.TBL loopdir/ isofiles/
umount loopdir
chmod u+w isofiles
cd workspace
gzip -d < ../isofiles/install.amd/initrd.gz | cpio --extract --verbose --make-directories --no-absolute-filenames
cp ../../iso/$__INS_ISO__.cfg preseed.cfg
Config 'preseed.cfg' '../config.sh'
wget --directory-prefix=../isofiles/firmware $__INS_FIRMWARE__
su -c 'find . | cpio -H newc --create --verbose | gzip -9 > ../isofiles/install.amd/initrd.gz'
cd ../isofiles
chmod u+w md5sum.txt
md5sum `find -follow -type f` > md5sum.txt
genisoimage -ocustom.iso -r -J -no-emul-boot -boot-load-size 4 -boot-info-table -b isolinux/isolinux.bin -c isolinux/boot.cat .
mv custom.iso ../custom_$__INS_ISO__.iso
cd ..
rm -Rf iso loopdir isofiles workspace
) 2>&1 | tee -a $1/$0.log
exit 1
