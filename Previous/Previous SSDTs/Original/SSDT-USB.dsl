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
 *     - Introduced minor code fixes to (EHC1) and (XHC) for compatibility
 */

DefinitionBlock ("SSDT-USB.aml", "SSDT", 1, "Clover", "DevInj", 0x00003000)
{
    Method (\_SB.PCI0.EHC1._DSM, 4, NotSerialized)  // Intel Corporation 8 Series USB EHCI Controller [8086:9c26]
    {
        If (LEqual (Arg2, Zero))
        {
            Return (Buffer (One) {0x03})
        }

        Return (Package (0x12)
        {
            "AAPL,current-available",         0x0834,  // 2100mA
            "AAPL,current-extra",             0x0898,  // 2200mA
            "AAPL,current-in-sleep",          0x03E8,  // 1000mA
            "AAPL,current-extra-in-sleep",    0x0640,  // 1600mA
            "AAPL,max-port-current-in-sleep", 0x0834,  // 2100mA
            "AAPL,device-internal",           0x01,
            "AAPL,clock-id",                  Buffer (0x01) {0x01},
        //  "AAPL,slot-name",                 Buffer (0x09) {"Built In"},
            "device_type",                    Buffer (0x05) {"EHCI"},
            "model",                          Buffer (0x2F) {"Intel Corporation 8 Series USB EHCI Controller"}
        })
    }

    Method (\_SB.PCI0.XHC._DSM, 4, NotSerialized)  // Intel Corporation 8 Series USB XHCI Controller [8086:9c31]
    {
        If (LEqual (Arg2, Zero))
        {
            Return (Buffer (One) {0x03})
        }

        Return (Package (0x12)
        {
            "AAPL,current-available",         0x0834,  // 2100mA
            "AAPL,current-extra",             0x0898,  // 2200mA
            "AAPL,current-in-sleep",          0x03E8,  // 1000mA
            "AAPL,current-extra-in-sleep",    0x0640,  // 1600mA
            "AAPL,max-port-current-in-sleep", 0x0834,  // 2100mA
            "AAPL,device-internal",           0x02,
            "AAPL,clock-id",                  Buffer (0x01) {0x02},
        //  "AAPL,slot-name",                 Buffer (0x09) {"Built In"},
            "device_type",                    Buffer (0x05) {"XHCI"},
            "model",                          Buffer (0x2F) {"Intel Corporation 8 Series USB XHCI Controller"}
        })
    }
}
