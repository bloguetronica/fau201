This directory contains all source code files required for compiling the
commands for FAU201 Power Supply. A list of relevant files follows:
– cp2130.cpp;
– cp2130.h;
– error.cpp;
– error.h;
– fau201-clear.cpp;
– fau201device.cpp;
– fau201device.h;
– fau201-info.cpp;
– fau201-list.cpp;
– fau201-lockotp.cpp;
– fau201-reset.cpp;
– fau201-volt.cpp;
– libusb-extra.c;
– libusb-extra.h;
– Makefile;
– man/fau201-clear.1;
– man/fau201-info.1;
– man/fau201-list.1;
– man/fau201-lockotp.1;
– man/fau201-reset.1;
– man/fau201-volt.1;
– utils.cpp;
– utils.h.

In order to compile successfully all commands, you must have the packages
"build-essential" and "libusb-1.0-0-dev" installed. Given that, if you wish to
simply compile, change your working directory to the current one on a terminal
window, and simply invoke "make" or "make all". If you wish to install besides
compiling, run "sudo make install". Alternatively, if you wish to force a
rebuild, you should invoke "make clean all", or "sudo make clean install" if
you prefer to install after rebuilding.

It may be necessary to undo any previous operations. Invoking "make clean"
will delete all object code generated (binaries included) during earlier
compilations. You can also invoke "sudo make uninstall" to uninstall the
binaries.

P.S.:
Notice that any make operation containing the targets "install" or "uninstall"
(e.g. "make all install" or "make uninstall") requires root permissions, or in
other words, must be run with sudo.
