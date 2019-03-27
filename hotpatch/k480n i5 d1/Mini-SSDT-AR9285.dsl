DefinitionBlock("", "SSDT", 2, "HPQOEM", "general", 0x00001000)
{
    Method(_SB.PCI0.RP02.WLAN._DSM, 4, NotSerialized)
    {
        If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
        Return (Package()
        {
            "device-id", Buffer() { 0x30, 0x00, 0x00, 0x00 },
            "name", Buffer() { "pci168c,30" },
            "AAPL,slot-name", Buffer() { "AirPort" },
            "device_type", Buffer() { "AirPort" },
            "model", Buffer() { "Atheros 9280 802.11 b/g/n Wireless Network Adapter" },
            "subsystem-id", Buffer() { 0x8F, 0x00, 0x00, 0x00 },
            "subsystem-vendor-id", Buffer() { 0x6B, 0x10, 0x00, 0x00 },
        })
    }
}
