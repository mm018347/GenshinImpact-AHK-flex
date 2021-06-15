 ;F1	+ Три карты
 ;F		+-Фаст лут
 ;Z		. Скип диалогов
 ;F3	. Автоходьба
 ;Space	+ Банихоп для станов
 ;F2	+-Оверлей с подсказками управления
 ;		. Отключить С'ЖАй кастсцены, если есть ветка в реестре
 ;		. Ведьмачье чутье
;===============================дерективы
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
setbatchlines,-1
Process, Priority,, High
SetKeyDelay,-1, -1
SetControlDelay, -1
SetMouseDelay, -1
SetWinDelay,-1
#SingleInstance force
DetectHiddenWindows, On
DetectHiddenText, On

Global metodVvoda 	;зарегать глобальную переменную для режимов ввода: 1 input, 2 play, 3 winapi


AntiVACHashChanger:="fghfh3534gjfj6867jhmbdsq4123asdaszxxcasdf423dfght7657ghnbnghrtwer32esdfgr654756867ghjkhji7456wsdfsf34sdfsdf324sdfsf"


;======================макросы на героев
jopa1:=false
jopa2:=false
jopa3:=false
jopa4:=false
jopa5:=false
jopa6:=false
jopa7:=false
jopa8:=false
jopa9:=false
jopa10:=false

;====================Подгрузка конфига: бинды
IniRead, key_animcancel, data\genConfig.ini, Binds, key_animcancel
IniRead, key_map, data\genConfig.ini, Binds, key_map
IniRead, key_autowalk, data\genConfig.ini, Binds, key_autowalk
IniRead, key_overlay, data\genConfig.ini, Binds, key_overlay
IniRead, key_fastlyt, data\genConfig.ini, Binds, key_fastlyt
IniRead, key_skipNPS, data\genConfig.ini, Binds, key_skipNPS
IniRead, key_bhop, data\genConfig.ini, Binds, key_bhop
IniRead, key_autoswim, data\genConfig.ini, Binds, key_autoswim
IniRead, key_vi4er_sens, data\genConfig.ini, Binds, key_vi4er_sens


;====================Подгрузка конфига: основные
IniRead, BrauzerCheck, data\genConfig.ini, Setings, BrauzerCheck ; проверка браузера
IniRead, BrauzerPick, data\genConfig.ini, Setings, BrauzerPick ; выбор браузера
IniRead, Map2toggle, data\genConfig.ini, Setings, map
IniRead, gameexe1337, data\genConfig.ini, Setings, GameExe	; исполняемый файл игры
IniRead, ONregreadDir, data\genConfig.ini, Setings, ONregreadDir ; поиск папки в реестре для откл кастсцен
IniRead, CheckboxRegDir, data\genConfig.ini, Setings, ONregreadDir
IniRead, DirGame, data\genConfig.ini, Setings, DirGame
IniRead, metodVvoda, data\genConfig.ini, Setings, metodVvoda
IniRead, showtooltipVvoba, data\genConfig.ini, Setings, showtooltipVvoba

IniRead, Checkbox1map, data\genConfig.ini, Setings, Checkbox1map
IniRead, Checkbox1overlay, data\genConfig.ini, Setings, Checkbox1overlay
IniRead, Checkbox1autowalk, data\genConfig.ini, Setings, Checkbox1autowalk
IniRead, Checkbox1fastlyt, data\genConfig.ini, Setings, Checkbox1fastlyt
IniRead, Checkbox1skipNPS, data\genConfig.ini, Setings, Checkbox1skipNPS
IniRead, Checkbox1autoswim, data\genConfig.ini, Setings, Checkbox1autoswim
IniRead, Checkbox1vi4ersens, data\genConfig.ini, Setings, Checkbox1vi4ersens
IniRead, Checkbox1animcancel, data\genConfig.ini, Setings, Checkbox1animcancel

IniRead, Checkbox1bhop, data\genConfig.ini, Setings, Checkbox1bhop

If metodVvoda = 3
{
hModule:=DllCall("LoadLibraryW", "Str", "User32.dll", "Ptr") ;подгружаем библиотеку хз зачем ( ͡° ͜ʖ ͡°)﻿
}




If (ONregreadDir == 1) ; Если в конфиге путь к игре реестр вкл, то:
{
;=====================Реестр расположение папки с игрой
RegRead, DirVarGensh, HKEY_LOCAL_MACHINE, SOFTWARE\launcher, InstPath
}
If (ONregreadDir == 0)
{
DirVarGensh = %DirGame%
}
;====================Положить хоткей в конфиг и проверить включен в чекбоксе в гуи или нет
if Checkbox1map = 1
Hotkey, %key_map%, Metkakey_map, on
if Checkbox1overlay = 1
Hotkey, %key_overlay%, Metkakey_overlay, on
if Checkbox1autowalk = 1
Hotkey, %key_autowalk%, Metkakey_autowalk, on
if Checkbox1fastlyt = 1
Hotkey, ~%key_fastlyt%, Metkakey_fastlyt, on
if Checkbox1skipNPS = 1
Hotkey, ~%key_skipNPS%, Metkakey_skipNPS, on
if Checkbox1autoswim = 1
Hotkey, ~%key_autoswim%, Metkakey_autoswim, on
if Checkbox1vi4ersens = 1
Hotkey, ~%key_vi4er_sens%, Metkakey_key_vi4er_sens, on
if Checkbox1animcancel = 1
Hotkey, ~%key_animcancel%, Metkakey_animcancel, on		;исправить
if Checkbox1bhop = 1
Hotkey, ~%key_bhop%, Metkakey_bhop, on

;====================Настройки трея
Menu,Tray,NoStandard
Menu,Tray,DeleteAll
Menu,Tray, add, Setings, MetkaMenu1
Menu,Tray, Default , Setings
Menu,Tray, add
Menu,Tray, add, Reload, MetkaMenu3
Menu,Tray, add, Info, MetkaMenu2
Menu,Tray, add, Exit, MetkaMenu0
Menu Tray, Icon, data\genicon.ico
;====================Gui настройки
Random, RandomVarPNG, 1, 2
if (RandomVarPNG == 1)
	RandomVarPNGnext=data\1.png
if (RandomVarPNG == 2)
	RandomVarPNGnext=data\2.png
Gui, 1: Add, Picture, x0 y0 w710 h330, %RandomVarPNGnext%
Gui, 1: Add, GroupBox, x8 y8 w200 h80, Карта
Gui, 1: Add, ListBox, x16 y24 w124 h56 vList1488 AltSubmit, 1 - Mihoyo|2 - Genshin-impact-map|3 - Mapgenie.io|4 - Yuanshen.site
Gui, 1: Add, Button, gpickmap x144 y40 w61 h23, Pick
Gui, 1: Add, GroupBox, x8 y88 w200 h211, Бинды
Gui, 1: Add, GroupBox, x560 y8 w139 h143, Доп. фишки
Gui, 1: Add, Text, x568 y32 w114 h23, Путь к папке с игрой
Gui, 1: Add, Edit, x40 y104 w61 h21 vkey_map, %key_map%
Gui, 1: Add, Button, gcancelexit x640 y288 w43 h23, Cancel
Gui, 1: Add, Button, gsavegui x568 y288 w43 h23, Save
Gui, 1: Add, Text, x104 y104 w78 h23 +0x200 vText2, *Карта
Gui, 1: Add, Edit, x40 y128 w61 h21 vkey_overlay, %key_overlay%
Gui, 1: Add, Text, x104 y128 w80 h23 +0x200 vText3, *Оверлей
Gui, 1: Add, Edit, x40 y152 w61 h21 vkey_autowalk, %key_autowalk%
Gui, 1: Add, Text, x104 y152 w80 h23 +0x200 vText4, *Автоходьба
Gui, 1: Add, Edit, x40 y200 w61 h21 vkey_skipNPS, %key_skipNPS%
Gui, 1: Add, Text, x104 y200 w80 h23 +0x200 vText5, Скип диалогов
Gui, 1: Add, Edit, x40 y176 w61 h21 vkey_fastlyt, %key_fastlyt%
Gui, 1: Add, Text, x104 y176 w80 h23 +0x200 vText6, Фастлут
Gui, 1: Add, Edit, x40 y224 w61 h21 vkey_autoswim, %key_autoswim%
Gui, 1: Add, Text, x104 y224 w66 h23 +0x200 vText7, Плавание
Gui, 1: Add, Edit, x40 y248 w61 h21 vkey_vi4er_sens, %key_vi4er_sens%
Gui, 1: Add, Text, x104 y248 w90 h23 +0x200 vText8, Ведьмачье чутье
Gui, 1: Add, CheckBox, vCheckboxRegDir gCheckboxRegDirG x568 y48 w121 h23 Checked%ONregreadDir%, Автопуть с реестра
Gui, 1: Add, Edit, x568 y72 w92 h21 vEditDir +Disabled, %DirVarGensh%
Gui, 1: Add, Button, ggameway x664 y72 w23 h21, ...
Gui, 1: Add, Text, x568 y96 w120 h23 +0x200 vText9, Кастсцены CGI
Gui, 1: Add, Button, gOnCGI x568 y120 w43 h23, ON
Gui, 1: Add, Button, gOffCGI x640 y120 w43 h23, OFF
Gui, 1: Add, GroupBox, x560 y152 w139 h69, Режим эмитации ввода
Gui, 1: Add, ListBox, x568 y168 w68 h43 vListKeyDif AltSubmit, SendInput|SendPlay|WinApi
Gui, 1: Add, CheckBox, vCheckboxtooltipVvoba x104 y304 w90 h16 Checked%showtooltipVvoba%, Tooltips вверху

Gui, 1: Add, Edit, x40 y272 w61 h21 vkey_animcancel, %key_animcancel%
Gui, 1: Add, Text, x104 y272 w56 h23 +0x200, MacroKey
Gui, 1: Add, Button, gpickinput x640 y176 w54 h23, Pick

Gui, 1: Add, CheckBox, vCheckbox0map x16 y104 w13 h18 Checked%Checkbox1map%
Gui, 1: Add, CheckBox, vCheckbox0overlay x16 y128 w13 h18 Checked%Checkbox1overlay%
Gui, 1: Add, CheckBox, vCheckbox0autowalk x16 y152 w13 h18 Checked%Checkbox1autowalk%
Gui, 1: Add, CheckBox, vCheckbox0fastlyt x16 y176 w13 h18 Checked%Checkbox1fastlyt%
Gui, 1: Add, CheckBox, vCheckbox0skipNPS x16 y200 w13 h18 Checked%Checkbox1skipNPS%
Gui, 1: Add, CheckBox, vCheckbox0autoswim x16 y224 w13 h18 Checked%Checkbox1autoswim%
Gui, 1: Add, CheckBox, vCheckbox0vi4ersens x16 y248 w13 h18 Checked%Checkbox1vi4ersens%
Gui, 1: Add, CheckBox, vCheckbox0animcancel x16 y272 w13 h18 Checked%Checkbox1animcancel%
Gui, 1: Add, CheckBox, vCheckbox0bhop x16 y304 w83 h16 Checked%Checkbox1bhop%, Бхоп
;лира пошла
Gui, 1: Add, GroupBox, x560 y224 w139 h56, Windsong Lyre
Gui, 1: Add, Button, gParsButton x568 y248 w31 h21, Pars
Gui, 1: Add, Button, gClearButton x616 y248 w31 h21, Clear
Gui, 1: Add, Button, gRunButton x664 y248 w31 h21, Run


SendMessage, 0x50,, 0x4090409,, A
if metodVvoda = 1
{
winsayvar:= "SendInput mode"
}
if metodVvoda = 2
{
winsayvar:= "SendPlay mode"
}
if metodVvoda = 3
{
winsayvar:= "WinApi mode"
}
Gui, 1: Show, w710 h329, Genshi AHK Flex v3 by Kramar1337 (%winsayvar%)
; MsgBox Отладка ;=====================================================================выключить отладку
Gui, 1: hide


;===============================Переменные
;windowcemucik1:="ahk_exe GenshinImpact.exe" ;окно игры
xSkip:=A_ScreenWidth*.7328
ySkip:=A_ScreenHeight*.7465
var0ov:=1 ;оверлей обозначить переменную
;===============================Выбор карты
if (Map2toggle == 1)
{
GroupAdd, GroupNameMap1337, Teyvat Interactive Map
GroupAdd, GroupNameMap1337, Интерактивная карта Тейвата
GroupAdd, GroupNameMap1337, Teyvat Interactive Map
GroupAdd, GroupNameMap1337, Interaktive Karte von Teyvat
GroupAdd, GroupNameMap1337, 提瓦特互动地图
GroupAdd, GroupNameMap1337, 提瓦特互動地圖
GroupAdd, GroupNameMap1337, Carte interactive de Teyvat

GroupAdd, GroupNameMap1337, Архипелаг Золотого яблока
GroupAdd, GroupNameMap1337, Golden Apple Archipelago
GroupAdd, GroupNameMap1337, Goldapfelarchipel
GroupAdd, GroupNameMap1337, 金苹果群岛
GroupAdd, GroupNameMap1337, 金蘋果群島
GroupAdd, GroupNameMap1337, Archipel de la pomme dorée
run_param:="https://webstatic-sea.mihoyo.com/app/ys-map-sea/"
}
if (Map2toggle == 2)
{
GroupAdd, GroupNameMap1337, Genshin Impact Interactive World Map
GroupAdd, GroupNameMap1337, Интерактивная карта мира Genshin Impact
run_param:="https://genshin-impact-map.appsample.com/"
}
if (Map2toggle == 3)
{
GroupAdd, GroupNameMap1337, Genshin Impact Interactive Map | Map Genie
GroupAdd, GroupNameMap1337, Интерактивная карта воздействия Геншина | Карта Genie
run_param:="https://mapgenie.io/genshin-impact/maps/teyvat"
}
if (Map2toggle == 4)
{
GroupAdd, GroupNameMap1337, Original God Map
GroupAdd, GroupNameMap1337, Оригинальная карта бога
GroupAdd, GroupNameMap1337, 原神地图
run_param:="https://yuanshen.site/"
}

;===============================Оверлей создание
HpBarW:=A_ScreenWidth
HpBarH:=A_ScreenHeight
HpBarX:=0
HpBarY:=0
Gui, 99: +AlwaysOnTop +ToolWindow -Caption +LastFound
WinSet, TransColor, 12345
Gui, 99: Color, 12345


Path = "%A_ScriptDir%\data\paimon.gif"
;width := 184, height := 281
width := Round(A_ScreenWidth *.07187)
height := Round(A_ScreenHeight *.19513)
;MsgBox %width% %height% 

width2 := Round(A_ScreenWidth *.78125)
height2 := Round(A_ScreenHeight *.74305)
Gui, 99: Add, ActiveX, x%width2% y%height2% w%width% h%height% Disabled voIE, Shell.Explorer
oIE.Navigate("about:blank")
oIE.Document.Write("<body style=""overflow: hidden; margin: 0px""><img src=" Path " width=" width "px; height=" height "></body>" ) 
oIE.Document.close
GuiControl, 99: hide, oIE


Gui, 99: Add, Picture, w%HpBarW% h%HpBarH% x0 y0 vMyPictureVar1, data\genOverlay1.png
Gui, 99: Show, w%HpBarW% h%HpBarH% x%HpBarX% y%HpBarY%,
Gui, 99: Cancel

return

;===============================Банихоп
Metkakey_bhop:
IfWinActive, %gameexe1337%		;ahk_exe GenshinImpact.exe
{
Sleep 210
Loop
{
    GetKeyState, SpaceVar1, Space, P
    If SpaceVar1 = U
        break 
    
	multisendinput("Space", "", "Space", "", "0x20", "0", "", "")
	Sleep 1
    ; Sendplay, {Blind}{Space}
}
}
return


;===============================Карта
Metkakey_map:
sleep 50
toggle1 := !toggle1
if (toggle1)
{
WinMinimize %gameexe1337% ;свернуть
sleep 1
IfWinExist, ahk_group GroupNameMap1337 ;если найдено окно с катрой то..
	{
WinMaximize ahk_group GroupNameMap1337 ;развернуть окно карты
sleep 100
WinActivate ahk_group GroupNameMap1337 ;сделать окно карты активным
	}
IfWinNotExist, ahk_group GroupNameMap1337 ;если окно карты не найдено то..
	{
	if BrauzerCheck = 0
		{
		Run,%run_param% ;подрубить дефолтный браузер и завести карту
		}
	if BrauzerCheck = 1
		{
		run_path	= %BrauzerPick% -maximized
		Run,%run_path%  %run_param% ;подрубить выбраный браузер и завести карту
		}
loop 7
{
IfWinExist, ahk_group GroupNameMap1337 ;ожидание окна карты
{
sleep 1
WinMaximize ahk_group GroupNameMap1337 ;максимизировать окно
sleep 1
WinActivate ahk_group GroupNameMap1337 ;сделать активным
break
}
sleep 900
}
	}
}
else
{
WinMinimize ahk_group GroupNameMap1337
sleep 1
WinMaximize %gameexe1337%
sleep 1
WinActivate %gameexe1337%
}
return
;===============================Оверлей с подсказками
Metkakey_overlay:
sleep 50
overlay1toggle := !overlay1toggle
if (overlay1toggle)
{
WinMinimize %gameexe1337%
Gui, 99: Show, NoActivate
}
else
{
Gui, 99: Cancel
WinMaximize %gameexe1337%
}
return
;===============================Фастлут
Metkakey_fastlyt:
IfWinActive, %gameexe1337%
{
Sleep 100
Loop
{
    GetKeyState, SpaceVar2, %key_fastlyt%, P
    If SpaceVar2 = U
        break 
    Sleep 1
	multisendinput("F", "", "F", "", "0x46", "0", "", "")
	SendInput, {Blind}{WheelDown}
}
}
return
;===============================Автоходьба
Metkakey_autowalk:
sleep 50
SendInput {W down}
return
;===============================Скип диалогов
Metkakey_skipNPS:
IfWinActive, %gameexe1337%
{
Sleep 130
Loop
{
    GetKeyState, SpaceVar2, %key_skipNPS%, P
    If SpaceVar2 = U
        break 
    Sleep 15
Click %xSkip% %ySkip%
}
}
return

;===============================Плавание
Metkakey_autoswim:
IfWinActive, %gameexe1337%		;ahk_exe GenshinImpact.exe
{
sleep 15
Send {LShift down}
Loop
{
    GetKeyState, 2SpaceVar2, %key_autoswim%, P
    If 2SpaceVar2 = U
        break
multisendinput("W", "", "W", "", "0x57", "0", "", "")
; Sendplay, {Blind}{W}
Random, RandomVarSw, 500, 520
sleep %RandomVarSw%
}
Send {LShift Up}
}
return


;===============================Откл макро
Numpad0::
jopa1:=false
jopa2:=false
jopa3:=false
jopa4:=false
jopa5:=false
jopa6:=false
jopa7:=false
jopa8:=false
jopa9:=false
jopa10:=false
ToolTip
Return
;===============================эмбер
Numpad1::
jopa1:=true
jopa2:=false
jopa3:=false
jopa4:=false
jopa5:=false
jopa6:=false
jopa7:=false
jopa8:=false
jopa9:=false
jopa10:=false
if showtooltipVvoba
ToolTip, Amber, 0, 0
Return
;===============================фишль
Numpad2::
jopa1:=false
jopa2:=true
jopa3:=false
jopa4:=false
jopa5:=false
jopa6:=false
jopa7:=false
jopa8:=false
jopa9:=false
jopa10:=false
if showtooltipVvoba
ToolTip, Fish, 0, 0
Return
;===============================кли Charge Attack
Numpad3::
jopa1:=false
jopa2:=false
jopa3:=true
jopa4:=false
jopa5:=false
jopa6:=false
jopa7:=false
jopa8:=false
jopa9:=false
jopa10:=false
if showtooltipVvoba
ToolTip, Klee Charge Attack, 0, 0
Return
;===============================кли 2 Сombo
Numpad6::
jopa1:=false
jopa2:=false
jopa3:=false
jopa4:=false
jopa5:=false
jopa6:=true
jopa7:=false
jopa8:=false
jopa9:=false
jopa10:=false
if showtooltipVvoba
ToolTip, Klee Сombo, 0, 0
Return
;===============================венти MachineGun
Numpad5::
jopa1:=false
jopa2:=false
jopa3:=false
jopa4:=false
jopa5:=true
jopa6:=false
jopa7:=false
jopa8:=false
jopa9:=false
jopa10:=false
if showtooltipVvoba
ToolTip, Venti MachineGun, 0, 0
Return
;===============================фишль и эмбер
Numpad4::
jopa1:=false
jopa2:=false
jopa3:=false
jopa4:=true
jopa5:=false
jopa6:=false
jopa7:=false
jopa8:=false
jopa9:=false
jopa10:=false
if showtooltipVvoba
ToolTip, Amber+Fish MachineGun, 0, 0
Return




;=================================================отмена анимаций на героев
Metkakey_animcancel:
if jopa1 							;ембер
{
IfWinActive, %gameexe1337%
{
sleep 1
Loop
{
    GetKeyState, 2SpaceVar2, %key_animcancel%, P
    If 2SpaceVar2 = U
        break

multisendinput("LButton", "", "LButton", "", "", "", "0x0002", "0x0004")
; Sendplay, {Blind}{LButton}
sleep 310
multisendinput("LButton", "", "LButton", "", "", "", "0x0002", "0x0004")
; Sendplay, {Blind}{LButton}
sleep 510
multisendinput("LButton", "", "LButton", "", "", "", "0x0002", "0x0004")
; Sendplay, {Blind}{LButton}
sleep 410
multisendinput("R", "", "R", "", "0x52", "0", "", "")
; Sendplay, {Blind}{R}
sleep 50
multisendinput("R", "", "R", "", "0x52", "0", "", "")
; Sendplay, {Blind}{R}
sleep 170
}
}
}
if jopa2 							;фишль
{
IfWinActive, %gameexe1337%
{
sleep 1
Loop
{
    GetKeyState, 2SpaceVar2, %key_animcancel%, P
    If 2SpaceVar2 = U
        break
multisendinput("LButton", "", "LButton", "", "", "", "0x0002", "0x0004")
; Sendplay, {Blind}{LButton}
Random, RandomVarFish, 320, 321
sleep %RandomVarFish%
multisendinput("LButton", "", "LButton", "", "", "", "0x0002", "0x0004")
; Sendplay, {Blind}{LButton}
Random, RandomVarFish, 310, 311
sleep %RandomVarFish%
multisendinput("LButton", "", "LButton", "", "", "", "0x0002", "0x0004")
; Sendplay, {Blind}{LButton}
    GetKeyState, 2SpaceVar2, %key_animcancel%, P
    If 2SpaceVar2 = U
        break
Random, RandomVarFish, 415, 416
sleep %RandomVarFish%
multisendinput("R", "", "R", "", "0x52", "0", "", "")
; Sendplay, {Blind}{R}
Random, RandomVarFish, 50, 51
sleep %RandomVarFish%
multisendinput("R", "", "R", "", "0x52", "0", "", "")
; Sendplay, {Blind}{R}
Random, RandomVarFish, 170, 171
sleep %RandomVarFish%
}
}
}

if jopa6 							;кли комбо
{
IfWinActive, %gameexe1337%
{
Ivar:=0
sleep 1
Loop
{
    GetKeyState, 2SpaceVar2, %key_animcancel%, P
    If 2SpaceVar2 = U
        break
multisendinput2("LButton", "", "LButton", "", "", "", "0x0002", "0x0004")
; SendInput, {Blind}{LButton}
sleep 415
multisendinput2("LButton", "", "LButton", "", "", "", "0x0002", "0x0004")
; SendInput, {Blind}{LButton}
sleep 1
multisendinput2("Space", "", "Space", "", "0x20", "0", "", "")
; SendInput, {Blind}{Space}
sleep 520
    GetKeyState, 2SpaceVar2, %key_animcancel%, P
    If 2SpaceVar2 = U
        break
multisendinput2("LButton", "", "LButton", "", "", "", "0x0002", "0x0004")
; SendInput, {Blind}{LButton}
sleep 55
if Ivar = 6
{
multisendinput2("vk45", "", "vk45", "", "0x45", "0", "", "")
; SendInput, {Blind}{vk45}
sleep 225
Ivar:=0
}
Else
{
multisendinput2("LButton", " Down", "LButton", " Down", "", "", "0x0002", "")
; SendInput, {Blind}{LButton Down}
sleep 210
multisendinput2("LButton", " Up", "LButton", " Up", "", "", "0x0002", "0x0004")
; SendInput, {Blind}{LButton Up}
}
sleep 600
    GetKeyState, 2SpaceVar2, %key_animcancel%, P
    If 2SpaceVar2 = U
        break
multisendinput2("Space", "", "Space", "", "0x20", "0", "", "")
; SendInput, {Blind}{Space}
sleep 510
Ivar++
; tooltip %Ivar%
}
}
}

if jopa3 							;кли Charge Attack
{
IfWinActive, %gameexe1337%
{
sleep 1
Loop
{
    GetKeyState, 2SpaceVar2, %key_animcancel%, P
    If 2SpaceVar2 = U
        break
multisendinput("LButton", " Down", "LButton", " Down", "", "", "0x0002", "")
; Sendplay, {Blind}{LButton Down}
sleep 210
multisendinput("LButton", " Up", "LButton", " Up", "", "", "0x0002", "0x0004")
; Sendplay, {Blind}{LButton Up}
sleep 500
}
}
}

if jopa5 							;идеальный вентиль
{
IfWinActive, %gameexe1337%
{
sleep 1
if metodVvoda = 1 
{
sleep 1
Loop
{
    GetKeyState, 2SpaceVar2, %key_animcancel%, P 	;проверить состояние клавиши
    If 2SpaceVar2 = U
        break
	; DllCall("mouse_event", uint, 1, int, 50, int, 0, uint, 0, int, 0)
	Send {R down}
	Sleep 20
	Send {R up}
	Sleep 35
	
		Click down
		Sleep 1
		Click up
	
	Send {R down}
	Sleep 20
	Send {R up}
	Sleep 35
}
}
if metodVvoda = 3
{
sleep 1
Loop
{
	GetKeyState, 2SpaceVar2, %key_animcancel%, P 	;идеальный вентиль 3
    If 2SpaceVar2 = U
        break
		
		DllCall("keybd_event", int, 0x52, int, 0xA0, int, 0, int, 0)
		sleep 20
		DllCall("keybd_event", int, 0x52, int, 0xA0, int, 2, int, 0)
		sleep 35

	
		Click down
		Sleep 1
		Click up
	
		DllCall("keybd_event", int, 0x52, int, 0xA0, int, 0, int, 0)
		sleep 20
		DllCall("keybd_event", int, 0x52, int, 0xA0, int, 2, int, 0)
		sleep 35
}
}

if metodVvoda = 2
{
sleep 1
Loop
{
	GetKeyState, 2SpaceVar2, %key_animcancel%, P 	;идеальный вентиль 2
    If 2SpaceVar2 = U
		break
multisendinput("R", "", "R", "", "0x52", "0", "", "")
	Sleep 37 	;Sleep 70
	Click
	Sleep 1 	;Sleep 1
multisendinput("R", "", "R", "", "0x52", "0", "", "")
	Sleep 37 	;Sleep 50
}
}

}
}

if jopa4 							;идеальный фишль и эмбер
{
IfWinActive, %gameexe1337%
{
sleep 1
if metodVvoda = 2
{
sleep 1
Loop
{
	if !GetKeyState("C", "P")
	break

		Send {R down}
		sleep 1
		Send {R up}
		sleep 1
		
		Sleep 38 	;Sleep 70
		Click down
		Sleep 1 	;Sleep 1
		Click up
		
		Send {R down}
		sleep 1
		Send {R up}
		sleep 23 	;Sleep 23
}
}
if metodVvoda = 3
{
Loop
{
	if !GetKeyState(key_animcancel, "P") 	;идеальный фишль+эмбер
	break

		DllCall("keybd_event", int, 0x52, int, 0xA0, int, 0, int, 0)
		sleep 1
		DllCall("keybd_event", int, 0x52, int, 0xA0, int, 2, int, 0)
		sleep 1
		
		Sleep 38 	;Sleep 70
		Click down
		Sleep 1 	;Sleep 1
		Click up
		
		DllCall("keybd_event", int, 0x52, int, 0xA0, int, 0, int, 0)
		sleep 1
		DllCall("keybd_event", int, 0x52, int, 0xA0, int, 2, int, 0)
		sleep 23 	;Sleep 23
}
}

if metodVvoda = 2
{
Loop
{
	GetKeyState, 2SpaceVar2, %key_animcancel%, P 	;идеальный фишль+эмбер
    If 2SpaceVar2 = U
		break
multisendinput("R", "", "R", "", "0x52", "0", "", "")
	Sleep 60 	;Sleep 70
	Click
	Sleep 1 	;Sleep 1
multisendinput("R", "", "R", "", "0x52", "0", "", "")
	Sleep 70 	;Sleep 50
}
}

}
}
return



;==================================================Работа с Gui метками
MetkaMenu1:
Gui, 1: Show
Return

;==================================================Открыть гитхаб
PicGithub:
MsgBox Заглушка Открыть гитхаб
Return

;=================================================Отключить кастсцены
OnCGI:
Gui, 1: Submit, NoHide
FileMoveDir, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAssets, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAssets, 1
FileMoveDir, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAuthentication, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAuthentication, 1
if (ErrorLevel == 1)
msgbox ,,, ErrorLevel - %ErrorLevel%,1
if (ErrorLevel == 0)
msgbox ,,, OK,1
Return

OffCGI:
Gui, 1: Submit, NoHide
FileMoveDir, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAssets, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAssets, 1
FileMoveDir, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAuthentication, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAuthentication, 1
if (ErrorLevel == 1)
msgbox ,,, ErrorLevel - %ErrorLevel%,1
if (ErrorLevel == 0)
msgbox ,,, OK,1
Return

;==================================================Сохраниться
savegui:
Gui, 1: Submit
SendMessage, 0x50,, 0x4090409,, A
sleep 1
IniWrite, %key_map%, data\genConfig.ini, Binds, key_map
IniWrite, %key_autowalk%, data\genConfig.ini, Binds, key_autowalk
IniWrite, %key_overlay%, data\genConfig.ini, Binds, key_overlay
IniWrite, %key_fastlyt%, data\genConfig.ini, Binds, key_fastlyt
IniWrite, %key_autoswim%, data\genConfig.ini, Binds, key_autoswim
IniWrite, %key_skipNPS%, data\genConfig.ini, Binds, key_skipNPS
IniWrite, %key_vi4er_sens%, data\genConfig.ini, Binds, key_vi4er_sens
IniWrite, %key_animcancel%, data\genConfig.ini, Binds, key_animcancel
IniWrite, %CheckboxRegDir%, data\genConfig.ini, Setings, ONregreadDir
IniWrite, %CheckboxtooltipVvoba%, data\genConfig.ini, Setings, showtooltipVvoba

IniWrite, %Checkbox0map%, data\genConfig.ini, Setings, Checkbox1map
IniWrite, %Checkbox0overlay%, data\genConfig.ini, Setings, Checkbox1overlay
IniWrite, %Checkbox0autowalk%, data\genConfig.ini, Setings, Checkbox1autowalk
IniWrite, %Checkbox0fastlyt%, data\genConfig.ini, Setings, Checkbox1fastlyt
IniWrite, %Checkbox0skipNPS%, data\genConfig.ini, Setings, Checkbox1skipNPS
IniWrite, %Checkbox0autoswim%, data\genConfig.ini, Setings, Checkbox1autoswim
IniWrite, %Checkbox0vi4ersens%, data\genConfig.ini, Setings, Checkbox1vi4ersens
IniWrite, %Checkbox0animcancel%, data\genConfig.ini, Setings, Checkbox1animcancel
IniWrite, %Checkbox0bhop%, data\genConfig.ini, Setings, Checkbox1bhop


Reload
Return

cancelexit:
Gui, 1: Cancel
Return


;============================================Указать путь к игре
gameway:
if (CheckboxRegDir == 0)
{
FileSelectFolder, DirVar228, ,3,Путь к папке с игрой `nПример "F:\Program Files\Genshin Impact"
if DirVar228 !=
{
GuiControl,1:, EditDir, %DirVar228%
Gui, 1: Submit, NoHide
IniWrite, %DirVar228%, data\genConfig.ini, Setings, DirGame
}
}
Return



;==================================================Выбор карты
pickmap:
Gui, 1: Submit, nohide
if list1488 = 1
IniWrite, 1, data\genConfig.ini, Setings, map
if list1488 = 2
IniWrite, 2, data\genConfig.ini, Setings, map
if list1488 = 3
IniWrite, 3, data\genConfig.ini, Setings, map
if list1488 = 4
IniWrite, 4, data\genConfig.ini, Setings, map
Return

;==================================================Выбор метода ввода
pickinput:
Gui, 1: Submit, nohide
if ListKeyDif = 1
IniWrite, 1, data\genConfig.ini, Setings, metodVvoda
if ListKeyDif = 2
IniWrite, 2, data\genConfig.ini, Setings, metodVvoda
if ListKeyDif = 3
IniWrite, 3, data\genConfig.ini, Setings, metodVvoda
Return



CheckboxRegDirG:
Gui, 1: Submit, nohide
If (CheckboxRegDir == 1) ; Если в конфиге путь к игре реестр вкл, то:
{
;=====================Реестр расположение папки с игрой
RegRead, DirVarGensh, HKEY_LOCAL_MACHINE, SOFTWARE\launcher, InstPath
GuiControl,1:, EditDir, %DirVarGensh%
IniWrite, 1, data\genConfig.ini, Setings, ONregreadDir
}
If (CheckboxRegDir == 0) ; Если в конфиге путь к игре реестр вкл, то:
{
IniRead, DirGame, data\genConfig.ini, Setings, DirGame
GuiControl,1:, EditDir, %DirGame%
}
IniWrite, 0, data\genConfig.ini, Setings, ONregreadDir
Return


;==================================================Переключить оверлей
~Left::
var0ov -= 1
if (var0ov > 6)
var0ov -= 1
if (var0ov < 1)
var0ov += 1
if (var0ov == 1)
{
if (zaglushka == 0)
{
GuiControl, 99: -Redraw, MyPictureVar1
GuiControl, 99: -Redraw, oIE
GuiControl, 99: hide, oIE
GuiControl, 99: ,MyPictureVar1, data\genOverlay1.png
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=1
}
}
if (var0ov == 2)
{
GuiControl, 99: -Redraw, MyPictureVar1
GuiControl, 99: ,MyPictureVar1, data\genOverlay2.png
GuiControl, 99: show, oIE
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}
if (var0ov == 3)
{
GuiControl, 99: -Redraw, MyPictureVar1

GuiControl, 99: ,MyPictureVar1, data\genOverlay3.png
GuiControl, 99: show, oIE
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}
if (var0ov == 4)
{
GuiControl, 99: -Redraw, MyPictureVar1

GuiControl, 99: ,MyPictureVar1, data\genOverlay4.png
GuiControl, 99: show, oIE
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}
if (var0ov == 5)
{
GuiControl, 99: -Redraw, MyPictureVar1

GuiControl, 99: ,MyPictureVar1, data\genOverlay5.png
GuiControl, 99: -Redraw, oIE
GuiControl, 99: hide, oIE
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}
if (var0ov == 6)
{
GuiControl, 99: -Redraw, MyPictureVar1

GuiControl, 99: ,MyPictureVar1, data\genOverlay6.png
GuiControl, 99: show, oIE
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}
Return



;=====================================переключение оверлея Right
~Right::
var0ov += 1
if (var0ov > 6)
var0ov -= 1
if (var0ov < 1)
var0ov += 1
if (var0ov == 1)
{
GuiControl, 99: -Redraw, MyPictureVar1
GuiControl, 99: -Redraw, oIE
GuiControl, 99: hide, oIE
GuiControl, 99: ,MyPictureVar1, data\genOverlay1.png
GuiControl, 99: +Redraw, MyPictureVar1
}
if (var0ov == 2)
{
GuiControl, 99: -Redraw, MyPictureVar1

GuiControl, 99: ,MyPictureVar1, data\genOverlay2.png
GuiControl, 99: show, oIE
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}
if (var0ov == 3)
{
GuiControl, 99: -Redraw, MyPictureVar1

GuiControl, 99: ,MyPictureVar1, data\genOverlay3.png
GuiControl, 99: show, oIE
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}
if (var0ov == 4)
{
GuiControl, 99: -Redraw, MyPictureVar1

GuiControl, 99: ,MyPictureVar1, data\genOverlay4.png
GuiControl, 99: show, oIE
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}
if (var0ov == 5)
{
GuiControl, 99: -Redraw, MyPictureVar1

GuiControl, 99: ,MyPictureVar1, data\genOverlay5.png
GuiControl, 99: -Redraw, oIE
GuiControl, 99: hide, oIE
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}
if (var0ov == 6)
{
if (zaglushka == 0)
{
GuiControl, 99: -Redraw, MyPictureVar1

GuiControl, 99: ,MyPictureVar1, data\genOverlay6.png
GuiControl, 99: show, oIE
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=1
}
}
Return





#UseHook, On
metka-2-kli1:
  SetTimer, metka-2-kli2-start, off
Return
metka-2-kli2:
  SetTimer, metka-2-kli2-start, on
Return
#UseHook, Off
Metkakey_key_vi4er_sens:
IfWinActive, %gameexe1337%
{
  Pause_=300     ; настройки
  If not Second
  {
    Second=1
    SetTimer, DoublePress, -%Pause_%
  }
  Else
  {
    Second=0
    SetTimer, metka-2-kli2, -1
  }
}
Return
DoublePress:
  If not Second
    Return
  Second=0
  SetTimer, metka-2-kli1, -1
Return
metka-2-kli2-start:
SendInput {MButton down}
sleep 3500
SendInput {MButton up}
sleep 200
Return


;======================================================================функция эмитации разных режимов ввода: SendInput, SendPlay, WinApi
multisendinput(SendInputKey, SendInputKeyStatus, SendPlayKey, SendPlayKeyStatus, WinApiKey, WinApiKeyStatus, WinApiMouseKey, WinApiMouseKeyStatus){
if metodVvoda = 1
	{
	SendInput, {%SendInputKey%%SendInputKeyStatus%}
	; tooltip SendInputKey1 = %metodVvoda%
	}
if metodVvoda = 2
	{
	Sendplay, {Blind}{%SendPlayKey%%SendPlayKeyStatus%}
	; tooltip SendPlayKey2 = %metodVvoda%
	}
if metodVvoda = 3
	{
	if WinApiMouseKeyStatus !=											;если не пусто то нажать клик и отпустить если WinApiMouseKeyStatus = 0x0004 отжать ЛКМ
		{
		DllCall("mouse_event", int, WinApiMouseKey, int, WinApiMouseX, int, WinApiMouseY, uint, 0, int, 0)
		sleep 1
		DllCall("mouse_event", int, WinApiMouseKeyStatus, int, WinApiMouseX, int, WinApiMouseY, uint, 0, int, 0)
		}
		Else															;если пусто то зажать клик
		{
		DllCall("mouse_event", int, WinApiMouseKey, int, WinApiMouseX, int, WinApiMouseY, uint, 0, int, 0)
		}
	if WinApiKeyStatus = 0												;если 0 то нажать и отпустить
		{
		DllCall("keybd_event", int, WinApiKey, int, 0xA0, int, 0, int, 0)
		sleep 1
		DllCall("keybd_event", int, WinApiKey, int, 0xA0, int, 2, int, 0)
		}
	if WinApiKeyStatus = 1												;если 1 то зажать и держать
		{
		DllCall("keybd_event", int, WinApiKey, int, 0xA0, int, 0, int, 0)
		}
	; tooltip WinApiKey3 = %metodVvoda%
	}
}
;=========================================================SendInput={Blind}============функция эмитации разных режимов ввода: SendInput, SendPlay, WinApi
multisendinput2(SendInputKey, SendInputKeyStatus, SendPlayKey, SendPlayKeyStatus, WinApiKey, WinApiKeyStatus, WinApiMouseKey, WinApiMouseKeyStatus){
if metodVvoda = 1
	{
	SendInput, {%SendInputKey%%SendInputKeyStatus%}
	sleep 1
	; tooltip SendInputKey1 = %metodVvoda%
	}
if metodVvoda = 2
	{
	Sendplay, {Blind}{%SendPlayKey%%SendPlayKeyStatus%}
	; tooltip SendPlayKey2 = %metodVvoda%
	}
if metodVvoda = 3
	{
	if WinApiMouseKeyStatus !=											;если не пусто то нажать клик и отпустить если WinApiMouseKeyStatus = 0x0004 отжать ЛКМ
		{
		DllCall("mouse_event", int, WinApiMouseKey, int, WinApiMouseX, int, WinApiMouseY, uint, 0, int, 0)
		sleep 1
		DllCall("mouse_event", int, WinApiMouseKeyStatus, int, WinApiMouseX, int, WinApiMouseY, uint, 0, int, 0)
		}
		Else															;если пусто то зажать клик
		{
		DllCall("mouse_event", int, WinApiMouseKey, int, WinApiMouseX, int, WinApiMouseY, uint, 0, int, 0)
		}
	if WinApiKeyStatus = 0												;если 0 то нажать и отпустить
		{
		DllCall("keybd_event", int, WinApiKey, int, 0xA0, int, 0, int, 0)
		sleep 1
		DllCall("keybd_event", int, WinApiKey, int, 0xA0, int, 2, int, 0)
		}
	if WinApiKeyStatus = 1												;если 1 то зажать и держать
		{
		DllCall("keybd_event", int, WinApiKey, int, 0xA0, int, 0, int, 0)
		}
	; tooltip WinApiKey3 = %metodVvoda%
	}
}




ParsButton:
Loop *.mid
FileMove, %A_LoopFileName%, data\soundall, 1 	;перемещаем все .mid файлы в папку
Index1:=0
Loop data\soundall\*.mid
{
if Index1 = 1
song1var= data/soundall/%A_LoopFileName%
if Index1 = 2
song2var= data/soundall/%A_LoopFileName%
if Index1 = 3
song3var= data/soundall/%A_LoopFileName%
if Index1 = 4
song4var= data/soundall/%A_LoopFileName%
if Index1 = 5
song5var= data/soundall/%A_LoopFileName%
if Index1 = 6
song6var= data/soundall/%A_LoopFileName%
if Index1 = 7
song7var= data/soundall/%A_LoopFileName%
if Index1 = 8
song8var= data/soundall/%A_LoopFileName%
if Index1 = 9
song9var= data/soundall/%A_LoopFileName%
if Index1 = 0
song0var= data/soundall/%A_LoopFileName%
if Index1 = 10
	Break
Index1++
}

midi_config_go= 	;подготовить переменную
(
{
  "always_reload_config": false,
  "songs": [
    {
      "key": "1",
      "file": "%song0var%",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "2",
      "file": "%song1var%",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "3",
      "file": "%song2var%",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "4",
      "file": "%song3var%",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "5",
      "file": "%song4var%",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "6",
      "file": "%song5var%",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "7",
      "file": "%song6var%",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "8",
      "file": "%song7var%",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "9",
      "file": "%song8var%",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "0",
      "file": "%song9var%",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    }
  ]
}
)
FileDelete, data\midi_config.json
FileAppend, %midi_config_go%, data\midi_config.json
Return

ClearButton:
Loop data\soundall\*.mid
FileDelete, data\soundall\%A_LoopFileName%
clear_config_go= 	;подготовить переменную
(
{
  "always_reload_config": false,
  "songs": [
    {
      "key": "1",
      "file": "put the path to your midi file here",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "2",
      "file": "put the path to your midi file here",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "3",
      "file": "put the path to your midi file here",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "4",
      "file": "put the path to your midi file here",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "5",
      "file": "put the path to your midi file here",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "6",
      "file": "put the path to your midi file here",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "7",
      "file": "put the path to your midi file here",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "8",
      "file": "put the path to your midi file here",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "9",
      "file": "put the path to your midi file here",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "0",
      "file": "put the path to your midi file here",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    }
  ]
}
)
FileDelete, data\midi_config.json
FileAppend, %clear_config_go%, data\midi_config.json
Return

RunButton:
Run, cmd /k @echo Off & "%A_ScriptDir%\data\midi.py"
Return

MetkaMenu3:
OnExit, ExitScript
Reload
sleep 100
Exitapp
Return



MetkaMenu0:
OnExit, ExitScript
sleep 100
exitapp
Return
MetkaMenu2:
MsgBox Gayshit Impact AHK flex by Kramar1337`n`nF1 - Карта`nF2 - Оверлей`nF3 - Автоходьба`nF - Фастлут`nZ - Скип диалогов`nX - Ведьмачье чутье`nSpace - Банихоп`nHome - Перезагрузка`nEnd - Завершить работу скрипта
Return



ExitScript:
If metodVvoda = 3
   DllCall("FreeLibrary", "Ptr", hModule)
ExitApp


*~$Home::
OnExit, ExitScript
Reload
sleep 100
Exitapp
Return
*~$End::
OnExit, ExitScript
sleep 100
Exitapp
