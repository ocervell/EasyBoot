#!/bin/bash

### CLEANUP.SH ###

##############################
### HOW TO USE THIS SCRIPT ###
##############################

# ./cleanup.sh

#############################
### WHAT THIS SCRIPT DOES ###
#############################

# Cleanup old log files present in 'archive' folder.

##############
### SCRIPT ###
##############

echo "===> Cleaning up <==="
sudo rm -rf $WCONFIG/logs/*
sudo rm -rf $WCONFIG/archive/*
echo " done."
