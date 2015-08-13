#!/bin/sh

adb devices
adb reboot bootloader
sleep 8

fastboot devices
fastboot oem unlock
#!/bin/bash
