#!/bin/bash

NOW=$(date +%Y-%m-%d-%H-%M)
TARGET_DIR="/home/user/OneDrive/DKST_708/$NOW"
mkdir /home/user/OneDrive/DKST_708/$NOW
cp /home/user/DKST708/DKSF_708/bin/targets/imx6/generic-glibc/openwrt-imx6-imx6ull-rootfs.tar.gz $TARGET_DIR/
cp /home/user/DKST708/DKSF_708/build_dir/target-arm_cortex-a7+neon-vfpv4_glibc_eabi/linux-imx6/zImage $TARGET_DIR/
cp /home/user/DKST708/DKSF_708/build_dir/target-arm_cortex-a7+neon-vfpv4_glibc_eabi/linux-imx6/image-ev-imx6ul-nano-mbx.dtb $TARGET_DIR/

cd /home/user/OneDrive/DKST_708/$NOW
mkdir tmp
tar -xvf openwrt-imx6-imx6ull-rootfs.tar.gz -C tmp
cd tmp
tar cfvj rootfs_openwrt.tar.bz2 ./*
cp rootfs_openwrt.tar.bz2 $TARGET_DIR/
cd ..
rm -rf tmp

onedrive --synchronize --single-directory 'DKST_708'
