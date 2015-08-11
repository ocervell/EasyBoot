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
sudo rm -rf logs/*
sudo rm -rf archive/*
echo " done."
