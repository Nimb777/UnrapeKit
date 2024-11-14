
ConfigType1:
	GuiWidth:= 210
	GuiHeight:= 260
	gosub GuiBuild
	Gui, Add, Text, 0x80 x10 y10, % "Hotkey " Hk ": " Hkey%Hk%Shortcut " - Type 1"
	Gui, Add, Edit, x10 y40 w140 h20 vHKey%Hk%Spell1, % HKey%Hk%Spell1
	Gui, Add, Text, x160 y43, Spell 1
	Gui, Add, Edit, x10 y70 w140 h20 vHKey%Hk%Spell2, % HKey%Hk%Spell2
	Gui, Add, Text, x160 y73, Spell 2
	Gui, Add, Edit, x10 y100 w70 h20 vHKey%Hk%Key, % HKey%Hk%Key
	Gui, Add, Text, x90 y103, Shortcut Key
	Gui, Add, Edit, x10 y130 w20 h20 vXTriggeredCount%Hk%, % XTriggeredCount%Hk%
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
	Gui, Submit
	Gui, Destroy
	TrigN:= 3
	IniWrite, % XTriggeredCount%Hk%, UnrapeKitConfig.ini, XtriggeredCount, XTriggeredCount%Hk%
	IniWrite, % HKey%Hk%Spell1, UnrapeKitConfig.ini, HotkeySpells, HKey%Hk%Spell1
	IniWrite, % HKey%Hk%Spell2, UnrapeKitConfig.ini, HotkeySpells, HKey%Hk%Spell2
	IniWrite, % HKey%Hk%Key, UnrapeKitConfig.ini, HotkeyKey, HKey%Hk%Key
	IniWrite, % ScanDelay%Hk%, UnrapeKitConfig.ini, Delay, ScanDelay%Hk%
	IniWrite, % T1Cooldown%Hk%, UnrapeKitConfig.ini, Delay, T1Cooldown%Hk%
		If XTriggeredCount%Hk% = 0
			Gosub TriggeredWrite
	Gui, -0x80000 AlwaysOnTop
	Loop, % XTriggeredCount%Hk% {
		Y1:= 30 * TrigN - 27
		Y2:= 30 * TrigN - 30
		Y3:= 30 * TrigN + 3
		Y4:= 30 * TrigN
		Gui, Add, Text, 0x80 x10 y10, % "Hotkey " Hk ": " Hkey%Hk%Shortcut ": Additional Spells"
		Gui, Add, Text, x10 y30, Toggle`, SpellName
		Gui, Add, Checkbox, % "x10 y" Y1 " h13 w13 vTriggerToggle" TrigN "_" Hk " Checked" TriggerToggle%TrigN%_%Hk%
		Gui, Add, Edit, x41 y%Y2% w140 h20 vHKey%Hk%Spell%TrigN%, % HKey%Hk%Spell%TrigN%
		Gui, Add, Text, x191 y%Y1%, % "Spell " TrigN ", Cooldown"
		Gui, Add, Edit, x291 y%Y2% w40 h20 vHKey%Hk%T1Cooldown%TrigN%, % HKey%Hk%T1Cooldown%TrigN%
		Gui, Add, Text, x341 y%Y1%, ms
			If (A_Index = XTriggeredCount%Hk%) {
				GuiWidth:= 370
				GuiHeight:= 40 + 30 * TrigN
				ButtonHeight:= 30 * TrigN + 10
				gosub Guibuild
				Gui, Add, Button, x170 y%ButtonHeight% w90 h20 gTriggeredWrite Default, Record
				Gui, Add, Button, x270 y%ButtonHeight% w90 h20 gCancel, Reload
				Gui, Show, W%GuiWidth% H%GuiHeight% X%Move_X% Y%Move_Y%, Auto Caster
				Break
			}
		TrigN+= 1
	}
Return
