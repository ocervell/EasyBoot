#!/bin/bash
source ../../init.sh

### STOP_AP.SH ###

##############################
### HOW TO USE THIS SCRIPT ###
##############################

# ./stop_ap.sh <interface_name> 

# e.g: ./stop_ap.sh wlan2
# If you encounter an error: check the name of your wlan interface with ifconfig or iwconfig

#############################
### WHAT THIS SCRIPT DOES ###
#############################

# 1. Stop any access point running on the interface.
# 2. Restart network-manager service and kill some processes.

##############
### SCRIPT ###
##############

#Check input argument
if [ $# -eq 0 ]
  then
    dev=wlan0
    echo "Warning: No interface name supplied. Default interface set to wlan0."
elsel
    dev=$1
fi

#Check if interface exists
interface=$(iwconfig 2>&1 | grep $dev)
if [ $? -eq 1 ]
  then
    echo "Error: $dev interface doesn't exist. Check your interfaces using iwconfig and pass the correct interface name to the script."
    echo "Usage: ./stop_ap.sh <interface>"
    exit
fi

#Stop any running Access Point
echo ""
echo "===> Stop Access Point (AP) <==="
echo "Killing running processes ..."
sudo airmon-ng check kill

echo "Killing hostapd ..."
sudo kill $(ps aux | grep hostapd | awk '{print $2}')

echo ""
echo "Restarting network manager ..."
sudo service network-manager start

