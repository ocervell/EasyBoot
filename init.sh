#!/bin/bash

MTP=$PWD

export ARCH=arm
export SUBARCH=arm

export ANDROID=$MTP/android

export KERNELS=$ANDROID/kernels
export KERNEL=$KERNELS/hammerhead

export CROSS_COMPILE=$ANDROID/toolchain/arm-eabi-4.7/bin/arm-eabi-
export CC=$ANDROID/toolchain/arm-eabi-4.7/bin/arm-eabi-
export USE_CCACHE=1

export IMG_TOOLS=$ANDROID/android-img-tools
export TOOLCHAIN=$ANDROID/toolchain/arm-eabi-4.7/bin
export BOOTIMG=$ANDROID/boot-img
export CUSTOM_IMAGE=$KERNEL/arch/arm/boot/zImage-dtb
export RECOVERY=$ANDROID/custom-recovery

export KERNEL_VER=hammerhead-hhz12h
export RADIO_VER=hammerhead-m8974a-2.0.50.2.26

export wconfig=$PWD/wireless-config

export PATH=$PATH:$SDK_TOOLS:$TOOLCHAIN
