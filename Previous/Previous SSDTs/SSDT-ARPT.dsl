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
 *     Device (PXSX) renamed to (ARPT) via Clover patching
 *
 *     Vanilla compatibility for (ARPT) found in:
 *     /System/Library/Extensions/IO80211Family.kext/Contents/PlugIns/AirPortBrcmNIC.kext/Contents/Info.plist
 *     /System/Library/Extensions/IO80211Family.kext/Contents/PlugIns/AirPortBrcm4360.kext/Contents/Info.plist
 */

DefinitionBlock ("SSDT-ARPT.aml", "SSDT", 1, "Clover", "DevInj", 0x00003000)
{
    Method (\_SB.PCI0.RP04.ARPT._DSM, 4, NotSerialized)  // Broadcom Corporation BCM4352 802.11ac Wireless Network Adapter [14e4:43b1]
    {
        If (LEqual (Arg2, Zero))
        {
            Return (Buffer (One) {0x03})
        }

        Return (Package (0x08)
        {
            "AAPL,slot-name",      Buffer (0x07) {"Slot-1"},
            "built-in",            Buffer (0x01) {Zero},
            "device_type",         Buffer (0x13) {"AirPort Controller"},
        //  "compatible",          Buffer (0x0D) {"pci14e4,43a0"},
        //  "IOName",              Buffer (0x0D) {"pci14e4,43a0"},
        //  "name",                Buffer (0x10) {"AirPort Extreme"},
            "model",               Buffer (0x3C) {"Broadcom BCM4352 802.11 a/b/g/n/ac Wireless Network Adapter"},
        //  "device-id",           Buffer (0x04) {0xA0, 0x43, 0x00, 0x00},
        //  "vendor-id",           Buffer (0x04) {0xE4, 0x14, 0x00, 0x00},
        //  "subsystem-id",        Buffer (0x04) {0x34, 0x01, 0x00, 0x00},
        //  "subsystem-vendor-id", Buffer (0x04) {0x6B, 0x10, 0x00, 0x00}
        })
    }
}

