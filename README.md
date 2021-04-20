# Intel NUC D54250WYKH

This repository contains personal work and files, developed and maintained for a successful use with [Clover EFI bootloader](https://github.com/CloverHackyColor/CloverBootloader/) on this specific Intel NUC model. There are **no** ready, pre-packaged EFI solutions provided; instead, the needed configuration and ACPI files are published for those interested in studying the code, while creating their own bootloader configurations.

## Platform Generation

* Sandy Bridge = All Core ix-3xxx (HD Graphics 3000)
* Ivy Bridge = All Core ix-3xxx (HD Graphics 4000)
* **Haswell = All Core ix-4xxx (HD Graphics 4600)**
* Broadwell = All Core ix-5xxx (Iris Pro Graphics 6200)
* Skylake = All Core ix-6xxx (HD Graphics 5xx)
* Kaby Lake = All Core ix-7xxx (UHD/Iris Plus Graphics 6xx)
* Coffee Lake = All Core ix-8xxx (UHD/Iris Plus Graphics 6xx)

## Generation Details: Wilson Canyon (2013)

**Specifications:**<br/>
https://ark.intel.com/products/81164/Intel-NUC-Kit-D54250WYKH

**Downloads:**<br/>
https://downloadcenter.intel.com/product/81164/Intel-NUC-Kit-D54250WYKH

## Generation Details: Haswell (2013)

**CPU:** i5-4250U @ 1.30 GHz up to 2.60 GHz / 2 Cores / 4 Threads

**GPU:** Intel HD Graphics 5000 / 200 MHz up to 1.00 GHz

**URL:** https://ark.intel.com/products/75028/Intel-Core-i5-4250U-Processor-3M-Cache-up-to-2-60-GHz

## Geekbench

**V4 Scores:** https://browser.geekbench.com/v4/cpu/search?q=Core+i5-4250U

**V5 Scores:** https://browser.geekbench.com/v5/cpu/search?q=Core+i5-4250U

## Product Overview

![FrontPanel.jpg](Various/FrontPanel.jpg)

![RearPanel.jpg](Various/RearPanel.jpg)

## Compatible Models

Mac Model: MacMini7,1<br/>
CPU: i5-4260U @ 1.40 GHz up to 2.70 GHz / 2 Cores / 4 Threads<br/>
GPU: Intel HD Graphics 5000<br/>
Everymac: https://everymac.com/ultimate-mac-lookup/?search_keywords=Macmini7,1<br/>
Board ID: Mac-35C5E08120C7EEAF<br/>
EFI Revision: MM71.88Z.0220.B00.1409291751<br/>
EFI Revision: MM71.88Z.0224.B00.1708080033<br/>
EFI Revision: MM71.88Z.0226.B00.1709290808<br/>
EFI Revision: MM71.88Z.0232.B00.1806051659<br/>
EFI Revision: MM71.88Z.0234.B00.1809171422<br/>
EFI Revision: MM71.88Z.F000.B00.1812201005<br/>
EFI Revision: MM71.88Z.F000.B00.1902151233<br/>
EFI Revision: MM71.88Z.F000.B00.2002051745<br/>
EFI Revision: MM71.88Z.F000.B00.2004161539<br/>
EFI Revision: MM71.88Z.F000.B00.2012171735<br/>

## Current Setup

**Memory:** 8GB in 2 x 4GB PC3-12800 SO-DIMM (1.35V)<br/>
**RAM:** Corsair "Vengeance" DDR3L @ 1600MHz CL9 (Model CMSX8GX3M2B1600C9)<br/>
**WLAN:** Broadcom BCM94352HMB (AzureWave AW-CE123H) [[14e4:43b1]](http://pci-ids.ucw.cz/read/PC/14e4/43b1)<br/>
**BTLE:** Broadcom BCM20702A0 (Combined Controller) [413c:8143]<br/>
**SSD:** Samsung 850 EVO mSATA 120GB (Model MZ-M5E120BW)<br/>
**SSD:** Samsung 850 EVO SATA III 500 MB (Model MZ-75E500B/EU)<br/>
**Intel Product Compatibility Tool:** https://compatibleproducts.intel.com/ProductDetails?EPMID=81164

## Required BIOS Settings

For the most basic but _required_ BIOS settings, as well as previous firmware releases, see [BIOS](BIOS/) folder.

## Active Configuration

* No CPU ID faking required, power management is native; MSR `0xE2` appears locked;
* External USB 3.0 ports work as expected; using generated `USBPorts.kext`;
* Internal USB 2.0 headers not used; they are disabled in BIOS;
* Intel graphics acceleration works as `0x0A26000D` with [WhateverGreen](https://github.com/acidanthera/whatevergreen/releases);
* Analogue audio output works as layout ID `0x01` with [AppleALC](https://github.com/acidanthera/AppleALC/releases/);
* Digital audio output works out-of-the-box (using a MiniDP to MiniDP cable);
* Embedded Intel LAN interface works with [IntelMausi](https://github.com/acidanthera/IntelMausi/releases);
* Replaced WLAN module works with [BrcmPatchRAM](https://github.com/acidanthera/BrcmPatchRAM/releases);
* Replaced BTLE module works with [BrcmBluetoothInjector](https://github.com/acidanthera/BrcmPatchRAM/releases);
* Sleep/Wake both work without issues; see "Power" section in [Hackintool](https://github.com/headkaze/Hackintool/releases);
* Both mSATA and SSD SATA interfaces work with no effort nor kext needed.

For the complete list of all detected PCI hardware components and their respective addresses via `lspci -nn` command (in Ubuntu, loaded via USB) see [here](Various/lspci-nn.txt). This list was created with all devices enabled in BIOS and is used as a device "map" so that PCI IDs can be detected before tweaking the hardware (and BIOS) to run macOS.

![Peripherals.png](Various/Peripherals.png)

## Intel HD Graphics 5000 Properties

The `AAPL,ig-platform-id` property set to `0x0A26000D` is used for **WhateverGreen** to successfully enable acceleration on this graphics device [[8086:0a26]](http://pci-ids.ucw.cz/read/PC/8086/0a26). This ID represents the following properties and connectors:

| Properties             | Value(s)                             |
| ---------------------- | ------------------------------------ |
| Platform ID            | 0x0A26000D                           |
| Device ID              | 0x0A268086                           |
| Mobile                 | No                                   |
| Stolen Memory          | 96 MB                                |
| Framebuffer Memory     | 34 MB                                |
| Video Memory (VRAM)    | 1536 MB                              |
| Total Stolen Memory    | 131 MB                               |
| Total Cursor Memory    | 1 MB                                 |
| Maximum Stolen Memory  | 227 MB                               |
| Maximum Overall Memory | 228 MB                               |
| Model name             | Intel HD Graphics 5000               |
| Camellia (V0)          | Disabled                             |
| Connector Count        | 2                                    |
| Pipe / Port #1         | Bus ID `0x05` Pipe `9`  Connector DP |
| Pipe / Port #2         | Bus ID `0x04` Pipe `10` Connector DP |

Read more at [Intel® HD Graphics FAQs](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.IntelHD.en.md) on the **WhateverGreen** repository.

## USB Port Mapping on NUC Chassis

| USB 2.0 Port Name | USB 3.0 Port Name | Hardware Location  | Controller |
| ----------------- | ----------------- | ------------------ | ---------- |
| HP11 to HP18      | N/A               | Internal PR11 Hub  | EHCI       |
| HS01              | SS01              | Front RIGHT socket | XHCI       |
| HS02              | SS02              | Front LEFT socket  | XHCI       |
| HS03              | SS03              | Rear TOP socket    | XHCI       |
| HS04              | SS04              | Rear BOTTOM socket | XHCI       |
| HS07              | N/A               | Internal BTLE port | XHCI       |

The above active and working USB ports are listed in Hackintool when the two *internal* (USB 2.0) headers and **Consumer IR** are all _disabled_ in [BIOS](BIOS/) and when **all unused or non-referenced USB ports** are removed. In any other situation, ports such as HS05, HS06, HS08, HS09, HS10, USR1, USR2, SS05 and SS06 may be listed. All ports above are defined in `USBPorts.kext` according to their _electrical_ connector.

![USBPorts.png](Various/USBPorts.png)

![Neofetch.png](Various/Neofetch.png)
