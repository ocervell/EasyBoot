mkdir $ANDROID/boot-img-tmp
cd $ANDROID/boot-img-tmp

#Unpacking factory boot image
echo 'Unpacking image ...'
unpackbootimg -i $ANDROID/boot-img/boot.img
echo ' done.'

#Repacking new boot image with customized kernel
echo 'Making new image with custom kernel ...'
mkbootimg --base 0 --pagesize 2048 --kernel_offset 0x00008000 --ramdisk_offset 0x02900000 --second_offset 0x00f00000 --tags_offset 0x02700000 --cmdline 'console=ttyHSL0,115200,n8 androidboot.hardware=hammerhead  user_debug=31 maxcpus=2 msm_watchdog_v2.enable=1' --kernel $ANDROID/boot-img/zImage-dtb --ramdisk boot.img-ramdisk.gz -o custom_boot.img
sudo mv custom_boot.img ../boot-img
rm -r $ANDROID/boot-img-tmp
echo ' done.'

#!/bin/bash
