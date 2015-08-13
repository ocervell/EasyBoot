#!/bin/bash
source ../../init.sh

echo ""
echo "===> Modifying hammerhead_defconfig file <==="
sleep 1
cat $KERNELS/ath9k.conf | sudo tee -a $KERNEL/arch/arm/configs/hammerhead_defconfig
echo " ... added to $KERNEL/arch/arm/configs/hammerhead_defconfig"
echo ""
echo "*********"
echo "IMPORTANT"
echo "*********"
echo "Note that modifications to the config file will take place only if"
echo "the whole kernel is rebuild using the new configuration file."
echo "Please use build_kernel.sh script or run the following commands:"
echo "  cd $KERNEL"
echo "  make hammerhead_defconfig"
echo "  make"
#!/bin/bash
