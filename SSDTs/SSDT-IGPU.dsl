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
 *     - Added needed devices (IGPU) (HDAU) and (IMEI) for improved vanilla detection
 */

DefinitionBlock ("SSDT-IGPU.aml", "SSDT", 1, "Clover", "DevInj", 0x00003000)
{
    External (\_SB_.PCI0, DeviceObj)

    Scope (\_SB.PCI0)
    {
        Device (IGPU)  // Intel Corporation Haswell Integrated Graphics Controller [8086:0a26]
        {
            Name (_ADR, 0x00020000)
            Method (_DSM, 4, NotSerialized)
            {
                If (LEqual (Arg2, Zero))
                {
                    Return (Buffer (One) {0x03})
                }

                Return (Package (0x06)
                {
                    "AAPL,ig-platform-id", Buffer (0x04) {0x0D, 0x00, 0x26, 0x0A},  // Core i5-4250U Graphics Controller
                    "hda-gfx",             Buffer (0x0A) {"onboard-1"},
                    "model",               Buffer (0x25) {"Intel Corporation HD 5000 Controller"}
                })
            }
        }

        Device (HDAU)  // Intel Corporation Haswell HD Audio Controller [8086:0a0c]
        {
            Name (_ADR, 0x00030000)
            Method (_DSM, 4, NotSerialized)
            {
                If (LEqual (Arg2, Zero))
                {
                    Return (Buffer (One) {0x03})
                }

                Return (Package (0x06)
                {
                    "device_type",  Buffer (0x06) {"audio"},
                    "hda-gfx",      Buffer (0x0A) {"onboard-1"},
                    "model",        Buffer (0x2E) {"Intel Corporation Haswell HD Audio Controller"}
                })
            }
        }

        Device (IMEI)  // Intel Corporation 8 Series HECI Interface [8086:9c3a]
        {
            Name (_ADR, 0x00160000)
            Method (_DSM, 4, NotSerialized)
            {
                If (LEqual (Arg2, Zero))
                {
                    Return (Buffer (One) {0x03})
                }

                Return (Package (0x02)  // Intel 8 Series Chipset Family ME Interface [8086:8c3a]
                {
                //  "compatible", Buffer (0x0D) {"pci8086,8c3a"},
                //  "device-id",  Buffer (0x04) {0x3A, 0x8C, 0x00, 0x00},
                //  "IOName",     Buffer (0x0D) {"pci8086,8c3a"},
                    "model",      Buffer (0x37) {"Intel Corporation 8 Series Chipset Family ME Interface"}
                })
            }
        }
    }
}
