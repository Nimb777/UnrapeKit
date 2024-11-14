ConfigType4:
	GuiWidth:= 210
	GuiHeight:= 140
	gosub GuiBuild
	Gui, Add, Text, 0x80 x10 y10, % "Hotkey " Hk ": " Hkey%Hk%Shortcut " - Type 4"
	Gui, Add, Edit, x10 y40 w140 h20 vHkey%Hk%Spell1T4, % Hkey%Hk%Spell1T4
	Gui, Add, Text, x160 y43, Spell 1
	Gui, Add, Edit, x10 y70 w70 h20 vHkey%Hk%Key, % Hkey%Hk%Key
	Gui, Add, Text, x90 y73, Shortcut key
	Gui, Add, Button, x10 y110 w90 h20 gWrite4 Default, Define
	Gui, Add, Button, x110 y110 w90 h20 gCancel, Reload
	Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, Spell Toggle
Return

Write4:
	gosub GuiSD
	IniWrite, % Hkey%Hk%Spell1T4, UnrapeKitConfig.ini, HotkeySpells, Hkey%Hk%Spell1T4
	IniWrite, % Hkey%Hk%Key, UnrapeKitConfig.ini, HotkeyKey, Hkey%Hk%Key
	Gosub KeyWrite
Return
