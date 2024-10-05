# Actively Used SSDTs

**SSDT-EC-USBX.aml**<br/>
Despite this being an older computer platform using some mobile components, modern MacOS systems expect the presence of device `EC` in order to boot correctly. This computer does **not** have any similar devices to disable (instead of renaming them) although references to device `H_EC` were found in the decompiled DSDT. Either way, this SSDT patch adds a vanilla `Device (EC)` under the `Device (LPCB)` tree, as well as the needed `Device (USBX)` that injects USB port(s) power supply and limit values, as found on a real Mac.

**SSDT-EHCI-OFF.aml**<br/>
This SSDT patch is needed to completely disable the EHCI controller (through variables `EH1D` and `EH2D`) so that we only use the XHCI controller that is recognised by modern MacOS systems, for all USB ports.

**SSDT-NAMES.aml**<br/>
Adds native vanilla devices such as `Device (MCHC)` and `Device (IMEI)` to otherwise unnamed IORegistry devices. Especially for recent MacOS versions, the definition and presence of device `(MCHC)` is required. Moreover, two sub-devices are injected in the existing SMBus device, namely `(BUS0)` and `(DVL0)`. Although these may not appear in IORegistry, they do exist in the original DSDT of a modern Mac.

**SSDT-PLUG.aml**<br/>
Enables XCPM (i.e. XNU CPU Power Management) and the CPU's power management by injecting to the most known CPU paths the needed key **plugin-type** with value of `One` that can be later verified in IORegistry. This method is only compatible with Haswell CPUs and newer.

**SSDT-XOSI.aml**<br/>
Combined with the needed OpenCore configuration patch (replacing `_OSI` with `XOSI` in DSDT) this allows to emulate a Windows system running, thus getting increased compatibility in general.

## Note regarding USBPorts.kext generated with Hackintool

This NUC has four visible USB ports and they are all USB 3.0 connectors, except the two *internal* headers that are USB 2.0 connectors (and disabled in BIOS). This is why **USBPorts.kext** contains and defines both **HSxx** and **SS0x** types of ports as being of `UsbConnector` type "3" because this reflects the actual *electrical* connector.
