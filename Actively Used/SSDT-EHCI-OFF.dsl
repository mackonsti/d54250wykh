/*
 * USB compatibility table for disabling phantom devices EHC1 and EHC2
 * Source: https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/Source/SSDT-EHCx-DISABLE.dsl
 *
 * ATTENTION!
 * Only for 7, 8 and 9-series chipsets and macOS 10.11 and newer!
 *
 * To disable EHC1 and EHC2, set an option "XHCI Mode" to "Enabled" in your BIOS.
 * If the "XHCI Mode" option is not available in your BIOS or works incorrectly,
 * then use this ACPI table. Disabling through BIOS is preferable whenever possible.
 *
 * WARNING: For some motherboards, you need to use either "EH1D = One"
 * or "EH2D = One" but not both! This is because for some motherboards,
 * the device (EHC1 or EHC2) is used by macOS. Check the IORegistry first.
 */

DefinitionBlock ("SSDT-EHCI-OFF.aml", "SSDT", 1, "Clover", "EHCI-OFF", 0x00000000)
{
    Scope (\)
    {
        OperationRegion (RCRG, SystemMemory, 0xFED1F418, One)
        Field (RCRG, DWordAcc, Lock, Preserve)
        {
                ,   13,
            EH2D,   1,
                ,   1,
            EH1D,   1
        }

        Method (_INI, 0, NotSerialized)
        {
            // In most cases this patch does benefit all operating systems,
            // yet on select pre-Windows 10 systems it may cause issues.
            // Remove the condition below, in case you have none.

            If (_OSI ("Darwin"))
            {
                EH1D = One  // Disable EHC1
                EH2D = One  // Disable EHC2
            }
        }
    }
}

