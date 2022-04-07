#!/bin/bash

echo "Wait 5min until everything is started"
sleep 5m 
echo "Check if debug file is present"
if test -f "/conf/boot/debug"; then
cd /conf/boot/
mkdir debug
cd debug
echo "export journalctl"
sudo journalctl > journal.debug
echo "export service list"
sudo systemctl list-units --type=service > services.debug
echo "export usb-devices"
sudo lsusb > usb.debug
echo "export rtl8812au"
sudo modinfo 88XXau > rtl8812au.debug
sudo iwconfig wlan0 >> rtl8812au.debug
echo "export dev"
sudo ls /dev >> dev.debug 

fi

