/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of /Users/yaoweibing/Desktop/SSDT-FN.aml, Sun Mar 18 14:30:52 2018
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000A4 (164)
 *     Revision         0x02
 *     Checksum         0x84
 *     OEM ID           "hack"
 *     OEM Table ID     "fnkey"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20161210 (538317328)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "fnkey", 0x00000000)
{
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.WEC_, DeviceObj)    // (from opcode)

    Scope (_SB.PCI0.LPCB.WEC)
    {
        Method (_Q0E, 0, NotSerialized)  // _Qxx: EC Query
        {
            Notify (\_SB.PCI0.LPCB.PS2K, 0x0405)
        }

        Method (_Q0F, 0, NotSerialized)  // _Qxx: EC Query
        {
            Notify (\_SB.PCI0.LPCB.PS2K, 0x0406)
        }

        Method (_Q14, 0, NotSerialized)  // _Qxx: EC Query
        {
            Notify (\_SB.PCI0.LPCB.PS2K, 0x042E)
        }

        Method (_Q15, 0, NotSerialized)  // _Qxx: EC Query
        {
            Notify (\_SB.PCI0.LPCB.PS2K, 0x0430)
        }
    }
}

