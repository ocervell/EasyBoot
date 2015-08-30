#**EASYBOOT**
####Modify, build and flash a new Android kernel for Google Nexus 5 smartphone.

##**Presentation**

The ultimate goal of this project is to modify or add functionalities to the kernel and drivers for an Android device.
The objective is to achieve high efficiency and not lose time setting everything up.
It specifically provides tools to compile hammerhead kernel (Nexus 5). 

The tree is composed of two main folders: 'android' and 'wireless-config':

**android**:
Contains all the tools to compile and flash a new kernel in a Nexus 5 phone, though
it can be easily adapted to any Android phone. It also provides a custom recovery (TWRP) so you
don't hardfreeze your phone.

**wireless-config**:
Contains all the tools to turn an hardware device into an Access Point.
The hardware device has to be compatible with MONITOR MODE. If it is not, the scripts won't work.
It also enables PSM (Power Save Mode) if your wireless driver supports it.

*Note: for a more detailed listing of what is included, go to PROJECT TREE section.*

##**Getting Started**

**1. Initial configuration**

`./configure`
* export a global variable in your ~/.bashrc file.
* install all necessary tools using apt-get install.
* clone repositories needed to get started.
* get sources for hammerhead kernel (Nexus 5).

**2. Initiate the environment**

`source init_env.sh`
* **Important:** Each time you reboot your computer, those global variables will disappear.
You have to source it again everytime. To avoid that, you can put the content of init_env.sh
in your ~/.bashrc file.
* If you're using a different kernel than me, change KERNEL variable.
* If you're using a different toolchain than me, change TOOLCHAIN variable.
* If you don't know, don't change anything.

**3. Play with the scripts**

* In the 'scripts' folder, you will find shell scripts that will make your life easy.
* Scripts are detailed in 'manual.txt' file in each folder, along with instructions.

##**Project Tree**

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

