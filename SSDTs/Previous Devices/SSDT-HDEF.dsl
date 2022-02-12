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
 *     - Introduced minor code fixes to (HDEF) for improved device detection
 */

DefinitionBlock ("SSDT-HDEF.aml", "SSDT", 1, "Clover", "DevInj", 0x00003000)
{
    Method (\_SB.PCI0.HDEF._DSM, 4, NotSerialized)  // Intel Corporation 8 Series HD Audio Controller [8086:9c20]
    {
        If (LEqual (Arg2, Zero))
        {
            Return (Buffer (One) {0x03})
        }

        Return (Package (0x08)  // If using same hda-gfx value as IGPU and HDAU it may cause kernel panic!
        {
            "device_type",       Buffer (0x06) {"audio"},
        //  "hda-gfx",           Buffer (0x0A) {"onboard-1"},
            "layout-id",         Buffer (0x04) {0x03, 0x00, 0x00, 0x00},
            "model",             Buffer (0x23) {"Realtek ALC283 HD Audio Controller"},
            "PinConfigurations", Buffer (0x01) {Zero}
        })
    }
}
