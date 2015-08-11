#!/bin/bash

### START.SH ###

##############################
### HOW TO USE THIS SCRIPT ###
##############################

# ./start.sh <interface_name> 

# e.g: ./start.sh wlan2
# If you encounter an error: check the name of your wlan interface with ifconfig or iwconfig

#############################
### WHAT THIS SCRIPT DOES ###
#############################

# 1. Enable PSM (Power Save Mode) on the interface.
# 2. Start an AP (Access Point) which you can discover and connect to with devices.
# 3. Create a monitor interface named mon0 (if hardware compatible with Monitor Mode).
# 4. Monitor incoming and outgoing packets and generate a dump file (.cap).

#Notes: 
 # AP Identifier is 'my_network' by default, modifiable in hostapd_def.conf.
 # AP runs in 'g' mode.
 # 
 # All logs (AP, Monitor logs, driver trace) are generated in 'logs' folder.
 # aircrack-ng suite is required.

##############
### SCRIPT ###
##############

#Check input argument
echo ""
if [ $# -eq 0 ]
  then
    dev=wlan0
    echo "Warning: No interface name supplied. Default interface set to wlan0."
else
    dev=$1
fi

#Check if interface exists
echo ""
interface=$(iwconfig 2>&1 | grep $dev)
if [ $? -eq 1 ]
  then
    echo "Error: $dev interface doesn't exist. Check your interfaces using iwconfig and pass the correct interface name to the script."
    echo "Usage: ./start.sh <interface>"
    exit
fi


echo ""
echo "===> List WLAN interfaces <==="
iwconfig
sleep 1

source $wconfig/scripts/psm_on.sh $dev
source $wconfig/scripts/start_ap.sh $dev &
(exec gnome-terminal -x "bash $wconfig/scripts/monitor_ap.sh $dev")
