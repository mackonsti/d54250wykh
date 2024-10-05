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
 *     - Introduced minor code fixes to (SBUS) for vanilla compatibility
 */

DefinitionBlock ("SSDT-SBUS.aml", "SSDT", 1, "Clover", "SMBUS", 0x00003000)
{
    External (\_SB_.PCI0.SBUS, DeviceObj)

    Scope (\_SB.PCI0.SBUS)  // Intel Corporation 8 Series SMBus Controller [8086:9c22]
    {
        Device (BUS0)
        {
            Name (_ADR, Zero)
            Name (_CID, "smbus")

            Device (DVL0)
            {
                Name (_ADR, 0x57)
                Name (_CID, "diagsvault")

                Method (_DSM, 4, NotSerialized)
                {
                    If (LEqual (Arg2, Zero))
                    {
                        Return (Buffer (One) {0x03})
                    }

                    Return (Package (0x02) {"address", 0x57})
                }
            }
        }
    }
}
