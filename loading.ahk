; ==================== INITIALIZATION ====================
#SingleInstance, force
#WinActivateForce
;#IfWinActive Path of Exile
#MaxThreadsperHotkey 2
; -------------------- Settings --------------------
SetTitleMatchMode, 2
CoordMode, Mouse
SetWorkingDir, %A_ScriptDir%

SetBatchLines, -1
SetDefaultMouseSpeed, 1
SetKeyDelay, 20, 20
SetMouseDelay, 20

ToolTip, Loading

Hk := 1
T7:= 1
gosub IniLoad

ToolTip, Load Complete
SetTimer, RemoveToolTip, -500

#Include, IniSettings.ahk
; #Include, ConfigLists.ahk
#Include, GeneralFunctions.ahk
;#Include, SetupHotkeys.ahk
#Include, DelayConfig.ahk
#Include, ScreenCapture.ahk
#Include, ScanConfig.ahk
#Include, SpellScan.ahk
#Include, HotkeyConfig.ahk
#Include, HotkeyRouting.ahk
#Include, ConfigType1.ahk
#Include, ConfigType2.ahk
#Include, ConfigType3.ahk
#Include, ConfigType4.ahk
#Include, ConfigType5&6.ahk
#Include, ConfigType7.ahk
#Include, Type1.ahk
#Include, Type2.ahk
#Include, Type3.ahk
#Include, Type4.ahk
#Include, Type5.ahk
#Include, Type6.ahk
#Include, Type7.ahk

WinGetPos, X, Y, WinW, WinH, Path of Exile
Winset, Transparent, 0

FileGetSize, Size, C:\Program Files (x86)\Grinding Gear Games\Path of Exile\Content.ggpk
Return

; ==================== CONFIGURATION LOADING ====================

F7::
return

; ==================== FUNCTIONS ====================

RCtrl & F10::
	Gui, Cancel
	Reload
Return

RCtrl & F11:: Pause
RCtrl & F12:: ExitApp



RCtrl & F9::
	GuiWidth:= 270
	GuiHeight:= 270
	MouseGetPos, Xpos, Ypos
	gosub GuiBuild
	Gui, Add, Text, X10 Y10, Configuration Hotkeys:
	Gui, Add, Edit, X10 Y40 H21 W140 vHotkeyConfig, %HotkeyConfig%
	Gui, Add, Edit, X10 Y70 H21 W140 vScanConfig, %ScanConfig%
	Gui, Add, Edit, X10 Y100 H21 W140 vSpellScan, %SpellScan%
	Gui, Add, Edit, X10 Y130 H21 W140 vScreenCapture, %ScreenCapture%
	Gui, Add, Edit, X10 Y160 H21 W140 vDelayConfig, %DelayConfig%
	Gui, Add, Text, X160 Y43, Hotkey Configuration
	Gui, Add, Text, X160 Y73, Scan Configuration
	Gui, Add, Text, X160 Y103, Spell Scan
	Gui, Add, Text, X160 Y133, Screen Capture
	Gui, Add, Text, X160 Y163, Delay Configuration
	Gui, Add, Button, x70 y200 w90 h20 gSetupConfig Default, Ok
	Gui, Add, Button, x170 y200 w90 h20 gCancel, Reload
	Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, Hotkey Configuration
Return

SetupConfig:
	gosub GuiSD
	IniWrite, %ScanCount%, UnrapeKitConfig.ini, ScanCount, ScanCount
	IniWrite, %HotkeyConfig%, UnrapeKitConfig.ini, Configuration, HotkeyConfig
	IniWrite, %ScanConfig%, UnrapeKitConfig.ini, Configuration, ScanConfig
	IniWrite, %SpellScan%, UnrapeKitConfig.ini, Configuration, SpellScan
	IniWrite, %ScreenCapture%, UnrapeKitConfig.ini, Configuration, ScreenCapture
	IniWrite, %DelayConfig%, UnrapeKitConfig.ini, Configuration, DelayConfig
	Hotkey, %HotkeyConfig%, HotkeyConfig
	Hotkey, %ScanConfig%, ScanConfig
	Hotkey, %SpellScan%, SpellScan
	Hotkey, %ScreenCapture%, ScreenCapture
	Hotkey, %DelayConfig%, DelayConfig
	Reload
Return

IniLoad:
	IniRead, ScanCount, UnrapeKitConfig.ini, ScanCount, ScanCount, %A_Space%
	IniRead, HotkeyLimit, UnrapeKitConfig.ini, Hotkeys, HotkeyLimit, %A_Space%
	IniRead, Delay, UnrapeKitConfig.ini, Delay, Delay, %A_Space%
	IniRead, FrameTime, UnrapeKitConfig.ini, Delay, FrameTime, %A_Space%
	IniRead, KeyDelay1, UnrapeKitConfig.ini, Delay, KeyDelay1, %A_Space%
	IniRead, KeyDelayPress, UnrapeKitConfig.ini, Delay, KeyDelayPress, %A_Space%
	IniRead, MouseDelay, UnrapeKitConfig.ini, Delay, MouseDelay, %A_Space%
	SetKeyDelay, %KeyDelay1%, %KeyDelayPress%
	SetMouseDelay, %MouseDelay%
	IniRead, HotkeyConfig, UnrapeKitConfig.ini, Configuration, HotkeyConfig, %A_Space%
	IniRead, ScanConfig, UnrapeKitConfig.ini, Configuration, ScanConfig, %A_Space%
	IniRead, SpellScan, UnrapeKitConfig.ini, Configuration, SpellScan, %A_Space%
	IniRead, ScreenCapture, UnrapeKitConfig.ini, Configuration, ScreenCapture, %A_Space%
	IniRead, DelayConfig, UnrapeKitConfig.ini, Configuration, DelayConfig, %A_Space%
	IniRead, CaptureName, UnrapeKitConfig.ini, Configuration, CaptureName, %A_Space%
	Hotkey, %HotkeyConfig%, HotkeyConfig
	Hotkey, %ScanConfig%, ScanConfig
	Hotkey, %SpellScan%, SpellScan
	Hotkey, %ScreenCapture%, ScreenCapture
	Hotkey, %DelayConfig%, DelayConfig
return
