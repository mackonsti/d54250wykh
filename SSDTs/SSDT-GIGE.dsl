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
 *     - Original device (GLAN) renamed (GIGE) via Clover DSDT patching
 *     - Introduced minor code fixes to (GIGE) for improved device detection
 */

DefinitionBlock ("SSDT-GIGE.aml", "SSDT", 1, "Clover", "DevInj", 0x00003000)
{
    Method (\_SB.PCI0.GIGE._DSM, 4, NotSerialized)  // Intel Corporation Ethernet Controller I218-V [8086:1559]
    {
        If (LEqual (Arg2, Zero))
        {
            Return (Buffer (One) {0x03})
        }

        Return (Package (0x06)
        {
            "built-in",    Buffer (0x01) {Zero},
            "device_type", Buffer (0x09) {"Ethernet"},
            "model",       Buffer (0x35) {"Intel Corporation I218-V Express Gigabit Ethernet"}
        })
    }
}
