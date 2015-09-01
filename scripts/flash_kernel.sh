#!/bin/bash
source ../init.sh

adb devices
adb reboot bootloader
sleep 8

cd $BOOT_IMG
fastboot devices
sudo fastboot boot custom_boot.img
