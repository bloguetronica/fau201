#!/bin/sh

echo Rolling back configurations...
rm -f /etc/udev/rules.d/70-bgtn-fau201.rules
service udev restart
echo Removing man pages...
rm -f /usr/local/share/man/man1/fau201-clear.1.gz
rm -f /usr/local/share/man/man1/fau201-list.1.gz
rm -f /usr/local/share/man/man1/fau201-lockotp.1.gz
rm -f /usr/local/share/man/man1/fau201-reset.1.gz
rm -f /usr/local/share/man/man1/fau201-volt.1.gz
rmdir --ignore-fail-on-non-empty /usr/local/share/man/man1
echo Removing binaries...
make -C /usr/local/src/fau201 uninstall
echo Removing source code files...
rm -rf /usr/local/src/fau201
echo Done!
