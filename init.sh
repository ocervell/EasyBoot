#!/bin/bash

#####################
### BUILD OPTIONS ###
#####################
#Change those only if you know what you're doing with cross-compiling

export ARCH=arm #target architecture (android device = arm)
export SUBARCH=arm
export CC=$EasyBoot/toolchain/arm-eabi-4.7/bin/arm-eabi- #cross-compiler (android device = arm-eabi)
export USE_CCACHE=1 #build cache to accelerate compilation

###################
### ENVIRONMENT ###
###################
#Running the ./configure script should have exported EasyBoot variable, which is the root path of EasyBoot.
#To make sure it is correctly exported, we do it again in this script.
#Don't touch those variables as the scripts won't run anymore if you do.

export EasyBoot=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
export KERNELS=$EasyBoot/kernels
export IMG_TOOLS=$EasyBoot/android-img-tools
export TOOLCHAIN=$EasyBoot/toolchain/arm-eabi-4.7/bin
export BOOTIMG=$EasyBoot/boot-img
export RECOVERY=$EasyBoot/custom-recovery

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
