// For disabling the discrete GPU

DefinitionBlock("", "SSDT", 2, "hack", "_DDGPU", 0)
{
    // Note: The _OFF path should be customized to correspond to your native ACPI
    // the two paths provided here should be considered examples only
    // it is best to edit the code such that only the single _OFF path that your ACPI
    // uses is included. 
    External (_SB_.PCI0.RP00.VGA_, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.RP00.VGA_._PS0, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.RP00.VGA_._PS3, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.RP00.VGA_.XDSM, MethodObj)    // 4 Arguments (from opcode)   
    External (RMDT.P2__, MethodObj)    // 2 Arguments (from opcode)
    External (RMDT.PUSH, MethodObj) 
    Device(RMD1)
    {
        Name(_HID, "RMD10000")
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            _OFF ()
            \RMDT.PUSH ("_INI1 _OFF")
        }
 
        Method (_ON, 0, NotSerialized)  // _ON_: Power On
        {
            \_SB_.PCI0.RP00.VGA_._PS0 ()
            \RMDT.PUSH ("_PCI0.RP00.VGA_._PS0 _ON")
        }
 
        Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
        {
            \RMDT.PUSH ("_INI2 _OFF")
            \_SB_.PCI0.RP00.VGA_.XDSM (ToUUID ("a486d8f8-0bda-471b-a72b-6042a6b5bee0"), 0x0100, 0x1A, Buffer (0x04)
                {
                     0x01, 0x00, 0x00, 0x03                         
                })
            \_SB_.PCI0.RP00.VGA_._PS3 ()
        }
    }
}
//EOF
