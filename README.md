# EASYBOOT
#### Modify, build and flash a new Android kernel for Google Nexus 5 smartphone.

## **Presentation**

* EasyBoot contains all the tools to modify or add functionalities to the kernel and drivers for an Android device.
* EasyBoot allows you to achieve high efficiency to modify, build and flash kernels/ROMs.
* EasyBoot also contains a recovery bootloader (TWRP) that can save your device from a softfreeze, backup your system, and restore it. I strongly advise to flash this recovery image prior to try to flash a new kernel.

**Note:** At the moment, EasyBoot specifically provides tools for Nexus 5 (hammerhead kernel). In particular, downloading hammerhead kernel sources and factory image is automated.

## **What's left to do**
* Make it compatible with all Google's device.
* Make it compatible with other manufacter's device (Samsung, HTC, Nokia ...).
* Give more options to the user in the configure script.
* Create a Command Line Interface (CLI).
* Create a Graphical User Interface (GUI).

## **Getting Started**

**1. Initial configuration**

`source configure`
* exports a global variable in your `~/.bashrc` file.
* installs all necessary tools using `apt-get install` (adb, fastboot, build utilities ...).
* clones repositories needed to get started (android_img_repack_tools, ARM-eabi-4.7 toolchain, hammerhead kernel).
* gets factory images for hammerhead kernel.

In the `init.sh` script:
* If you want to use a different kernel than me, change KERNEL variable and put the path to your kernel source instead. You will also have to download the factory images for your device and put them into `boot-img` folder.
* If you want to use a different toolchain than me, change TOOLCHAIN variable and put the path to your toolchain binaries instead.

**2. Play with the scripts**

* In the `scripts` folder, you will find shell scripts that will make your life easy.
* Scripts are detailed in `manual.txt` file, along with instructions and useful commands.

## **Project Tree**

Once you're done with the configuration and initialization, you will
get a similar tree than the one showed below. Only important files are shown.

```
EasyBoot
├── README.md           #GitHub ReadMe file
├── manual.txt          #manual for scripts and commands
├── configure           #initial configuration (launch one time) 
├── init_env.sh         #environment variables 
│
├── android-img-tools   #Pack, unpack, make boot images
│   ├── mkbootimg           #make a new boot image from a kernel build image
│   └── unpackbootimg       #unpack factory image
│
├── boot-img            #Images to be flashed into device
    ├── radio-hammerhead-m8974a-2.0.50.2.26.img
│   ├── bootloader-hammerhead-hhz12h.img
│   ├── boot.img            #kernel
│   ├── custom_boot.img     #new kernel (modified)
│   │   ├── cache.img
│   │   ├── recovery.img
│   │   ├── system.img
│   │   └── userdata.img
│   │
│   ├── custom-recovery     #Custom recovery (TWRP)
│   │   └── twrp-2.8.7.1-hammerhead.img
│   │
│   ├── toolchain           #Cross-compiling toolchain
│   │   └── arm-eabi-4.7
│   │
│   ├── kernels             #Kernel sources (you can add new ones)
│   │   └── hammerhead          #android 'hammerhead' kernel (Nexus 5)
│   │
│   └── scripts             #Scripts to build, make boot image, unlock and flash device
│       ├── build_kernel.sh     #build kernel script
│       ├── cleanup.sh          #cleanup old builds
│       ├── flash_all.sh        #flash images contained in boot-img into device
│       ├── flash_kernel.sh     #flash only custom_boot.img (new kernel) into device
│       ├── flash_recovery.sh   #flash only recovery.img (twrp) into device
│       ├── make_bootimg.sh     #make a boot image from kernel build
│       └── unlock_phone.sh     #unlock oem of phone
│

```

