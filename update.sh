#!/bin/bash

cd ~/klipper
cp ~/klipper_config/firmware/linux.config .config
make clean
make
sudo systemctl stop klipper
make flash
sudo systemctl start klipper

cp ~/klipper_config/firmware/spider_uart.config .config
make clean
make

sudo systemctl stop klipper
/home/pi/klipper/scripts/flash-sdcard.sh -b 250000 /dev/ttyAMA0 fysetc-spider-v1
sudo systemctl start klipper
