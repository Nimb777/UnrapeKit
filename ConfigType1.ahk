ConfigType1:
	GuiWidth:= 250
	GuiHeight:= 60
	gosub GuiBuild
	Gui, Add, Text, 0x80 x10 y10, % "Hotkey " Hk ": " Hkey%Hk%Shortcut " - Type 1"
	Gui, Add, Button, x10 y30 w50 h20 gV1, v1
	Gui, Add, Button, x70 y30 w50 h20 gV2, v2
	Gui, Add, Button, x130 y30 w50 h20 gV3 Default, v3
	Gui, Add, Button, x190 y30 w50 h20 gCancel, Reload
	Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, Auto Caster
Return

V1:
	T1%Hk%:= 1
	gosub GuiSD
	GuiWidth:= 210
	GuiHeight:= 260
	gosub GuiBuild
	Gui, Add, Text, 0x80 x10 y10, % "Hotkey " Hk ": " Hkey%Hk%Shortcut " - V1"
	Gui, Add, Edit, x10 y40 w140 h20 vHkey%Hk%Spell1, % Hkey%Hk%Spell1
	Gui, Add, Text, x160 y43, Spell 1
	Gui, Add, Edit, x10 y70 w140 h20 vHkey%Hk%Spell2, % Hkey%Hk%Spell2
	Gui, Add, Text, x160 y73, Spell 2
	Gui, Add, Edit, x10 y100 w70 h20 vHkey%Hk%Key, % Hkey%Hk%Key
	Gui, Add, Text, x90 y103, Shortcut Key
	Gui, Add, Edit, x10 y130 w20 h20 vTriggeredCount%Hk%, % TriggeredCount%Hk%
	Gui, Add, Text, x40 y133, Extra Triggered Spells
	Gui, Add, Edit, x10 y160 w30 h20 vScanDelay%Hk%, % ScanDelay%Hk%
	Gui, Add, Text, x50 y163, Scan Loop Delay, ms
	Gui, Add, Edit, x10 y190 w30 h20 vT1Cooldown%Hk%, % T1Cooldown%Hk%
	Gui, Add, Text, x50 y193, Spell 1 Cooldown, ms
	Gui, Add, Button, x10 y230 w90 h20 gTriggered1 Default, Define
	Gui, Add, Button, x110 y230 w90 h20 gCancel, Reload
	Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, Auto Caster
Return

Triggered1:
	gosub GuiSD
	TrigN:= 3
	IniWrite, % T1%Hk%, UnrapeKitConfig.ini, triggeredCount, T1%Hk%
	IniWrite, % TriggeredCount%Hk%, UnrapeKitConfig.ini, triggeredCount, TriggeredCount%Hk%
	IniWrite, % Hkey%Hk%Spell1, UnrapeKitConfig.ini, HotkeySpells, Hkey%Hk%Spell1
	IniWrite, % Hkey%Hk%Spell2, UnrapeKitConfig.ini, HotkeySpells, Hkey%Hk%Spell2
	IniWrite, % Hkey%Hk%Key, UnrapeKitConfig.ini, HotkeyKey, Hkey%Hk%Key
	IniWrite, % ScanDelay%Hk%, UnrapeKitConfig.ini, Delay, ScanDelay%Hk%
	IniWrite, % T1Cooldown%Hk%, UnrapeKitConfig.ini, Delay, T1Cooldown%Hk%
	If TriggeredCount%Hk% = 0
		gosub TriggeredWrite1
	Loop, % TriggeredCount%Hk% {
		Y1:= 30 * TrigN - 27
		Y2:= 30 * TrigN - 30
		Y3:= 30 * TrigN + 3
		Y4:= 30 * TrigN
		Gui, Add, Text, 0x80 x10 y10, % "Hotkey " Hk ": " Hkey%Hk%Shortcut ": Additional Spells"
		Gui, Add, Text, x10 y30, Toggle`, SpellName
		Gui, Add, Checkbox, % "x10 y" Y1 " h13 w13 vTriggerToggle" TrigN "_" Hk " Checked" TriggerToggle%TrigN%_%Hk%
		Gui, Add, Edit, x41 y%Y2% w140 h20 vHkey%Hk%Spell%TrigN%, % Hkey%Hk%Spell%TrigN%
		Gui, Add, Text, x191 y%Y1%, % "Spell " TrigN ", Cooldown"
		Gui, Add, Edit, x291 y%Y2% w40 h20 vHkey%Hk%T1Cooldown%TrigN%, % Hkey%Hk%T1Cooldown%TrigN%
		Gui, Add, Text, x341 y%Y1%, ms
			If (A_Index = TriggeredCount%Hk%) {
				GuiWidth:= 370
				GuiHeight:= 40 + 30 * TrigN
				ButtonHeight:= 30 * TrigN + 10
				gosub Guibuild
				Gui, Add, Button, x170 y%ButtonHeight% w90 h20 gTriggeredWrite1 Default, Record
				Gui, Add, Button, x270 y%ButtonHeight% w90 h20 gCancel, Reload
				Gui, Show, W%GuiWidth% H%GuiHeight% X%Move_X% Y%Move_Y%, Auto Caster
				Break
			}
		TrigN+= 1
	}
Return

TriggeredWrite1:
	gosub GuiSD
	TrigN:= 3
	Loop, % TriggeredCount%Hk% {
		IniWrite, % TriggerToggle%TrigN%_%Hk%, UnrapeKitConfig.ini, TriggeredToggle, TriggerToggle%TrigN%_%Hk%
		IniWrite, % Hkey%Hk%Spell%TrigN%, UnrapeKitConfig.ini, TriggeredSpells, Hkey%Hk%Spell%TrigN%
		IniWrite, % Hkey%Hk%T1Cooldown%TrigN%, UnrapeKitConfig.ini, TriggeredSpells, Hkey%Hk%T1Cooldown%TrigN%
		TrigN+=1
	}
	Gosub KeyWrite
Return

;============================================================================================================

V2:
	gosub GuiSD
	T1%Hk%:= 2
	TrigN:= 1
	GuiWidth:= 210
	GuiHeight:= 200
	gosub GuiBuild
	Gui, Add, Text, 0x80 x10 y10, % "Hotkey " Hk ": " Hkey%Hk%Shortcut " - V2"
	Gui, Add, Edit, x10 y40 w70 h20 vHkey%Hk%Key%TrigN%, % Hkey%Hk%Key%TrigN%
	Gui, Add, Text, x110 y43, Shortcut Key
	Gui, Add, Edit, x10 y70 w30 h20 vScanDelay%Hk%, % ScanDelay%Hk%
	Gui, Add, Text, x50 y73, Scan Loop Delay, ms
	Gui, Add, Edit, x10 y100 w30 h20 vHkey%Hk%T1Cooldown%TrigN%, % Hkey%Hk%T1Cooldown%TrigN%
	Gui, Add, Text, x50 y103, Spell 1 Cooldown, ms
	Gui, Add, Edit, x10 y130 w40 h20 vTriggeredCount%Hk%, % TriggeredCount%Hk%
	Gui, Add, Text, x60 y133, Extra Triggered Spells
	Gui, Add, Button, x10 y160 w90 h20 gTriggered2 Default, Define
	Gui, Add, Button, x110 y160 w90 h20 gCancel, Reload
	Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, Auto Caster
Return

Triggered2:
	gosub GuiSD
	IniWrite, % TriggeredCount%Hk%, UnrapeKitConfig.ini, triggeredCount, TriggeredCount%Hk%
	IniWrite, % T1%Hk%, UnrapeKitConfig.ini, triggeredCount, T1%Hk%
	IniWrite, % Hkey%Hk%Key%TrigN%, UnrapeKitConfig.ini, HotkeyKey, Hkey%Hk%Key%TrigN%
	IniWrite, % ScanDelay%Hk%, UnrapeKitConfig.ini, Delay, ScanDelay%Hk%
	IniWrite, % Hkey%Hk%T1Cooldown%TrigN%, UnrapeKitConfig.ini, Delay, Hkey%Hk%T1Cooldown%TrigN%
	TrigN:= 2
	If TriggeredCount%Hk% = 0
		gosub TriggeredWrite2
	Loop, % TriggeredCount%Hk% {
		Y1:= 30 * TrigN - 27
		Y2:= 30 * TrigN - 30
		Y3:= 30 * TrigN + 3
		Y4:= 30 * TrigN
		Gui, Add, Text, 0x80 x10 y10, % "Hotkey " Hk ": " Hkey%Hk%Shortcut ": Additional shortcuts"
		Gui, Add, Edit, x41 y%Y2% w140 h20 vHkey%Hk%Key%TrigN%, % Hkey%Hk%Key%TrigN%
		Gui, Add, Text, x191 y%Y1%, % "Spell " TrigN ", Cooldown"
		Gui, Add, Edit, x291 y%Y2% w40 h20 vHkey%Hk%T1Cooldown%TrigN%, % Hkey%Hk%T1Cooldown%TrigN%
		Gui, Add, Text, x341 y%Y1%, ms
			If (A_Index = TriggeredCount%Hk%) {
				GuiWidth:= 370
				GuiHeight:= 40 + 30 * TrigN
				ButtonHeight:= 30 * TrigN + 10
				gosub Guibuild
				Gui, Add, Button, x170 y%ButtonHeight% w90 h20 gTriggeredWrite2 Default, Record
				Gui, Add, Button, x270 y%ButtonHeight% w90 h20 gCancel, Reload
				Gui, Show, W%GuiWidth% H%GuiHeight% X%Move_X% Y%Move_Y%,
		Gui, Add, Text, x10 y30, (Q, W, E, R, T, LButton, MButton, RButton)
				Break
			}
		TrigN+= 1
	}
Return

TriggeredWrite2:
	gosub GuiSD
		IniWrite, % Hkey%Hk%Key1, UnrapeKitConfig.ini, TriggeredSpells, Hkey%Hk%Key1
	TrigN:= 2
	Loop, % TriggeredCount%Hk% {
		IniWrite, % Hkey%Hk%Key%TrigN%, UnrapeKitConfig.ini, TriggeredSpells, Hkey%Hk%Key%TrigN%
		IniWrite, % Hkey%Hk%T1Cooldown%TrigN%, UnrapeKitConfig.ini, TriggeredSpells, Hkey%Hk%T1Cooldown%TrigN%
		TrigN+=1
	}
	Gosub KeyWrite
Return

;============================================================================================================

V3:
	gosub GuiSD
; msgbox, % Hkey%Hk%Spell%TrigN%
	T1%Hk%:= 3
	TrigN:= 1
	GuiWidth:= 210
	GuiHeight:= 230
	gosub GuiBuild
	Gui, Add, Text, 0x80 x10 y10, Toggle for Ctrl hotkey
	Gui, Add, Edit, x10 y40 w140 h20 vHkey%Hk%Spell%TrigN%, % Hkey%Hk%Spell%TrigN%
	Gui, Add, Text, x160 y43, Spell 1
	Gui, Add, Checkbox, % "x10 y73 h13 w13 vHKey" Hk "CtrlKeyToggle Checked" HKey%Hk%CtrlKeyToggle
	Gui, Add, Edit, x30 y70 w70 h20 vHkey%Hk%Key%TrigN%, % Hkey%Hk%Key%TrigN%
	Gui, Add, Text, x110 y73, Shortcut Key
	Gui, Add, Edit, x10 y100 w30 h20 vScanDelay%Hk%, % ScanDelay%Hk%
	Gui, Add, Text, x50 y103, Scan Loop Delay, ms
	Gui, Add, Edit, x10 y130 w30 h20 vHkey%Hk%T1Cooldown%TrigN%, % Hkey%Hk%T1Cooldown%TrigN%
	Gui, Add, Text, x50 y133, Spell 1 Cooldown, ms
	Gui, Add, Edit, x10 y160 w40 h20 vTriggeredCount%Hk%, % TriggeredCount%Hk%
	Gui, Add, Text, x60 y163, Extra Triggered Spells
	Gui, Add, Button, x10 y190 w90 h20 gTriggered3 Default, Define
	Gui, Add, Button, x110 y190 w90 h20 gCancel, Reload
	Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, % "Hotkey " Hk ": " Hkey%Hk%Shortcut " - V2"
Return

Triggered3:
	gosub GuiSD
	IniWrite, % TriggeredCount%Hk%, UnrapeKitConfig.ini, triggeredCount, TriggeredCount%Hk%
	IniWrite, % T1%Hk%, UnrapeKitConfig.ini, triggeredCount, T1%Hk%
	IniWrite, % Hkey%Hk%Spell%TrigN%, UnrapeKitConfig.ini, HotkeySpells, Hkey%Hk%Spell%TrigN%
	IniWrite, % Hkey%Hk%Key%TrigN%, UnrapeKitConfig.ini, HotkeyKey, Hkey%Hk%Key%TrigN%
	IniWrite, % HKey%Hk%CtrlKeyToggle, UnrapeKitConfig.ini, HotkeyKey, HKey%Hk%CtrlKeyToggle
	IniWrite, % ScanDelay%Hk%, UnrapeKitConfig.ini, Delay, ScanDelay%Hk%
	IniWrite, % Hkey%Hk%T1Cooldown%TrigN%, UnrapeKitConfig.ini, Delay, Hkey%Hk%T1Cooldown%TrigN%
	TrigN:= 2
	If TriggeredCount%Hk% = 0
		gosub TriggeredWrite2
	Loop, % TriggeredCount%Hk% {
		Y1:= 30 * TrigN - 27
		Y2:= 30 * TrigN - 30
		Y3:= 30 * TrigN + 3
		Y4:= 30 * TrigN
		Gui, Add, Text, 0x80 x10 y10, Toggle for Ctrl hotkey
		Gui, Add, Edit, x10 y40 w140 h20 vHkey%Hk%Spell%TrigN%, % Hkey%Hk%Spell%TrigN%
		Gui, Add, Text, x160 y43, Spell 1
		Gui, Add, Checkbox, % "x10 y" Y2 " h13 w13 vHKey" HkT1 "CtrlKeyToggle Checked" HKey%HkT1%CtrlKeyToggle
		Gui, Add, Edit, x41 y%Y2% w140 h20 vHkey%Hk%Key%TrigN%, % Hkey%Hk%Key%TrigN%
		Gui, Add, Text, x191 y%Y1%, % "Spell " TrigN ", Cooldown" (Toggle for Ctrl)
		Gui, Add, Edit, x291 y%Y2% w40 h20 vHkey%Hk%T1Cooldown%TrigN%, % Hkey%Hk%T1Cooldown%TrigN%
		Gui, Add, Text, x341 y%Y1%, ms
			If (A_Index = TriggeredCount%Hk%) {
				GuiWidth:= 370
				GuiHeight:= 40 + 30 * TrigN
				ButtonHeight:= 30 * TrigN + 10
				gosub Guibuild
				Gui, Add, Button, x170 y%ButtonHeight% w90 h20 gTriggeredWrite3 Default, Record
				Gui, Add, Button, x270 y%ButtonHeight% w90 h20 gCancel, Reload
				Gui, Show, W%GuiWidth% H%GuiHeight% X%Move_X% Y%Move_Y%, % "Hotkey " Hk ": " Hkey%Hk%Shortcut ": Additional shortcuts"
		Gui, Add, Text, x10 y30, (Q, W, E, R, T, LButton, MButton, RButton)
				Break
			}
		TrigN+= 1
	}
Return

TriggeredWrite3:
	gosub GuiSD
	TrigN:= 2
	Loop, % TriggeredCount%Hk% {
		IniWrite, % Hkey%Hk%Spell%TrigN%, UnrapeKitConfig.ini, HotkeySpells, Hkey%Hk%Spell%TrigN%
		IniWrite, % Hkey%Hk%Key%TrigN%, UnrapeKitConfig.ini, HotkeyKey, Hkey%Hk%Key%TrigN%
		IniWrite, % HKey%HkT1%CtrlKeyToggle, UnrapeKitConfig.ini, HotkeyKey, HKey%HkT1%CtrlKeyToggle
		IniWrite, % Hkey%Hk%T1Cooldown%TrigN%, UnrapeKitConfig.ini, TriggeredSpells, Hkey%Hk%T1Cooldown%TrigN%
		TrigN+=1
	}
	Gosub KeyWrite
Return

