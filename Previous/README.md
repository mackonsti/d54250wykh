# Previously Used Files

## NUC BIOS Revision Flashed

WYLPT10H.86A.0054.2019.0902.1752

## Clover Version Installed

These files have been running without issues on the official Clover **r5123.1** release on [GitHub](https://github.com/CloverHackyColor/CloverBootloader/releases). Since Clover **r5129** was released, an updated configuration structure was required as Clover now expects "Quirks" to be defined; the "Quirks" section has been added at the bottom of the Clover configuration file and is _specific_ to the NUC chipset/platform. The best guide for platform "Quirks" is the [Dortania Guide to OpenCore](https://dortania.github.io/OpenCore-Install-Guide/config.plist/coffee-lake.html).

## Generating Personalised SMBIOS

It is important to generate a personalised SMBIOS using `Macmini7,1` as target model. To complete the Clover configuration section for SMBIOS (namely `MLB`, `BoardSerialNumber`, `SerialNumber` and `SmUUID` keys) it is advised to use [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS) scripts and add the generated values in the respective places in `config.plist` file.

## Clover Configuration Parameters

Most of the configuration keys are set to **false** thus making a minimum needed set of patches, besides device renaming. Most notably, the following keys are used:

**1. Enabled ACPI/Boot/Kernel/System Options**

* `AddMCHC` → no longer used; creates `MCHC` device in IORegistry but this fix has now moved across in **SSDT-NAMES.aml** instead
* `DeleteUnused` → no longer used; it normally deletes legacy devices from ACPI tables
* **`FixHeaders`** → sanitizes all ACPI headers to avoid kernel panics related to unprintable characters
* **`PluginType`** → allows native CPU power management by macOS on IvyBridge and newer
* **`NeverHibernate`** → improves overall sleep behaviour as it disables the hibernation state detection
* **`NoEarlyProgress`** → hides any verbose pre-boot output on the screen
* `AppleIntelCPUPM` → not used; prevents kernel panics and allows native power management on older CPUs with MSR `0xE2` locked
* **`KernelPm`** → the only patch needed in `KernelAndKextPatches` category as MSR `0xE2` cannot be unlocked on this computer
* **`PanicNoKextDump`** → avoids kext-dumping in a panic situation for diagnosing problems
* **`RtVariables`** → defines a custom ROM value as Clover's auto-detection fails in our case
* **`InjectKexts`** → needed to be `true` as all kexts reside in EFI partition now
* **`InjectSystemID`** → sets the SmUUID as the 'system-id' at boot-time

**N.B.** To overcome the MSR `0xE2` (Cfg Lock) issue, we use `KernelPm` as it deals with Ivy Bridge CPUs (in XCPM mode) and newer, whereas `AppleIntelCPUPM` deals with older CPU generations up to IvyBridge.

**Note:** User [slice](https://www.insanelymac.com/forum/profile/112217-slice/) (one of the active Clover developers) confirmed that `DeleteUnused` deletes such legacy devices as `CRT_`, `DVI_`, `SPKR`, `ECP_`, `LPT_`, `FDC_` that _no longer_ exist in modern motherboards, including this NUC.

**2. Clover Device Properties**

* Define `AAPL,ig-platform-id` for Intel Iris HD Graphics 5000
* Define an `acpi-wake-type` value for XHCI controller
* Define audio `layout-id` for Realtek ALC283 HD Audio Controller
* Set detected wireless `AAPL,slot-name` as AirPort Extreme

**3. Renamed Devices**

* `_DSM` to `XDSM`
* `_OSI` to `XOSI` → used in conjunction with **SSDT-XOSI.aml**
* `B0D3` to `HDAU` → not needed as **AppleALC** can do that, too
* `EHC1` to `EH01` → not needed as EHCI ports are disabled via **SSDT-EHCI-OFF.aml**
* `GFX0` to `IGPU` → not needed as **WhateverGreen** can do that, too
* `GLAN` to `GIGE`
* `HDAS` to `HDEF` → not needed as **AppleALC** can do that, too
* `SAT0` to `SATA`
* `_SB.PCI0.RP04.PXSX` to `ARPT` → the internal wireless controller

## Current SSDTs Used :white_check_mark:

**SSDT-EHCI-OFF.aml**<br/>
This SSDT patch is needed to completely disable the EHCI controller so that we only use the XHCI controller for all USB ports.

**SSDT-NAMES.aml**<br/>
Adds native vanilla devices such as `Device (MCHC)` and `Device (IMEI)` like a real Mac. Moreover, two sub-devices are injected in the existing SMBus device, namely `(BUS0)` and `(DVL0)`. Although these may not appear in IORegistry Explorer, they do exist in the original DSDT of a modern Mac.<br/>

**SSDT-XOSI.aml**<br/>
Combined with the needed Clover configuration patch (replacing `_OSI` with `XOSI`) this allows to simulate a Windows system running, thus getting increased compatibility in general.

## Note regarding USBPorts.kext generated with Hackintool

This NUC has four visible USB ports and they are all USB 3.0 connectors, except the two *internal* headers that are USB 2.0 connectors (and disabled in BIOS). This is why the definition of **USBPorts.kext** has both **HSxx** and **SSPx** ports defined as `<key>UsbConnector</key>` being `<integer>3</integer>` as it reflects the actual *electrical* connector.
