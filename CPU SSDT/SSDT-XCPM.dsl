/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140210-64 [Feb 10 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000BB (187)
 *     Revision         0x01
 *     Checksum         0x00
 *     OEM ID           "APPLE "
 *     OEM Table ID     "CpuPm"
 *     OEM Revision     0x00018500 (99584)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20140210 (538182160)
 */

DefinitionBlock ("SSDT-XCPM.aml", "SSDT", 1, "APPLE ", "CpuPm", 0x00018500)
{
    External (\_PR_.CPU0, DeviceObj)

    Scope (\_PR_.CPU0)
    {
        Method (_INI, 0, NotSerialized)
        {
            Store ("host processor.......: Intel(R) Core(TM) i5-4250U CPU @ 1.30GHz", Debug)
            Store ("target processor.....: i5-4250U", Debug)
            Store ("number of processors.: 1", Debug)
            Store ("baseFrequency........: 800", Debug)
            Store ("frequency............: 1300", Debug)
            Store ("busFrequency.........: 100", Debug)
            Store ("logicalCPUs..........: 4", Debug)
            Store ("maximum TDP..........: 15", Debug)
            Store ("packageLength........: 19", Debug)
            Store ("turboStates..........: 13", Debug)
            Store ("maxTurboFrequency....: 2600", Debug)
            Store ("machdep.xcpm.mode....: 1", Debug)
            Store ("credit...............: Piker-Alpha", Debug)
        }

        Method (_DSM, 4, NotSerialized)
        {
            Store ("Method _PR_.CPU0._DSM Called", Debug)

            If (LEqual (Arg2, Zero))
            {
                Return (Buffer (One)
                {
                     0x03
                })
            }

            Return (Package (0x02)
            {
                "plugin-type",
                One
            })
        }
    }
}

