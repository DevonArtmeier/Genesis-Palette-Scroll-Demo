@echo off
..\bin\asm68k.exe /p /o ae- /o l. core.asm,scrolldemo.gen,,scrolldemo.lst
..\bin\ConvSym.exe scrolldemo.lst scrolldemo.gen -input asm68k_lst -inopt "/localSign=. /localJoin=. /ignoreMacroDefs+ /ignoreMacroExp- /addMacrosAsOpcodes+" -a
..\bin\rompad.exe scrolldemo.gen 255 0
..\bin\fixheadr.exe scrolldemo.gen
pause