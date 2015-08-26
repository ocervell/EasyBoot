#!/bin/bash

echo "THIS IS THE INIT.SH FILE"
#####################
### BUILD OPTIONS ###
#####################
#Change those only if you know what you're doing with cross-compiling

export ARCH=arm #target architecture (android device = arm)
export SUBARCH=arm
export CC=$ANDROID/toolchain/arm-eabi-4.7/bin/arm-eabi- #cross-compiler (android device = arm-eabi)
export USE_CCACHE=1 #build cache to accelerate compilation

###################
### ENVIRONMENT ###
###################
#Running the ./configure script should have exported MTP which is the root path of EasyBoot.
#We still do it in this script "just in case".
#Don't touch those variables as the scripts won't run anymore if you do.

export MTP=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
export ANDROID=$MTP/android                           
export WCONFIG=$MTP/wireless-config		      
export KERNELS=$ANDROID/kernels
export IMG_TOOLS=$ANDROID/android-img-tools
export TOOLCHAIN=$ANDROID/toolchain/arm-eabi-4.7/bin
export BOOTIMG=$ANDROID/boot-img
export RECOVERY=$ANDROID/custom-recovery

#################
### SECONDARY ###
#################
#Change those if you want another kernel than hammerhead,
#or another version of the kernel.

export KERNEL=$KERNELS/hammerhead                    #kernel name
export CUSTOM_IMAGE=$KERNEL/arch/arm/boot/zImage-dtb #build image after compilation
export KERNEL_VER=hammerhead-hhz12h                  #build code name / kernel version
export RADIO_VER=hammerhead-m8974a-2.0.50.2.26       #radio code name

############
### PATH ###
############
#to make your life easier ...

export PATH=$PATH:$TOOLCHAIN:$IMG_TOOLS
