// For disabling the discrete GPU

DefinitionBlock("", "SSDT", 2, "hack", "_DDGPU", 0)
{
    // Note: The _OFF path should be customized to correspond to your native ACPI
    // the two paths provided here should be considered examples only
    // it is best to edit the code such that only the single _OFF path that your ACPI
    // uses is included.
    External(_SB_.PCI0.RP00.VGA_._PS3, MethodObj)
    External(_SB_.PCI0.RP00.VGA_.P3MO, IntObj)
    External(RMDT.PUSH, MethodObj)
    Device(RMD1)
    {
        Name(_HID, "RMD10000")
        Method(_INI)
        {
            \RMDT.PUSH("Entering _WAK");
            Store (One, \_SB_.PCI0.RP00.VGA_.P3MO)
            // disable discrete graphics (Nvidia/Radeon) if it is present
            \_SB_.PCI0.RP00.VGA_._PS3()        
        }
    }
}
//EOF
