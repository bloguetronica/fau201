/* FAU201 Reset Command - Version 2.0 for Debian Linux
   Copyright (c) 2018-2022 Samuel Lourenço

   This program is free software: you can redistribute it and/or modify it
   under the terms of the GNU General Public License as published by the Free
   Software Foundation, either version 3 of the License, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful, but WITHOUT
   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
   FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
   more details.

   You should have received a copy of the GNU General Public License along
   with this program.  If not, see <https://www.gnu.org/licenses/>.


   Please feel free to contact me via e-mail: samuel.fmlourenco@gmail.com */


// Includes
#include <cstdlib>
#include <iostream>
#include <string>
#include "error.h"
#include "fau201device.h"

int main(int argc, char **argv)
{
    int err, errlvl = EXIT_SUCCESS;
    FAU201Device device;
    if (argc < 2) {  // If the program was called without arguments
        err = device.open();  // Open a device and get the device handle
    } else {  // Serial number was specified as argument
        err = device.open(argv[1]);  // Open the device having the specified serial number, and get the device handle
    }
    if (err == FAU201Device::SUCCESS) {  // Device was successfully opened
        int errcnt = 0;
        std::string errstr;
        device.reset(errcnt, errstr);  // Reset the target device
        if (errcnt > 0) {  // In case of error
            if (device.disconnected()) {  // If the device disconnected
                std::cerr << "Error: Device disconnected.\n";
            } else {
                printErrors(errstr);
            }
            errlvl = EXIT_FAILURE;
        } else {  // Operation successful
            std::cout << "Reset issued." << std::endl;
        }
        device.close();
    } else {  // Failed to open device
        if (err == FAU201Device::ERROR_INIT) {  // Failed to initialize libusb
            std::cerr << "Error: Could not initialize libusb\n";
        } else if (err == FAU201Device::ERROR_NOT_FOUND) {  // Failed to find device
            std::cerr << "Error: Could not find device.\n";
        } else if (err == FAU201Device::ERROR_BUSY) {  // Failed to claim interface
            std::cerr << "Error: Device is currently unavailable.\n";
        }
        errlvl = EXIT_FAILURE;
    }
    return errlvl;
}
