if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"
   sleep 100
   ExitApp
}
#NoTrayIcon

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
setbatchlines,-1
PID := DllCall("GetCurrentProcessId")
Process, Priority, %PID%, High
SetKeyDelay,-1, 8
SetControlDelay, -1
SetMouseDelay, 0
SetWinDelay,-1
#SingleInstance force
DetectHiddenWindows, On
DetectHiddenText, On
#InstallKeybdHook
#InstallMouseHook

IniRead, key_rapidfire, data\genConfig.ini, Binds, key_rapidfire

goloop:
while GetKeyState("RButton", "P")
{
sleep 1
IfWinActive, ahk_exe GenshinImpact.exe
{
sleep 120
RegRead, KeyCheck1337, HKEY_LOCAL_MACHINE, SOFTWARE\AHKflexGenshi, GUID
sleep %KeyCheck1337%
GetKeyState, RButtonVar4, RButton, P
if RButtonVar4 = U
Goto goloop
Sendplay, {Blind}{LButton}
}
}
sleep 50
Goto goloop

*~$Home::
Reload
*~$End::
Exitapp



