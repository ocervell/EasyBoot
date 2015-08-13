#!/bin/bash
source ../../init.sh

adb devices
adb reboot bootloader
sleep 8

cd $BOOTIMG
fastboot devices
fastboot flash bootloader bootloader-$KERNEL_VER.img
sleep 5
fastboot flash radio radio-$RADIO_VER.img
sleep 5
fastboot flash boot custom_boot.img
sleep 5
fastboot flash system system.img
fastboot reboot
