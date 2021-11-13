#!/bin/bash

dir=$( cd ${0%/*} && pwd -P )
echo $dir

cd ~/klipper
cp $dir/linux.config .config

# raspberry pi
make clean
make
sudo systemctl stop klipper
make flash

# spider
cp $dir/spider_uart.config .config
make clean
make
./scripts/flash-sdcard.sh -b 250000 /dev/ttyAMA0 fysetc-spider-v1

sudo systemctl start klipper
