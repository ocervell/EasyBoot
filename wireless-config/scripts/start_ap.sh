#!/bin/bash

### START_AP.SH ###

##############################
### HOW TO USE THIS SCRIPT ###
##############################

# ./start_ap.sh <interface_name> 

# e.g: ./start_ap.sh wlan2
# If you encounter an error: check the name of your wlan interface with ifconfig or iwconfig

#############################
### WHAT THIS SCRIPT DOES ###
#############################

# 1. Check the input argument
# 2. Check if wireless interface is valid
# 3. Create a monitor interface with airmon-ng named mon0 (if hardware compatible with Monitor Mode).
# 4. Monitor incoming and outgoing  a with airodump-ng and generate a dump file (.cap).

#Notes: 
 # Generated dump file is in 'logs' folder. 
 # aircrack-ng suite is required.

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
    echo "Usage ./start_ap.sh <interface>"
    exit
fi

#Start Access Point and tweak Hostapd config
echo ""
echo "===> Start Access Point (AP) <==="

echo "Stopping Network Manager to avoid problems..."
sudo service network-manager stop

echo ""
echo "Tweaking hostapd config file ..."
sed -i "s/^interface.*/interface=$1/" $wconfig/hostapd_def.conf
echo "Launching hostapd configuration..."
sudo hostapd -d $wconfig/hostapd_def.conf 2>&1 | sudo tee $wconfig/logs/ap_log.txt &
