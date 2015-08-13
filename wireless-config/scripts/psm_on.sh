#!/bin/bash
source ../../init.sh

### PSM_ON.SH ###

##############################
### HOW TO USE THIS SCRIPT ###
##############################

# ./psm_on.sh <interface_name> 

# e.g: ./psm_on.sh wlan2
# If you encounter an error: check the name of your wlan interface with ifconfig or iwconfig

#############################
### WHAT THIS SCRIPT DOES ###
#############################

# Turn on PSM (Power Save Mode) on the interface.

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
    echo "Usage: ./psm_on.sh <interface>"
    exit
fi

#Turn on Power Save Mode
echo ""
echo "===> Turning on Power Save Mode <==="
echo "Putting down WLAN interface ..."
sudo ifconfig $dev down
sleep 2
echo "Setting power save on ..."
sudo iw $dev set power_save on
echo "Puttin up WLAN interface ..."
sudo ifconfig $dev up
