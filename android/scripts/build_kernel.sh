#!/bin/bash
source ../../init.sh

cd $KERNEL
sudo make hammerhead_defconfig ARCH=$ARCH SUBARCH=$SUBARCH CROSS_COMPILE=$CC
sudo make -j4 ARCH=$ARCH SUBARCH=$SUBARCH CROSS_COMPILE=$CC
sudo cp $CUSTOM_IMAGE $ANDROID/boot-img
