/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20150930-64 [Sep 30 2015]
 * Copyright (c) 2000 - 2015 Intel Corporation
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000003E8 (1000)
 *     Revision         0x01
 *     Checksum         0x00
 *     OEM ID           "Clover"
 *     OEM Table ID     "1"
 *     OEM Revision     0x00003000 (12288)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20150930 (538249520)
 *
 *     - Added minor code fixes to device (PXSX) for improved vanilla detection
 */

DefinitionBlock ("SSDT-WIFI.aml", "SSDT", 1, "Clover", "DevInj", 0x00003000)
{
    Method (\_SB.PCI0.RP04.PXSX._DSM, 4, NotSerialized)  // Qualcomm Atheros AR928X Wireless Network Adapter [168c:002a]
    {
        If (LEqual (Arg2, Zero))
        {
            Return (Buffer (One) {0x03})
        }

        Return (Package (0x0E)
        {
            "AAPL,slot-name",      Buffer (0x07) {"Slot-1"},
            "built-in",            Buffer (0x01) {Zero},
            "device_type",         Buffer (0x13) {"AirPort Controller"},
        //  "compatible",          Buffer (0x0D) {"pci168c,2a"},
        //  "IOName",              Buffer (0x0D) {"pci168c,2a"},
            "name",                Buffer (0x10) {"AirPort Extreme"},
            "model",               Buffer (0x3E) {"Qualcomm Atheros AR9280 802.11 b/g/n Wireless Network Adapter"},
        //  "device-id",           Buffer (0x04) {0x2A, 0x00, 0x00, 0x00},
        //  "vendor-id",           Buffer (0x04) {0x8C, 0x16, 0x00, 0x00},
            "subsystem-id",        Buffer (0x04) {0x8F, 0x00, 0x00, 0x00},
            "subsystem-vendor-id", Buffer (0x04) {0x6B, 0x10, 0x00, 0x00}
        })
    }
}
