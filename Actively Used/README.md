# Actively Used Files

## Current NUC BIOS Revision

WYLPT10H.86A.0045.2017.0302.2108

## Current Clover Version Installed

These files have been running without issues on the official Clover **r5123.1** release on [Git Hub](https://github.com/CloverHackyColor/CloverBootloader/releases).

## Generating Personalised SMBIOS

It is important to generate a personalised SMBIOS using `Macmini7,1` as target model. For this, in order to complete the Clover configuration section for SMBIOS (namely `MLB`, `BoardSerialNumber`, `SerialNumber` and `SmUUID` keys) it is advised to use [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS) scripts and add the generated values in the respective places in `config.plist` file.

## Current Clover Configuration

Most of the configuration keys are set to **false** thus making a minimum needed set of patches, besides device renaming. Most notably, the following keys are used:

**Enabled ACPI/Boot/Kernel/System Options**
* `AddMCHC` (setting now moved across in SSDT-NAMES.aml instead)
* `DeleteUnused` (no longer used; it normally deletes legacy devices from ACPI table)
* `FixHeaders` (sanitizes headers to avoid kernel panics related to unprintable characters)
* `PluginType` (allows native CPU power management)
* `NeverHibernate` (improves overall sleep)
* `NoEarlyProgress` (hides any verbose pre-boot output)
* `AppleIntelCPUPM` (eliminates write operations to restricted MSR register 0xE2 in power management module)
* `KernelPm` (the only patch needed in KernelAndKextPatches category)
* `PanicNoKextDump` (avoids kext-dumping in a panic situation for diagnosing problems)
* `InjectKexts` (needed as all kexts reside in EFI folder)
* `InjectSystemID` (sets the SmUUID as the 'system-id' at boot)

**Note:** User **slice** (one of the Clover developers) confirmed that `DeleteUnused` deletes such legacy devices as `CRT_`, `DVI_`, `SPKR`, `ECP_`, `LPT_`, `FDC_` that no longer exist anymore in modern motherboards.

**Clover Device Properties**
* Define `AAPL,ig-platform-id` for Intel Iris HD Graphics 5000
* Define audio `layout-id` for Realtek ALC283 HD Audio Controller
* Set detected wireless `AAPL,slot-name` as AirPort Extreme

**Renamed Devices**
* `_DSM` to `XDSM`
* `_OSI` to `XOSI` (used in conjunction with **SSDT-XOSI.aml**)
* `B0D3` to `HDAU` (although **AppleALC** can do that, too)
* `EHC1` to `EH01` (used in conjunction with **USBPorts.kext**)
* `GFX0` to `IGPU` (although **WhateverGreen** can do that, too)
* `GLAN` to `GIGE`
* `HDAS` to `HDEF` (although **AppleALC** can do that, too)
* `SAT0` to `SATA`
* `_SB.PCI0.RP04.PXSX` to `ARPT` (the internal wireless controller)

## Current SSDTs Used

**SSDT-NAMES.aml**<br/>
Adds native vanilla devices such as `Device (MCHC)` and `Device (IMEI)` like a real Mac. Moreover, two sub-devices are injected in the existing SMBus device, namely `(BUS0)` and `(DVL0)`. Although these may not appear in IORegistry Explorer, they do exist in the original DSDT of a modern Mac.<br/>

**SSDT-XOSI.aml**<br/>
Combined with the needed Clover configuration patch (replacing `_OSI` with `XOSI`) this allows to simulate a Windows system running, thus getting increased compatibility in general.

## Note regarding USBPorts.kext generated with Hackintool

This NUC has four visible USB ports and they are all USB 3.0 connectors, except the two *internal* headers that are USB 2.0 connectors (and disabled in BIOS). This is why the definition of **USBPorts.kext** has both **HSxx** and **SSPx** ports defined as `<key>UsbConnector</key>` being `<integer>3</integer>` as it reflects the actual *electrical* connector.
