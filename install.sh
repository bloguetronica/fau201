#!/bin/sh

echo Obtaining required packages...
apt-get -qq update
apt-get -qq install build-essential
apt-get -qq install libusb-1.0-0-dev
echo Copying source code files...
mkdir -p /usr/local/src/fau201/man
cp -f src/cp2130.cpp /usr/local/src/fau201/.
cp -f src/cp2130.h /usr/local/src/fau201/.
cp -f src/error.cpp /usr/local/src/fau201/.
cp -f src/error.h /usr/local/src/fau201/.
cp -f src/fau201-clear.cpp /usr/local/src/fau201/.
cp -f src/fau201device.cpp /usr/local/src/fau201/.
cp -f src/fau201device.h /usr/local/src/fau201/.
cp -f src/fau201-info.cpp /usr/local/src/fau201/.
cp -f src/fau201-list.cpp /usr/local/src/fau201/.
cp -f src/fau201-lockotp.cpp /usr/local/src/fau201/.
cp -f src/fau201-reset.cpp /usr/local/src/fau201/.
cp -f src/fau201-volt.cpp /usr/local/src/fau201/.
cp -f src/GPL.txt /usr/local/src/fau201/.
cp -f src/LGPL.txt /usr/local/src/fau201/.
cp -f src/libusb-extra.c /usr/local/src/fau201/.
cp -f src/libusb-extra.h /usr/local/src/fau201/.
cp -f src/Makefile /usr/local/src/fau201/.
cp -f src/man/fau201-clear.1 /usr/local/src/fau201/man/.
cp -f src/man/fau201-info.1 /usr/local/src/fau201/man/.
cp -f src/man/fau201-list.1 /usr/local/src/fau201/man/.
cp -f src/man/fau201-lockotp.1 /usr/local/src/fau201/man/.
cp -f src/man/fau201-reset.1 /usr/local/src/fau201/man/.
cp -f src/man/fau201-volt.1 /usr/local/src/fau201/man/.
cp -f src/README.txt /usr/local/src/fau201/.
cp -f src/utils.cpp /usr/local/src/fau201/.
cp -f src/utils.h /usr/local/src/fau201/.
echo Building and installing binaries and man pages...
make -C /usr/local/src/fau201 install clean
echo Applying configurations...
cat > /etc/udev/rules.d/70-bgtn-fau201.rules << EOF
SUBSYSTEM=="usb", ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="8c46", MODE="0666"
SUBSYSTEM=="usb_device", ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="8c46", MODE="0666"
EOF
service udev restart
echo Done!
