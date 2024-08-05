#!/bin/bash
DEVICE='1546:01a9' #UBolx

BusID=`lsusb -d $DEVICE | cut -d ' ' -f 2`
DevID=`lsusb -d $DEVICE | cut -d ' ' -f 4 | cut -d ':' -f 1`

sudo chmod 777 /dev/bus/usb/$BusID/$DevID

wit='1a86:7523' # with motion

BusID2=`lsusb -d $wit | cut -d ' ' -f 2`
DevID2=`lsusb -d $wit | cut -d ' ' -f 4 | cut -d ':' -f 1`

sudo chmod 777 /dev/bus/usb/$BusID2/$DevID2

ps4='054c:05c4'

BusID3=`lsusb -d $ps4 | cut -d ' ' -f 2`
DevID3=`lsusb -d $ps4 | cut -d ' ' -f 4 | cut -d ':' -f 1`

sudo chmod 777 /dev/bus/usb/$BusID3/$DevID3

ODrive='1209:0d32'

BusID4=`lsusb -d $ODrive | cut -d ' ' -f 2`
DevID4=`lsusb -d $ODrive | cut -d ' ' -f 4 | cut -d ':' -f 1`

sudo chmod 777 /dev/bus/usb/$BusID4/$DevID4

sudo chmod 777 /dev/ttyACM*
sudo chmod 777 /dev/ttyUSB*


cd /etc/udev/rules.d | sudo udevadm control --reload-rules && udevadm trigger

cd ~/

ls -la /dev/bus/usb/$BusID/$DevID
ls -la /dev/bus/usb/$BusID2/$DevID2
ls -la /dev/bus/usb/$BusID3/$DevID3
ls -la /dev/bus/usb/$BusID4/$DevID4
ls -la /dev/ttyUSB*
ls -la /dev/ttyACM*

#chmod +x usbmod.shwe
