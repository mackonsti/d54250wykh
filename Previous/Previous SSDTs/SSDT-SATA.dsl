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
 *     - Original device (SAT0) renamed (SATA) via Clover DSDT patching
 *     - Added compatibility ID to (SATA) for improved vanilla detection
 */

DefinitionBlock ("SSDT-SATA.aml", "SSDT", 1, "Clover", "DevInj", 0x00003000)
{
    Method (\_SB.PCI0.SATA._DSM, 4, NotSerialized)  // Intel Corporation 8 Series SATA Controller [AHCI mode] [8086:9c03]
    {
        If (LEqual (Arg2, Zero))
        {
            Return (Buffer (One) {0x03})
        }

        Return (Package (0x06)
        {
            "device-id",   Buffer (0x04) {0x03, 0x8C, 0x00, 0x00},
            "compatible",  Buffer (0x0D) {"pci8086,8c03"},
        //  "IOName",      Buffer (0x0D) {"pci8086,8c03"},
        //  "name",        Buffer (0x0D) {"pci8086,8c03"},
        //  "device_type", Buffer (0x05) {"AHCI"},
            "model",       Buffer (0x2B) {"Intel Corporation 8 Series SATA Controller"}
        })
    }
}
