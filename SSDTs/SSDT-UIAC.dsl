/*
 * Intel NUC D54250WYKH customization for USBInjectAll.kext
 *
 * Change the UsbConnector or portType as needed to match actual USB configuration:
 *
 *     UsbConnector = 0 for USB 2.0 connector(s)
 *     UsbConnector = 3 for USB 3.0 connector(s)
 *     UsbConnector = 255 for Internal connector(s)
 *
 *     portType = 0 for normal external USB 2.0 port(s)
 *     portType = 2 for internal device(s)
 *
 * Work by RehabMan at https://bitbucket.org/RehabMan/os-x-usb-inject-all/
 * Automation script by CorpNewt at https://github.com/corpnewt/USBMap/
 * Discussion at https://www.reddit.com/r/hackintosh/comments/9wkuc6/script_to_create_ssdtuiacamlinjector_kext/
 *
 */

DefinitionBlock ("SSDT-UIAC.aml", "SSDT", 1, "Hack", "_UIAC", 0x00000000)
{
    Device (UIAC)
    {
        Name (_HID, "UIA00000")

        // Hardware location on NUC chassis
        //
        // HS01 - USB 2.0 is the front RIGHT socket
        // HS02 - USB 2.0 is the front LEFT socket
        // HS03 - USB 2.0 is the rear TOP socket
        // HS04 - USB 2.0 is the rear BOTTOM socket
        // HS07 - USB 2.0 internal device for Broadcom Bluetooth module
        // SS01 - USB 3.0 is the front RIGHT socket
        // SS02 - USB 3.0 is the front LEFT socket
        // SS03 - USB 3.0 is the rear TOP socket
        // SS04 - USB 3.0 is the rear BOTTOM socket

        Name (RMCF, Package (0x06)
        {
            "EH01", Package (0x04)  // Intel Corporation 8 Series USB EHCI Controller [8086:9c26]
            {
                "port-count", Buffer (0x04) {0x01, Zero, Zero, Zero},  // Last port number used in list
                "ports", Package (0x02)
                {
                    "PR11", Package (0x04)
                    {
                        "UsbConnector", 0xFF,  // Define value depending on needed type i.e. internal or normal
                        "port", Buffer (0x04) {0x01, Zero, Zero, Zero},
                    },
//                  "PR12", Package (0x04)
//                  {
//                      "UsbConnector", 0xFF,
//                      "port", Buffer (0x04) {0x02, Zero, Zero, Zero},
//                  },
//                  "PR13", Package (0x04)
//                  {
//                      "UsbConnector", 0xFF,
//                      "port", Buffer (0x04) {0x03, Zero, Zero, Zero},
//                  },
//                  "PR14", Package (0x04)
//                  {
//                      "UsbConnector", 0xFF,
//                      "port", Buffer (0x04) {0x04, Zero, Zero, Zero},
//                  },
//                  "PR15", Package (0x04)
//                  {
//                      "UsbConnector", 0xFF,
//                      "port", Buffer (0x04) {0x05, Zero, Zero, Zero},
//                  },
//                  "PR16", Package (0x04)
//                  {
//                      "UsbConnector", 0xFF,
//                      "port", Buffer (0x04) {0x06, Zero, Zero, Zero},
//                  },
//                  "PR17", Package (0x04)
//                  {
//                      "UsbConnector", 0xFF,
//                      "port", Buffer (0x04) {0x07, Zero, Zero, Zero},
//                  },
//                  "PR18", Package (0x04)
//                  {
//                      "UsbConnector", 0xFF,
//                      "port", Buffer (0x04) {0x08, Zero, Zero, Zero},
//                  },
                },
            },

            "HUB1", Package (0x04)
            {
                "port-count", Buffer (0x04) {0x08, Zero, Zero, Zero},  // Last port number used in list for EH01
                "ports", Package (0x10)
                {
                    "HP11", Package (0x04)
                    {
                        "portType", Zero,
                        "port", Buffer (0x04) {0x01, Zero, Zero, Zero},
                    },
                    "HP12", Package (0x04)
                    {
                        "portType", Zero,
                        "port", Buffer (0x04) {0x02, Zero, Zero, Zero},
                    },
                    "HP13", Package (0x04)
                    {
                        "portType", Zero,
                        "port", Buffer (0x04) {0x03, Zero, Zero, Zero},
                    },
                    "HP14", Package (0x04)
                    {
                        "portType", Zero,
                        "port", Buffer (0x04) {0x04, Zero, Zero, Zero},
                    },
                    "HP15", Package (0x04)
                    {
                        "portType", Zero,
                        "port", Buffer (0x04) {0x05, Zero, Zero, Zero},
                    },
                    "HP16", Package (0x04)
                    {
                        "portType", Zero,
                        "port", Buffer (0x04) {0x06, Zero, Zero, Zero},
                    },
                    "HP17", Package (0x04)
                    {
                        "portType", Zero,
                        "port", Buffer (0x04) {0x07, Zero, Zero, Zero},
                    },
                    "HP18", Package (0x04)
                    {
                        "portType", Zero,
                        "port", Buffer (0x04) {0x08, Zero, Zero, Zero},
                    },
                },
            },

            "8086_9c31", Package (0x04)  // Intel Corporation 8 Series USB XHCI Controller [8086:9c31]
            {
                "port-count", Buffer (0x04) {0x0D, Zero, Zero, Zero},  // Last port number used in list
                "ports", Package (0x12)
                {
                    "HS01", Package (0x04)
                    {
                        "UsbConnector", 3,
                        "port", Buffer (0x04) {0x01, Zero, Zero, Zero},
                    },
                    "HS02", Package (0x04)
                    {
                        "UsbConnector", 3,
                        "port", Buffer (0x04) {0x02, Zero, Zero, Zero},
                    },
                    "HS03", Package (0x04)
                    {
                        "UsbConnector", 3,
                        "port", Buffer (0x04) {0x03, Zero, Zero, Zero},
                    },
                    "HS04", Package (0x04)
                    {
                        "UsbConnector", 3,
                        "port", Buffer (0x04) {0x04, Zero, Zero, Zero},
                    },
//                  "HS05", Package (0x04)
//                  {
//                      "UsbConnector", 3,
//                      "port", Buffer (0x04) {0x05, Zero, Zero, Zero},
//                  },
//                  "HS06", Package (0x04)
//                  {
//                      "UsbConnector", 3,
//                      "port", Buffer (0x04) {0x06, Zero, Zero, Zero},
//                  },
                    "HS07", Package (0x04)
                    {
                        "UsbConnector", 3,
                        "port", Buffer (0x04) {0x07, Zero, Zero, Zero},
                    },
//                  "HS08", Package (0x04)
//                  {
//                      "UsbConnector", 3,
//                      "port", Buffer (0x04) {0x08, Zero, Zero, Zero},
//                  },
//                  "HS09", Package (0x04)
//                  {
//                      "UsbConnector", 3,
//                      "port", Buffer (0x04) {0x09, Zero, Zero, Zero},
//                  },
                    "SS01", Package (0x04)
                    {
                        "UsbConnector", 3,
                        "port", Buffer (0x04) {0x0A, Zero, Zero, Zero},
                    },
                    "SS02", Package (0x04)
                    {
                        "UsbConnector", 3,
                        "port", Buffer (0x04) {0x0B, Zero, Zero, Zero},
                    },
                    "SS03", Package (0x04)
                    {
                        "UsbConnector", 3,
                        "port", Buffer (0x04) {0x0C, Zero, Zero, Zero},
                    },
                    "SS04", Package (0x04)
                    {
                        "UsbConnector", 3,
                        "port", Buffer (0x04) {0x0D, Zero, Zero, Zero},
                    },
               },
           },
        })
    }
}

