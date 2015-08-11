#!/bin/bash

### MONITOR_AP.SH ###

##############################
### HOW TO USE THIS SCRIPT ###
##############################

# ./monitor_ap.sh <interface_name> 

# e.g: ./monitor_ap.sh wlan2
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
    echo "Usage: ./monitor_ap.sh <interface>"
    exit
fi

echo ""
echo "A monitor interface is about be created. The monitor output will be displayed on this console. Once it appears, you can browse Wi-Fi Access Points with your device and connect to 'MyNetwork'. The console will display the current status along with MAC address of any new device connected to the AP."

#Monitor, record and start dumping
echo ""
echo "===> Monitoring and recording dump files <===="
sleep 1
echo "Adding monitor interface mon0 on $dev ..."
sudo airmon-ng start $dev

echo ""
echo "Listing of wlan interfaces ..."
iwconfig

echo ""
echo "Starting dump ..."
sudo airodump-ng --band abg --beacons --bssid C4:E9:84:10:52:DF --write $wconfig/logs/beacons.cap mon0
read -p "Press any key to end monitoring ..."
