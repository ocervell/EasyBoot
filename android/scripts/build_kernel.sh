cd $KERNEL
make hammerhead_defconfig 
make -j4

cp $CUSTOM_IMAGE $ANDROID/boot-img
