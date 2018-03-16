// Overriding _PTS and _WAK

DefinitionBlock("", "SSDT", 2, "hack", "_PTSWAK", 0)
{
    External(ZPTS, MethodObj)
    External(ZWAK, MethodObj)

    External(RMD1._ON, MethodObj)
    External(RMD1._OFF, MethodObj)
    
    External(RMDT.PUSH, MethodObj)    // 1 Arguments (from opcode)
    External(RMDT.P2__, MethodObj)
    
    External(RMCF.DPTS, IntObj)
    External(RMCF.SHUT, IntObj)
    External(RMCF.XPEE, IntObj)
    External(RMCF.SSTF, IntObj)
    External(_SB.PCI0.XHC.PMEE, FieldUnitObj)
    External(_SI._SST, MethodObj)

    // In DSDT, native _PTS and _WAK are renamed ZPTS/ZWAK
    // As a result, calls to these methods land here.
    Method(_PTS, 1, NotSerialized)
    {
        \RMDT.P2("_PTS", Arg0)
        If (LEqual (Arg0, 0x05)) {}
        Else
        {
            If (CondRefOf(\RMCF.DPTS))
            {
            If (\RMCF.DPTS)
                {
                    \RMDT.PUSH ("_PTS RMD1._ON")
                    // enable discrete graphics
                    \RMD1._ON()
                }
            }
            
            // call into original _PTS method
            //ZPTS(Arg0)
        }
    }
    Method(_WAK, 1, Serialized)
    {
        \RMDT.P2("_WAK", Arg0)
        // Take care of bug regarding Arg0 in certain versions of OS X...
        // (starting at 10.8.5, confirmed fixed 10.10.2)
        If (Arg0 < 1 || Arg0 > 5) { Arg0 = 3 }

        // call into original _WAK method
        Local0 = ZWAK(Arg0)

        If (CondRefOf(\RMCF.DPTS))
        {
            If (\RMCF.DPTS)
            {
                // disable discrete graphics
                \RMD1._OFF()
                \RMDT.PUSH ("_WAK RMD1._WAK")
            }
        }

        If (CondRefOf(\RMCF.SSTF))
        {
            If (\RMCF.SSTF)
            {
                // call _SI._SST to indicate system "working"
                // for more info, read ACPI specification
                If (3 == Arg0 && CondRefOf(\_SI._SST)) { \_SI._SST(1) }
            }
        }

        // return value from original _WAK
        Return (Local0)
    }
}
//EOF
