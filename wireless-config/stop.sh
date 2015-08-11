#!/bin/bash

### STOP.SH ###

##############################
### HOW TO USE THIS SCRIPT ###
##############################

# ./stop.sh <interface_name> 

# e.g: ./stop.sh wlan2
# If you encounter an error: check the name of your wlan interface with ifconfig or iwconfig

#############################
### WHAT THIS SCRIPT DOES ###
#############################

# 1. Stop an AP (Access Point) if any running on the interface.
# 2. Stop monitoring and remove monitor interface (mon0).
# 3. Open dump file (.cap) in Wireshark.
# 4. Move logs in 'logs' folder to 'archive' folder with timestamp.
# 5. Restart network-manager service and kill some processes.

#Note: aircrack-ng suite is required.

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
    echo "Usage ./stop.sh <interface>"
    exit
fi

echo "===> Stop Access Point, Remove Monitor Interface and Archive Logs <==="

echo "End of capture, removing monitor interface mon0 ..."
sudo airmon-ng stop $dev
sudo iw dev mon0 del

echo "Stopping Access Point ..."
source $wconfig/scripts/stop_ap.sh $dev

echo "Listing of wlan interface ..."
iwconfig

echo ""
echo "Open dump file in wireshark ..."
wireshark $wconfig/logs/beacons.cap-01.cap

echo ""
echo "===> Archiving logs <==="
cd $wconfig/logs
for f in *; do sudo mv -- "$f" "$f-$(stat -c %Y "$f" | date +%Y%m%d_%H%M)"; done
cd ..
sudo mv $wconfig/logs/* $wconfig/archive/
echo " done."

echo ""
echo "Script exited successfully."
