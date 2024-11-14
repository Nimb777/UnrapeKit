ConfigType3:
	SysGet, SGW, 71
	GuiWidth:= 210
	GuiHeight:= 220
	gosub GuiBuild
	Gui, Add, Text, 0x80 x10 y10, % "Hotkey " Hk ": " Hkey%Hk%Shortcut " - Type 3"
	Gui, Add, Edit, x10 y40 W140 h20 vHkey%Hk%Spell1, % Hkey%Hk%Spell1
	Gui, Add, Text, x160 y43, Spell 1
	Gui, Add, Edit, x10 y70 W140 vHkey%Hk%Spell2, % Hkey%Hk%Spell2
	Gui, Add, Text, x160 y73, Spell 2
	Gui, Add, Edit, x10 y100 W70 vHkey%Hk%Key, % Hkey%Hk%Key
	Gui, Add, Text, x90 y103, Shortcut key
	Gui, Add, Checkbox, % "x10 y130 h13 w13 vType3Cast1ToggleHotkey" Hk " Checked" Type3Cast1ToggleHotkey%Hk%
	Gui, Add, Text, x40 y130, Cast Spell 1
	Gui, Add, Checkbox, % "x10 y160 h13 w13 vType3Cast2ToggleHotkey" Hk " Checked" Type3Cast2ToggleHotkey%Hk%
	Gui, Add, Text, x40 y160, Cast Spell 2
	Gui, Add, Button, x10 y190 w90 h20 gWrite3 Default, Define
	Gui, Add, Button, x110 y190 w90 h20 gCancel, Reload
	Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, Shortcut Reset
Return

Write3:
	gosub GuiSD
	IniWrite, % Hkey%Hk%Spell1, UnrapeKitConfig.ini, HotkeySpells, Hkey%Hk%Spell1
	IniWrite, % Hkey%Hk%Spell2, UnrapeKitConfig.ini, HotkeySpells, Hkey%Hk%Spell2
	IniWrite, % Type3Cast1ToggleHotkey%Hk%, UnrapeKitConfig.ini, HotkeySpells, Type3Cast1ToggleHotkey%Hk%
	IniWrite, % Type3Cast2ToggleHotkey%Hk%, UnrapeKitConfig.ini, HotkeySpells, Type3Cast2ToggleHotkey%Hk%
	IniWrite, % Hkey%Hk%Key, UnrapeKitConfig.ini, HotkeyKey, Hkey%Hk%Key
	Gosub KeyWrite
Return