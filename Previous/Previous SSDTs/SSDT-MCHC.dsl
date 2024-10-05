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
 *     - Added needed root device (MCHC) for improved vanilla detection
 */

DefinitionBlock ("SSDT-MCHC.aml", "SSDT", 1, "Clover", "DevInj", 0x00003000)
{
    External (\_SB_.PCI0, DeviceObj)

    Scope (\_SB.PCI0)
    {
        Device (MCHC)  // Intel Corporation Haswell DRAM Controller [8086:0a04]
        {
            Name (_ADR, 0x00000000)
        }
    }
}
