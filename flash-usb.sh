#!/bin/bash

dir=$( cd ${0%/*} && pwd -P )
echo $dir

cd ~/klipper
cp $dir/linux.config .config

echo ** Raspberry PI Update
# raspberry pi
make clean
make
sudo systemctl stop klipper
make flash

echo ** Spider USB Update
# spider
cp $dir/spider_usb.config .config
make clean
make
./scripts/flash-sdcard.sh -b 250000 /dev/ttyACM0 fysetc-spider-v1

sudo systemctl start klipper
