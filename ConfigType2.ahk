ConfigType2:
	SysGet, SGW, 71
	GuiWidth:= 210
	GuiHeight:= 210
	gosub GuiBuild
	Gui, Add, Text, 0x80 x10 y10, % "Hotkey " Hk ": " Hkey%Hk%Shortcut " - Type 2"
	Gui, Add, Edit, x30 y40 W110 h20 vHkey%Hk%Spell1, % Hkey%Hk%Spell1
	Gui, Add, Text, x160 y43, Spell 1
	Gui, Add, Edit, x30 y70 W110 h20 vHkey%Hk%Spell2, % Hkey%Hk%Spell2
	Gui, Add, Text, x160 y73, Spell 2
	Gui, Add, Edit, x10 y100 W70 h20 vHkey%Hk%Key, % Hkey%Hk%Key
	Gui, Add, Text, x90 y103, Shortcut Key
	Gui, Add, Checkbox, % "x10 y130 h13 w13 vType2MoveToggleHotkey" Hk " Checked" Type2MoveToggleHotkey%Hk%
	Gui, Add, Text, x30 y130, replace cursor
	Gui, Add, Checkbox, % " x10 y160 vHkey" Hk "AltEquiptoggle checked" Hkey%Hk%AltEquiptoggle, Alternate equipment
	Gui, Add, Button, x10 y180 w90 h20 gWrite2 Default, Define
	Gui, Add, Button, x110 y180 w90 h20 gCancel, Reload
	Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, Swap Caster
Return

Write2:
	gosub GuiSD
	IniWrite, % Hkey%Hk%Spell1, UnrapeKitConfig.ini, HotkeySpells, Hkey%Hk%Spell1
	IniWrite, % Hkey%Hk%Spell2, UnrapeKitConfig.ini, HotkeySpells, Hkey%Hk%Spell2
	IniWrite, % Hkey%Hk%Key, UnrapeKitConfig.ini, HotkeyKey, Hkey%Hk%Key
	IniWrite, % Hkey%Hk%AltEquiptoggle, UnrapeKitConfig.ini, HotkeyKey, Hkey%Hk%AltEquiptoggle
	IniWrite, % Type2MoveToggleHotkey%Hk%, UnrapeKitConfig.ini, HotkeySpells, Type2MoveToggleHotkey%Hk%
	Gosub KeyWrite
Return