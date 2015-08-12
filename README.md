#**EASYBOOT**

##**PRESENTATION**

The ultimate goal of this project is to modify kernels and drivers of an Android kernel.
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

##**GETTING STARTED**

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

* In each folder 'android' and 'wireless-config' you have a 'scripts' folder.
* In the 'scripts' folder, you will find scripts that will make your life easy.
* Scripts are detailed in README.doc file in each folder, along with instructions.

##**PROJECT TREE**

Once you're done with the configuration and initialization, you will
get a similar tree than the one showed below. Only important files are shown.

```
MTP
├── README.doc	       #GETTING STARTED
├── configure          #initial configuration (launch one time) 
├── init_env.sh        #environment variables 
│
├── android
│   ├── README.doc	    #DOCUMENTATION
│   │
│   ├── android-img-tools   #pack, unpack, make boot images
│   │   ├── mkbootimg	        #make a new boot image from a kernel build image
│   │   └── unpackbootimg       #unpack factory image
│   │
│   ├── android-sdk-linux   #Google SDK for android
│   │   ├── system-images       #images to be used by Android emulator
│   │   └── platform-tools      #flashboot, adb and Android emulator
│   │
│   ├── boot-img            #images to be flashed into device
│   │   ├── radio-hammerhead-m8974a-2.0.50.2.26.img
│   │   ├── bootloader-hammerhead-hhz12h.img
│   │   ├── boot.img	        #kernel
│   │   ├── custom_boot.img	#new kernel (modified)
│   │   ├── cache.img
│   │   ├── recovery.img
│   │   ├── system.img
│   │   └── userdata.img
│   │
│   ├── custom-recovery     #custom recovery (TWRP)
│   │   └── twrp-2.8.7.1-hammerhead.img
│   │
│   ├── toolchain           #cross-compiling toolchain
│   │   └── arm-eabi-4.7    
│   │
│   ├── kernels		    #different kernels
│   │   ├── hammerhead          #android 'hammerhead' kernel (Nexus 5)
│   │   ├── linux-3.4.0         #linux kernel 3.4.0
│   │   └── omnirom             #omnirom kernel
│   │
│   └── scripts             #scripts to build, make boot image, unlock and flash device
│       ├── build_kernel.sh     #build kernel script
│       ├── cleanup.sh          #cleanup old builds
│       ├── flash_all.sh        #flash images contained in boot-img into device
│       ├── flash_kernel.sh     #flash only custom_boot.img (new kernel) into device
│       ├── flash_recovery.sh   #flash only recovery.img (twrp) into device
│       ├── make_bootimg.sh     #make a boot image from kernel build
│       └── unlock_phone.sh     #unlock oem of phone
│
└── wireless-config
    ├── README.doc	    #DOCUMENTATION
    ├── hostapd.conf	    #hostapd AP config
    ├── hostapd_def.conf    #hostapd AP default config
    ├── start.sh	    #start AP, start monitoring and turn Power Save on
    ├── stop.sh		    #stop AP, stop monitoring and turn Power Save off
    ├── cleanup.sh          #delete all archived log (clear 'archive' folder)
    │
    ├── archive		    #old logs
    │
    ├── logs		    #airodump logs, ap log and ath9k_htc functions trace
    │   ├── ap_log.txt          #log of Access Point actions
    │   ├── ath9k_trace_log.txt #trace of functions calls inside ath9k_htc driver
    │   ├── beacons.cap-01.cap  #dump file to be open with Wireshark
    │   ├── beacons.cap-01.csv
    │   ├── beacons.cap-01.kismet.csv
    │   └── beacons.cap-01.kismet.netxml
    │
    └── scripts	            #scripts to on/off AP (hostapd), monitor, turn on/off PSM
        ├── monitor_ap.sh       #start a monitor interface and create a record dump file
        ├── psm_off.sh          #turn off psm
        ├── psm_on.sh           #turn on psm
        ├── start_ap.sh         #start AP mode
        └── stop_ap.sh          #stop AP mode
```   

