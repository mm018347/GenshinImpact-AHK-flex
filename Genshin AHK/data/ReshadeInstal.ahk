#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance force
CoordMode, ToolTip, Screen
Menu,Tray, Icon, %A_ScriptDir%\resico.ico
Menu,Tray,NoStandard
Menu,Tray,DeleteAll
Menu,Tray, add, Exitapp, LabelExitApp
Menu,Tray, Default, Exitapp
If !(A_IsAdmin) 	;Если нет админских прав, то запустить с запросом админки
{
Run *RunAs "%A_ScriptFullPath%" /restart
ExitApp
}
IniRead, ONregreadDir, genConfig.ini, Setings, ONregreadDir
IniRead, DirVar228, genConfig.ini, Setings, DirGame

If (ONregreadDir == 1) ; Если в конфиге путь к игре реестр вкл, то:
{
RegRead, DirVarGensh, HKEY_LOCAL_MACHINE, SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Genshin Impact, UninstallString
SplitPath, DirVarGensh,,DirVarGensh
EditDir = %DirVarGensh%
}
Else
{
EditDir = %DirVar228%
}



ToolTip, Отладка: Удаляем файл dxgi.dll.temp, 0, 0
FileDelete, %EditDir%\Genshin Impact Game\dxgi.dll.temp
Loop 30
{
sleep 500
FileCopy, %A_ScriptDir%\reshade\dxgi.dll, %EditDir%\Genshin Impact Game\, 0
ToolTip, Отладка: Перезапись dxgi.dll, 0, 0
}
ToolTip, Отладка: Меняем имя dxgi.dll, 0, 0
FileMove, %EditDir%\Genshin Impact Game\dxgi.dll, %EditDir%\Genshin Impact Game\dxgi.dll.temp, 1
SoundPlay, %A_ScriptDir%\zinecraft_pick_u.wav
sleep 500
ToolTip
LabelExitApp:
ExitApp








*~$End::
Exitapp





