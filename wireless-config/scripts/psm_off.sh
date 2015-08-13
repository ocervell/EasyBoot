#!/bin/bash
source ../../init.sh

### PSM_OFF.SH ###

##############################
### HOW TO USE THIS SCRIPT ###
##############################

# ./psm_off.sh <interface_name> 

# e.g: ./psm_off.sh wlan2
# If you encounter an error: check the name of your wlan interface with ifconfig or iwconfig

#############################
### WHAT THIS SCRIPT DOES ###
#############################

# Turn off PSM (Power Save Mode) on the interface.

##############
### SCRIPT ###
##############

#Check input argument
if [ $# -eq 0 ]
  then
    dev=wlan0
    echo "Warning: No interface name supplied. Default interface set to wlan0."
else
    dev=$1
fi

#Check if interface exists
interface=$(iwconfig 2>&1 | grep $dev)
if [ $? -eq 1 ]
  then
    echo "Error: $dev interface doesn't exist. Check your interfaces using iwconfig and pass the correct interface name to the script."
    echo "Usage: ./psm_off.sh <interface>"
    exit
fi

#Turn off Power Save Mode
echo ""
echo "===> Turning off Power Save Mode <==="
sudo ifconfig $dev down
iw $dev set power_save off
sudo ifconfig $dev up
