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

        Return (Package (0x0A)
        {
        // https://github.com/acidanthera/AppleALC/wiki/Supported-codecs
        //
        // 0x01 = Heaphones, Line In (ID 1)
        // 0x03 = Internal Speakers, Line In (ID 3)
        // 0x0B = Internal Speakers, Microphone (ID 11)
        // 0x0F = Internal Speakers, Line In, Microphone (ID 15)
        // 0x2C = Internal Speakers, 2 x Line In, Microphone (ID 44)
        // 0x42 = Internal Speakers, Line In (ID 66)
        //
        //  "device_type",       Buffer (0x06) {"audio"},
        //  "hda-gfx",           Buffer (0x0A) {"onboard-1"},
            "alc-layout-id",     Buffer (0x04) {0x01, 0x00, 0x00, 0x00},
            "layout-id",         Buffer (0x04) {0x01, 0x00, 0x00, 0x00},
            "model",             Buffer (0x23) {"Realtek ALC283 HD Audio Controller"},
            "name",              Buffer (0x06) {"audio"},
            "PinConfigurations", Buffer (0x01) {Zero}
        })
    }
}
