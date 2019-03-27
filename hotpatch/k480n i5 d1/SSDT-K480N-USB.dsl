// SSDT-UIAC-ALL.dsl
//
// This SSDT can be used as a template to build your own
// customization for USBInjectAll.kext.
//
// This SSDT contains all ports, so using it is the same as without
// a custom SSDT.  Delete ports that are not connected or ports you
// do not need.
//
// Change the UsbConnector or portType as needed to match your
// actual USB configuration.
//
// Note:
// portType=0 seems to indicate normal external USB2 port (as seen in MacBookPro8,1)
// portType=2 seems to indicate "internal device" (as seen in MacBookPro8,1)
// portType=4 is used by MacBookPro8,3 (reason/purpose unknown)
//

DefinitionBlock ("", "SSDT", 2, "hack", "UIAC-ALL", 0)
{
    Device(UIAC)
    {
        Name(_HID, "UIA00000")

        Name(RMCF, Package()
        {
            // USB Power Properties for Sierra (using USBInjectAll injection)
            "AppleBusPowerControllerUSB", Package()
            {
                // these values happen to be iMac14,2 values...
                "kUSBSleepPortCurrentLimit", 2100,
                "kUSBSleepPowerSupply", 2600,
                "kUSBWakePortCurrentLimit", 2100,
                "kUSBWakePowerSupply", 2600,
            },
            "EH01", Package()
            {
                "port-count", Buffer() { 8, 0, 0, 0 },
                "ports", Package()
                {
                    "HP21", Package()
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 1, 0, 0, 0 },//CAMERA
                    },
                    "HP22", Package()
                    {
                        "UsbConnector", 0, 
                        "port", Buffer() { 2, 0, 0, 0 }, //zuo shang
                    },
                },
            },
            "8086_1e31", Package()
            {
                "port-count", Buffer() { 8, 0, 0, 0 },
                "ports", Package()
                {
                    "HS01", Package()
                    {
                        "UsbConnector", 0,
                        "port", Buffer() { 1, 0, 0, 0 }, //zuo usb3deusb2
                    },
                    "HS02", Package()
                    {
                        "UsbConnector", 0,
                        "port", Buffer() { 2, 0, 0, 0 },//youxia
                    },
                    "HS04", Package()
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 4, 0, 0, 0 },//weizhi
                    },
                    "SSP5", Package()
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 5, 0, 0, 0 },//zuo usb3
                    },
                },
            },
        })
    }
}
//EOF
