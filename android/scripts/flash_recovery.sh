#!/bin/sh

adb devices
adb reboot bootloader
sleep 8

cd $RECOVERY
fastboot devices
fastboot flash recovery *.img
