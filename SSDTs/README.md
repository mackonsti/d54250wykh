# Previous SSDTs Used

All the files found here are SSDTs previously used for this hardware. They were mainly used with previous versions of Clover and macOS, too. They are kept for reference purposes.

For the latest files used, see **Actively Used** folder.

Most of the SSDTs here injected a *Method* really, after enabling the respective *patch* in Clover:

	<dict>
		<key>Comment</key>
		<string>Rename _DSM to XDSM</string>
		<key>Disabled</key>
		<false/>
		<key>Find</key>
		<data>
		X0RTTQ==
		</data>
		<key>Replace</key>
		<data>
		WERTTQ==
		</data>
	</dict>

By renaming the native `_DSM to XDSM` this allowed for custom `Method (_DSM)` to be injected via these SSDTs for device properties, mostly prior to macOS Mojave.

* SSDT-ARPT: Injected Method for device (ARPT) vanilla properties;
* SSDT-GIGE: Injected Method for device (GIGE) vanilla properties;
* SSDT-HDEF: Injected Method for device (HDEF) properties and Layout ID;
* SSDT-IGPU: Injected Methods for devices (IGPU) (HDAU) and (IMEI) for compatibility;
* SSDT-LPCB: Injected Method for device (LPCB) for compatibility;
* SSDT-MCHC: Assign a name to a required device that appear otherwise nameless in IORegistryExplorer;
* SSDT-SATA: Injected Method for device (SATA) for compatibility;
* SSDT-SBUS: Added sub-device (BUS0) and (DVL0) to approximate a real Mac;
* SSDT-UIAC: Motherboard USB ports definition for using with *USBInjectAll.kext* solving USB problems;
* SSDT-USB: Injected Methods for devices (EH01) and (XHC) vanilla properties;
* SSDT-XOSI: Routing of official _OSI calls in DSDT to XOSI via Clover patch, allowing for OS simulation.

Additionally:

* SSDT-GIGE: Injected Method for original device (GLAN) vanilla properties;
* SSDT-HDEF: Injected Method for device (HDEF) properties and Layout ID;
* SSDT-IGPU: Injected Methods for devices (IGPU) (HDAU) and (IMEI) for compatibility;
* SSDT-SAT0: Injected Method for original device (SAT0) for compatibility;
* SSDT-USB: Injected Methods for original devices (EHC1) and (XHC) vanilla properties;
* SSDT-WIFI: Injected Method for original device (PXSX) compatibility properties.
