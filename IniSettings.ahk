HotkeyLoadLoop:
gosub hotkeySetupRead
Hk:= 1
	Loop, %HotKeyLimit% {
		While (Hkey%Hk%Toggle = 0) {
			Hotkey, % Hkey%Hk%Shortcut, Hotkey%Hk%
			If (Hkey%Hk%Type1 = 1) {
				gosub Type1Load
				break
			}
			If (Hkey%Hk%Type2 = 1) {
				gosub Type2Load
				break
			}
			If (Hkey%Hk%Type3 = 1) {
				gosub Type3Load
				break
			}
			If (Hkey%Hk%Type4 = 1)
				gosub Type4Load
				break
			If (Hkey%Hk%Type5 = 1) {
				gosub Type5Load
				break
			}
			If (Hkey%Hk%Type6 = 1) {
				gosub Type6Load
				break
			}
			If (Hkey%Hk%Type7 = 1) {
				gosub Type7Load
				break
			}
		}
		If (A_Index = HotkeyLimit) {
			Hk:= 1
			break
		}
	Hk += 1
	}
return

HotkeySetupRead:
Hk:= 1
    Loop, %HotKeyLimit% {
		IniRead, Hkey%Hk%Toggle, UnrapeKitConfig.ini, HotkeyToggle, Hkey%Hk%Toggle, %A_Space%
		IniRead, Hkey%Hk%Type1, UnrapeKitConfig.ini, HotkeyType, Hkey%Hk%Type1, %A_Space%
		IniRead, Hkey%Hk%Type2, UnrapeKitConfig.ini, HotkeyType, Hkey%Hk%Type2, %A_Space%
		IniRead, Hkey%Hk%Type3, UnrapeKitConfig.ini, HotkeyType, Hkey%Hk%Type3, %A_Space%
		IniRead, Hkey%Hk%Type4, UnrapeKitConfig.ini, HotkeyType, Hkey%Hk%Type4, %A_Space%
		IniRead, Hkey%Hk%Type5, UnrapeKitConfig.ini, HotkeyType, Hkey%Hk%Type5, %A_Space%
		IniRead, Hkey%Hk%Type6, UnrapeKitConfig.ini, HotkeyType, Hkey%Hk%Type6, %A_Space%
		IniRead, Hkey%Hk%Type7, UnrapeKitConfig.ini, HotkeyType, Hkey%Hk%Type7, %A_Space%
		IniRead, Hkey%Hk%Type8, UnrapeKitConfig.ini, HotkeyType, Hkey%Hk%Type8, %A_Space%
		IniRead, Hkey%Hk%Key, UnrapeKitConfig.ini, HotkeyKey, Hkey%Hk%Key, %A_Space%
		IniRead, KeyX_%Hk%, UnrapeKitConfig.ini, KeyCoordinates, KeyX_%Hk%, %A_Space%
		IniRead, KeyY_%Hk%, UnrapeKitConfig.ini, KeyCoordinates, KeyY_%Hk%, %A_Space%
		IniRead, Hkey%Hk%Shortcut, UnrapeKitConfig.ini, HotkeyShortcut, Hkey%Hk%Shortcut, %A_Space%
		Hk+= 1
	}
Hk:= 1
return

LoadSocketLists:
	SocketList1 := [ {name: "6SocketWeaponTopRightSocket", x: 72, y: 50, coordX: 1355, coordY: 170}
				   , {name: "6SocketWeaponTopCenterSocket", x: 149, y: 50, coordX: 1405, coordY: 170}
				   , {name: "6SocketWeaponMiddleRightSocket", x: 71, y: 125, coordX: 1355, coordY: 225}
				   , {name: "6SocketWeaponMiddleCenterSocket", x: 149, y: 125, coordX: 1405, coordY: 225}
				   , {name: "6SocketWeaponBottomRightSocket", x: 72, y: 200, coordX: 1355, coordY: 280}
				   , {name: "6SocketWeaponBottomCenterSocket", x: 149, y: 200, coordX: 1405, coordY: 280}
				   , {name: "RightWeaponTopSocket", x: 111, y: 50, coordX: 1380, coordY: 170}
				   , {name: "RightWeaponMiddleSocket", x: 111, y: 125, coordX: 1380, coordY: 225}
				   , {name: "RightWeaponBottomSocket", x: 111, y: 200, coordX: 1380, coordY: 280}
				   , {name: "RightWeaponTopRightSocket", x: 84, y: 88, coordX: 1355, coordY: 200}
				   , {name: "RightWeaponTopCenterSocket", x: 137, y: 88, coordX: 1405, coordY: 200}
				   , {name: "RightWeaponBottomCenterSocket", x: 137, y: 163, coordX: 1405, coordY: 250}
				   , {name: "LeftHandTopSocket", x: 523, y: 50, coordX: 1795, coordY: 170}
				   , {name: "LeftHandMiddleSocket", x: 523, y: 125, coordX: 1795, coordY: 225}
				   , {name: "LeftHandBottomSocket", x: 523, y: 200, coordX: 1795, coordY: 280}
				   , {name: "LeftHandTopCenterSocket", x: 496, y: 88, coordX: 1765, coordY: 200}
				   , {name: "LeftHandTopLeftSocket", x: 550, y: 88, coordX: 1820, coordY: 200}
				   , {name: "LeftHandBottomLeftSocket", x: 550, y: 163, coordX: 1820, coordY: 250}
				   , {name: "LeftHandMiddleCenterSocket", x: 485, y: 125, coordX: 1770, coordY: 225}
				   , {name: "LeftHandMiddleLeftSocket", x: 561, y: 125, coordX: 1820, coordY: 225} ]

	SocketList2 := [ {name: "HelmetTopRightSocket", x: 279, y: 21, coordX: 1560, coordY: 135}
				   , {name: "HelmetTopLeftSocket", x: 355, y: 21, coordX: 1615, coordY: 135}
				   , {name: "HelmetBottomRightSocket", x: 279, y: 97, coordX: 1560, coordY: 185}
				   , {name: "HelmetBottomLeftSocket", x: 355, y: 97, coordX: 1615, coordY: 185}
				   , {name: "HelmetMiddleRightSocket", x: 279, y: 57, coordX: 1560, coordY: 160}
				   , {name: "HelmetMiddleLeftSocket", x: 355, y: 57, coordX: 1615, coordY: 160}
				   , {name: "HelmetMiddleSocket", x: 317, y: 57, coordX: 1690, coordY: 160}
				   , {name: "GlovesTopRightSocket", x: 151, y: 257, coordX: 1430, coordY: 370}
				   , {name: "GlovesTopCenterSocket", x: 224, y: 257, coordX: 1485, coordY: 370}
				   , {name: "GlovesBottomRightSocket", x: 151, y: 332, coordX: 1430, coordY: 420}
				   , {name: "GlovesBottomCenterSocket", x: 224, y: 332, coordX: 1485, coordY: 420}
				   , {name: "GlovesMiddleRightSocket", x: 151, y: 294, coordX: 1430, coordY: 395}
				   , {name: "GlovesMiddleCenterSocket", x: 224, y: 294, coordX: 1485, coordY: 395}
				   , {name: "GlovesMiddleSocket", x: 187, y: 294, coordX: 1455, coordY: 395}
				   , {name: "4SocketArmorTopRightSocket", x: 293, y: 172, coordX: 1560, coordY: 275}
				   , {name: "4SocketArmorTopLeftSocket", x: 343, y: 172, coordX: 1615, coordY: 275}
				   , {name: "4SocketArmorBottomRightSocket", x: 293, y: 235, coordX: 1560, coordY: 333}
				   , {name: "4SocketArmorBottomLeftSocket", x: 343, y: 235, coordX: 1615, coordY: 333}
				   , {name: "6SocketArmorTopRightSocket", x: 281, y: 140, coordX: 1560, coordY: 250}
				   , {name: "6SocketArmorTopLeftSocket", x: 355, y: 140, coordX: 1615, coordY: 250}
				   , {name: "6SocketArmorMiddleRightSocket", x: 281, y: 203, coordX: 1560, coordY: 305} ]

	SocketList3 := [ {name: "6SocketArmorMiddleLeftSocket", x: 355, y: 203, coordX: 1615, coordY: 305}
				   , {name: "6SocketArmorBottomRightSocket", x: 281, y: 266, coordX: 1560, coordY: 360}
				   , {name: "6SocketArmorBottomLeftSocket", x: 355, y: 266, coordX: 1615, coordY: 360}
				   , {name: "1SocketArmorMiddleSocket", x: 317, y: 204, coordX: 1585, coordY: 305}
				   , {name: "BootsTopCenterSocket", x: 411, y: 257, coordX: 1690, coordY: 370}
				   , {name: "BootsTopLeftSocket", x: 484, y: 257, coordX: 1740, coordY: 370}
				   , {name: "BootsBottomCenterSocket", x: 411, y: 332, coordX: 1690, coordY: 420}
				   , {name: "BootsBottomLeftSocket", x: 484, y: 332, coordX: 1740, coordY: 420}
				   , {name: "BootsMiddleCenterSocket", x: 411, y: 294, coordX: 1690, coordY: 395}
				   , {name: "BootsMiddleLeftSocket", x: 484, y: 294, coordX: 1740, coordY: 395}
				   , {name: "BootsMiddleSocket", x: 447, y: 294, coordX: 1715, coordY: 395}
				   , {name: "RightFingerSocket", x: 213, y: 202, coordX: 1485, coordY: 305}
				   , {name: "LeftFingerSocket", x: 421, y: 202, coordX: 1690, coordY: 305}
				   , {name: "AmuletSocket", x: 421, y: 137, coordX: 1690, coordY: 245}
				   , {name: "BeltRightSocket", x: 293, y: 320, coordX: 1565, coordY: 420}
				   , {name: "BeltCenterSocket", x: 317, y: 320, coordX: 1585, coordY: 420}
				   , {name: "BeltLeftSocket", x: 343, y: 320, coordX: 1605, coordY: 420}
				   , {name: "Flask1", x: 218, y: 410, coordX: 1487, coordY: 515}
				   , {name: "Flask2", x: 270, y: 410, coordX: 1540, coordY: 515}
				   , {name: "Flask3", x: 322, y: 410, coordX: 1592, coordY: 515}
				   , {name: "Flask4", x: 375, y: 410, coordX: 1645, coordY: 515}
				   , {name: "Flask5", x: 427, y: 410, coordX: 1697, coordY: 515} ]
return

LoadScanSettings:
    IniRead, ScreenCapturePos, UnrapeKitConfig.ini, ScanLangList, ScreenCapturePos, %A_Space%
    IniRead, SaveHotkey, UnrapeKitConfig.ini, ScanLangList, SaveHotkey, %A_Space%
    IniRead, SaveAsHotkey, UnrapeKitConfig.ini, ScanLangList, SaveAsHotkey, %A_Space%
    IniRead, CloseHotkey, UnrapeKitConfig.ini, ScanLangList, CloseHotkey, %A_Space%
    IniRead, YesHotkey, UnrapeKitConfig.ini, ScanLangList, YesHotkey, %A_Space%
    IniRead, AddressBarHotkey, UnrapeKitConfig.ini, ScanLangList, AddressBarHotkey, %A_Space%
    IniRead, SaveAsWindowName, UnrapeKitConfig.ini, ScanLangList, SaveAsWindowName, %A_Space%
    IniRead, ConfirmSaveAsWindowName, UnrapeKitConfig.ini, ScanLangList, ConfirmSaveAsWindowName, %A_Space%
    IniRead, SnippingToolWindowName, UnrapeKitConfig.ini, ScanLangList, SnippingToolWindowName, %A_Space%
    IniRead, SnippingToolPath, UnrapeKitConfig.ini, ScanLangList, SnippingToolPath, %A_Space%
return

ScanReadLoad:
	Loop, %ScanCount% {
		IniRead, Name%A_Index%, UnrapeKitConfig.ini, Names, Name%A_Index%, %A_Space%
		IniRead, IconToggle%A_Index%, UnrapeKitConfig.ini, IconToggle, IconToggle%A_Index%, %A_Space%
		IniRead, Line%A_Index%, UnrapeKitConfig.ini, Lines, Line%A_Index%, %A_Space%
		NameN:= % Name%A_Index%
		IconToggleN:= % IconToggle%A_Index%
		LineN:= % Line%A_Index%
		CaptureName%A_Index%:= % Name%A_Index% "" Line%A_Index%
		IniRead, %NameN%X, UnrapeKitConfig.ini, SpellCoordinates, %NameN%X, %A_Space%
		IniRead, %NameN%Y, UnrapeKitConfig.ini, SpellCoordinates, %NameN%Y, %A_Space%
	}
return

WriteScanSettings:
    IniWrite, %SaveHotkey%, UnrapeKitConfig.ini, ScanLangList, SaveHotkey
    IniWrite, %SaveAsHotkey%, UnrapeKitConfig.ini, ScanLangList, SaveAsHotkey
    IniWrite, %CloseHotkey%, UnrapeKitConfig.ini, ScanLangList, CloseHotkey
    IniWrite, %YesHotkey%, UnrapeKitConfig.ini, ScanLangList, YesHotkey
    IniWrite, %AddressBarHotkey%, UnrapeKitConfig.ini, ScanLangList, AddressBarHotkey
    IniWrite, %SaveAsWindowName%, UnrapeKitConfig.ini, ScanLangList, SaveAsWindowName
    IniWrite, %ConfirmSaveAsWindowName%, UnrapeKitConfig.ini, ScanLangList, ConfirmSaveAsWindowName
    IniWrite, %SnippingToolWindowName%, UnrapeKitConfig.ini, ScanLangList, SnippingToolWindowName
    IniWrite, %SnippingToolPath%, UnrapeKitConfig.ini, ScanLangList, SnippingToolPath
return

Type1Load:
	IniRead, T1%Hk%, UnrapeKitConfig.ini, triggeredCount, T1%Hk%
	If (T1%Hk% = 1) {
		IniRead, Hkey%Hk%Spell1, UnrapeKitConfig.ini, HotkeySpells, Hkey%Hk%Spell1, %A_Space%
		IniRead, Hkey%Hk%Spell2, UnrapeKitConfig.ini, HotkeySpells, Hkey%Hk%Spell2, %A_Space%
		Spell1:= Hkey%Hk%Spell1
		Spell2:= Hkey%Hk%Spell2
		IniRead, %Spell1%X, UnrapeKitConfig.ini, SpellCoordinates, %Spell1%X, %A_Space%
		IniRead, %Spell1%Y, UnrapeKitConfig.ini, SpellCoordinates, %Spell1%Y, %A_Space%
		IniRead, %Spell2%X, UnrapeKitConfig.ini, SpellCoordinates, %Spell2%X, %A_Space%
		IniRead, %Spell2%Y, UnrapeKitConfig.ini, SpellCoordinates, %Spell2%Y, %A_Space%
		TrigN:= 3
		IniRead, TriggeredCount%Hk%, UnrapeKitConfig.ini, TriggeredCount, TriggeredCount%Hk%, %A_Space%
		IniRead, ScanDelay%Hk%, UnrapeKitConfig.ini, Delay, ScanDelay%Hk%, %A_Space%
		IniRead, T1Cooldown%Hk%, UnrapeKitConfig.ini, Delay, T1Cooldown%Hk%, %A_Space%
		Loop, % TriggeredCount%Hk% {
			IniRead, TriggerToggle%TrigN%_%Hk%, UnrapeKitConfig.ini, TriggeredToggle, TriggerToggle%TrigN%_%Hk%, %A_Space%
			IniRead, Hkey%Hk%Spell%TrigN%, UnrapeKitConfig.ini, TriggeredSpells, Hkey%Hk%Spell%TrigN%, %A_Space%
			Spell1:= Hkey%Hk%Spell%TrigN%
			IniRead, %Spell1%X, UnrapeKitConfig.ini, SpellCoordinates, %Spell1%X, %A_Space%
			IniRead, %Spell1%Y, UnrapeKitConfig.ini, SpellCoordinates, %Spell1%Y, %A_Space%
			Iniread, Hkey%Hk%T1Cooldown%TrigN%, UnrapeKitConfig.ini, TriggeredSpells, Hkey%Hk%T1Cooldown%TrigN%, %A_Space%
		}
	}

	If (T1%Hk% = 2) {
		TrigN:= 1
		Iniread, TriggeredCount%Hk%, UnrapeKitConfig.ini, triggeredCount, TriggeredCount%Hk%
		IniRead, ScanDelay%Hk%, UnrapeKitConfig.ini, Delay, ScanDelay%Hk%, %A_Space%
		Iniread, Hkey%Hk%Key%TrigN%, UnrapeKitConfig.ini, HotkeyKey, Hkey%Hk%Key%TrigN%
		IniRead, Hkey%Hk%T1Cooldown%TrigN%, UnrapeKitConfig.ini, Delay, Hkey%Hk%T1Cooldown%TrigN%, %A_Space%
		TrigN:= 2
		Loop, % TriggeredCount%Hk% {
			Iniread, Hkey%Hk%Key%TrigN%, UnrapeKitConfig.ini, TriggeredSpells, Hkey%Hk%Key%TrigN%
			Iniread, Hkey%Hk%T1Cooldown%TrigN%, UnrapeKitConfig.ini, TriggeredSpells, Hkey%Hk%T1Cooldown%TrigN%, %A_Space%
			TrigN+=1
		}
	}

	If (T1%Hk% = 3) {
		TrigN:= 1
		Iniread, TriggeredCount%Hk%, UnrapeKitConfig.ini, triggeredCount, TriggeredCount%Hk%
		Iniread, Hkey%Hk%Spell%TrigN%, UnrapeKitConfig.ini, HotkeySpells, Hkey%Hk%Spell%TrigN%
		IniRead, ScanDelay%Hk%, UnrapeKitConfig.ini, Delay, ScanDelay%Hk%, %A_Space%
		Iniread, Hkey%Hk%Key%TrigN%, UnrapeKitConfig.ini, HotkeyKey, Hkey%Hk%Key%TrigN%
		Iniread, HKey%Hk%CtrlKeyToggle, UnrapeKitConfig.ini, HotkeyKey, HKey%Hk%CtrlKeyToggle
		IniRead, Hkey%Hk%T1Cooldown%TrigN%, UnrapeKitConfig.ini, Delay, Hkey%Hk%T1Cooldown%TrigN%, %A_Space%
		TrigN:= 2
		Loop, % TriggeredCount%Hk% {
			Iniread, HHkey%Hk%Spell%TrigN%, UnrapeKitConfig.ini, HotkeySpells, Hkey%Hk%Spell%TrigN%
			Iniread, Hkey%Hk%Key%TrigN%, UnrapeKitConfig.ini, HotkeyKey, Hkey%Hk%Key%TrigN%
			Iniread, HKey%HkT1%CtrlKeyToggle, UnrapeKitConfig.ini, HotkeyKey, HKey%HkT1%CtrlKeyToggle
			Iniread, Hkey%Hk%T1Cooldown%TrigN%, UnrapeKitConfig.ini, TriggeredSpells, Hkey%Hk%T1Cooldown%TrigN%, %A_Space%
			TrigN+=1
		}
	}
Return

Type2Load:
	IniRead, Hkey%Hk%Spell1, UnrapeKitConfig.ini, HotkeySpells, Hkey%Hk%Spell1, %A_Space%
	IniRead, Hkey%Hk%Spell2, UnrapeKitConfig.ini, HotkeySpells, Hkey%Hk%Spell2, %A_Space%
	IniRead, Type2MoveToggleHotkey%Hk%, UnrapeKitConfig.ini, HotkeySpells, Type2MoveToggleHotkey%Hk%, %A_Space%
	Spell1:= Hkey%Hk%Spell1
	Spell2:= Hkey%Hk%Spell2
	IniRead, %Spell1%X, UnrapeKitConfig.ini, SpellCoordinates, %Spell1%X, %A_Space%
	IniRead, %Spell1%Y, UnrapeKitConfig.ini, SpellCoordinates, %Spell1%Y, %A_Space%
	IniRead, %Spell2%X, UnrapeKitConfig.ini, SpellCoordinates, %Spell2%X, %A_Space%
	IniRead, %Spell2%Y, UnrapeKitConfig.ini, SpellCoordinates, %Spell2%Y, %A_Space%
return

Type3Load:
	IniRead, Hkey%Hk%Spell1, UnrapeKitConfig.ini, HotkeySpells, Hkey%Hk%Spell1, %A_Space%
	IniRead, Hkey%Hk%Spell2, UnrapeKitConfig.ini, HotkeySpells, Hkey%Hk%Spell2, %A_Space%
	IniRead, Type3Cast1ToggleHotkey%Hk%, UnrapeKitConfig.ini, HotkeySpells, Type3Cast1ToggleHotkey%Hk%, %A_Space%
	IniRead, Type3Cast2ToggleHotkey%Hk%, UnrapeKitConfig.ini, HotkeySpells, Type3Cast2ToggleHotkey%Hk%, %A_Space%
	Spell1:= Hkey%Hk%Spell1
	Spell2:= Hkey%Hk%Spell2
	IniRead, %Spell1%X, UnrapeKitConfig.ini, SpellCoordinates, %Spell1%X, %A_Space%
	IniRead, %Spell1%Y, UnrapeKitConfig.ini, SpellCoordinates, %Spell1%Y, %A_Space%
	IniRead, %Spell2%X, UnrapeKitConfig.ini, SpellCoordinates, %Spell2%X, %A_Space%
	IniRead, %Spell2%Y, UnrapeKitConfig.ini, SpellCoordinates, %Spell2%Y, %A_Space%
return

Type4Load:
	IniRead, Hkey%Hk%Spell1T4, UnrapeKitConfig.ini, HotkeySpells, Hkey%Hk%Spell1T4, %A_Space%
	Spell1:= Hkey%Hk%Spell1T4
	IniRead, %Spell1%X, UnrapeKitConfig.ini, SpellCoordinates, %Spell1%X, %A_Space%
	IniRead, %Spell1%Y, UnrapeKitConfig.ini, SpellCoordinates, %Spell1%Y, %A_Space%
	IniRead, %Spell2%X, UnrapeKitConfig.ini, SpellCoordinates, %Spell2%X, %A_Space%
	IniRead, %Spell2%Y, UnrapeKitConfig.ini, SpellCoordinates, %Spell2%Y, %A_Space%
return

Type5Load:
	IniRead, GemSwapTab_%Hk%, UnrapeKitConfig.ini, SwapTabs, GemSwapTab_%Hk%
	IniRead, GemSwap1Hotkey%Hk%_X, UnrapeKitConfig.ini, GemSwap1Coordinates, GemSwap1Hotkey%Hk%_X, %A_Space%
	IniRead, GemSwap1Hotkey%Hk%_Y, UnrapeKitConfig.ini, GemSwap1Coordinates, GemSwap1Hotkey%Hk%_Y, %A_Space%
	IniRead, GemSwap2Hotkey%Hk%_X, UnrapeKitConfig.ini, GemSwap2Coordinates, GemSwap2Hotkey%Hk%_X, %A_Space%
	IniRead, GemSwap2Hotkey%Hk%_Y, UnrapeKitConfig.ini, GemSwap2Coordinates, GemSwap2Hotkey%Hk%_Y, %A_Space%
	IniRead, GemSwap2AltHotkey%Hk%_X, UnrapeKitConfig.ini, GemSwap2Coordinates, GemSwap2AltHotkey%Hk%_X, %A_Space%
	IniRead, GemSwap2AltHotkey%Hk%_Y, UnrapeKitConfig.ini, GemSwap2Coordinates, GemSwap2AltHotkey%Hk%_Y, %A_Space%
return

Type6Load:
	IniRead, EquipSwapTab_%Hk%, UnrapeKitConfig.ini, SwapTabs, EquipSwapTab_%Hk%, %A_Space%
	IniRead, EquipSwap1Hotkey%Hk%_X, UnrapeKitConfig.ini, EquipSwap1Coordinates, EquipSwap1Hotkey%Hk%_X, %A_Space%
	IniRead, EquipSwap1Hotkey%Hk%_Y, UnrapeKitConfig.ini, EquipSwap1Coordinates, EquipSwap1Hotkey%Hk%_Y, %A_Space%
	IniRead, EquipSwap2Hotkey%Hk%_X, UnrapeKitConfig.ini, EquipSwap2Coordinates, EquipSwap2Hotkey%Hk%_X, %A_Space%
	IniRead, EquipSwap2Hotkey%Hk%_Y, UnrapeKitConfig.ini, EquipSwap2Coordinates, EquipSwap2Hotkey%Hk%_Y, %A_Space%
	IniRead, EquipSwap2AltHotkey%Hk%_X, UnrapeKitConfig.ini, EquipSwap2Coordinates, EquipSwap2AltHotkey%Hk%_X, %A_Space%
	IniRead, EquipSwap2AltHotkey%Hk%_Y, UnrapeKitConfig.ini, EquipSwap2Coordinates, EquipSwap2AltHotkey%Hk%_Y, %A_Space%
return

Type7Load:
	IniRead, Hkey%Hk%Iterations, UnrapeKitConfig.ini, Type7Hotkey%Hk%, Hkey%Hk%Iterations, %A_Space%
	IniRead, GemSwapTab_%Hk%, UnrapeKitConfig.ini, SwapTabs, GemSwapTab_%Hk%, %A_Space%
	IniRead, EquipSwapTab_%Hk%, UnrapeKitConfig.ini, SwapTabs, EquipSwapTab_%Hk%, %A_Space%
	T7:= 1
	Loop, % Hkey%Hk%Iterations {
		IniRead, Hkey%Hk%DelayIteration%T7%, UnrapeKitConfig.ini, Type7Delay, Hkey%Hk%DelayIteration%T7%, %A_Space%
		IniRead, Hkey%Hk%Iteration%T7%Toggle, UnrapeKitConfig.ini, Type7Hotkey%Hk%, Hkey%Hk%Iteration%T7%Toggle, %A_Space%
		IniRead, Hkey%Hk%Iteration%T7%, UnrapeKitConfig.ini, Type7Hotkey%Hk%, Hkey%Hk%Iteration%T7%, %A_Space%
		IniRead, Hkey%Hk%SpellIteration%T7%, UnrapeKitConfig.ini, Type7HotkeySpells, Hkey%Hk%SpellIteration%T7%, %A_Space%
		IniRead, Hkey%Hk%KeyIteration%T7%, UnrapeKitConfig.ini, Type7HotkeyKey, Hkey%Hk%KeyIteration%T7%, %A_Space%
		IniRead, Hkey%Hk%SendIteration%T7%, UnrapeKitConfig.ini, Type7Send, Hkey%Hk%SendIteration%T7%, %A_Space%
		IniRead, Hkey%Hk%MouseXPosIteration%T7%, UnrapeKitConfig.ini, Type7MousePos, Hkey%Hk%MouseXPosIteration%T7%, %A_Space%
		IniRead, Hkey%Hk%MouseYPosIteration%T7%, UnrapeKitConfig.ini, Type7MousePos, Hkey%Hk%MouseYPosIteration%T7%, %A_Space%
		IniRead, Hkey%Hk%GoMousePosIteration%T7%, UnrapeKitConfig.ini, Type7MousePos, Hkey%Hk%GoMousePosIteration%T7%, %A_Space%
		IniRead, Hkey%Hk%GetMousePosToggleIteration%T7%, UnrapeKitConfig.ini, Type7MousePos, Hkey%Hk%GetMousePosToggleIteration%T7%, %A_Space%
		IniRead, ScanCoordinatesHotkey%Hk%Iteration%T7%_L, UnrapeKitConfig.ini, ScanType7, ScanCoordinatesHotkey%Hk%Iteration%T7%_L, %A_Space%
		IniRead, ScanCoordinatesHotkey%Hk%Iteration%T7%_T, UnrapeKitConfig.ini, ScanType7, ScanCoordinatesHotkey%Hk%Iteration%T7%_T, %A_Space%
		IniRead, ScanCoordinatesHotkey%Hk%Iteration%T7%_R, UnrapeKitConfig.ini, ScanType7, ScanCoordinatesHotkey%Hk%Iteration%T7%_R, %A_Space%
		IniRead, ScanCoordinatesHotkey%Hk%Iteration%T7%_B, UnrapeKitConfig.ini, ScanType7, ScanCoordinatesHotkey%Hk%Iteration%T7%_B, %A_Space%
		IniRead, ImageNameHotkey%Hk%Iteration%T7%, UnrapeKitConfig.ini, ScanType7, ImageNameHotkey%Hk%Iteration%T7%, %A_Space%
		IniRead, ShadeVariationHotkey%Hk%Iteration%T7%, UnrapeKitConfig.ini, ScanType7, ShadeVariationHotkey%Hk%Iteration%T7%, %A_Space%
		IniRead, GemSwap1Hotkey%Hk%Iteration%T7%_X, UnrapeKitConfig.ini, GemSwap1CoordinatesType7, GemSwap1Hotkey%Hk%Iteration%T7%_X, %A_Space%
		IniRead, GemSwap1Hotkey%Hk%Iteration%T7%_Y, UnrapeKitConfig.ini, GemSwap1CoordinatesType7, GemSwap1Hotkey%Hk%Iteration%T7%_Y, %A_Space%
		IniRead, GemSwap2Hotkey%Hk%Iteration%T7%_X, UnrapeKitConfig.ini, GemSwap2CoordinatesType7, GemSwap2Hotkey%Hk%Iteration%T7%_X, %A_Space%
		IniRead, GemSwap2Hotkey%Hk%Iteration%T7%_Y, UnrapeKitConfig.ini, GemSwap2CoordinatesType7, GemSwap2Hotkey%Hk%Iteration%T7%_Y, %A_Space%
		IniRead, GemSwap2AltHotkey%Hk%Iteration%T7%_X, UnrapeKitConfig.ini, GemSwap2CoordinatesType7, GemSwap2AltHotkey%Hk%Iteration%T7%_X, %A_Space%
		IniRead, GemSwap2AltHotkey%Hk%Iteration%T7%_Y, UnrapeKitConfig.ini, GemSwap2CoordinatesType7, GemSwap2AltHotkey%Hk%Iteration%T7%_Y, %A_Space%
		IniRead, EquipSwap1Hotkey%Hk%Iteration%T7%_X, UnrapeKitConfig.ini, EquipSwap1CoordinatesType7, EquipSwap1Hotkey%Hk%Iteration%T7%_X, %A_Space%
		IniRead, EquipSwap1Hotkey%Hk%Iteration%T7%_Y, UnrapeKitConfig.ini, EquipSwap1CoordinatesType7, EquipSwap1Hotkey%Hk%Iteration%T7%_Y, %A_Space%
		IniRead, EquipSwap2Hotkey%Hk%Iteration%T7%_X, UnrapeKitConfig.ini, EquipSwap2CoordinatesType7, EquipSwap2Hotkey%Hk%Iteration%T7%_X, %A_Space%
		IniRead, EquipSwap2Hotkey%Hk%Iteration%T7%_Y, UnrapeKitConfig.ini, EquipSwap2CoordinatesType7, EquipSwap2Hotkey%Hk%Iteration%T7%_Y, %A_Space%
		IniRead, EquipSwap2AltHotkey%Hk%Iteration%T7%_X, UnrapeKitConfig.ini, EquipSwap2CoordinatesType7, EquipSwap2AltHotkey%Hk%Iteration%T7%_X, %A_Space%
		IniRead, EquipSwap2AltHotkey%Hk%Iteration%T7%_Y, UnrapeKitConfig.ini, EquipSwap2CoordinatesType7, EquipSwap2AltHotkey%Hk%Iteration%T7%_Y, %A_Space%
		IniRead, KeyX_%Hk%Iteration%T7%, UnrapeKitConfig.ini, Type7KeyCoordinates, KeyX_%Hk%Iteration%T7%, %A_Space%
		IniRead, KeyY_%Hk%Iteration%T7%, UnrapeKitConfig.ini, type7KeyCoordinates, KeyY_%Hk%Iteration%T7%, %A_Space%
		T7 += 1
	}
	T7:= 1
return

Type7Write:
	IniWrite, % Hkey%Hk%Iterations, UnrapeKitConfig.ini, Type7Hotkey%Hk%, Hkey%Hk%Iterations, %A_Space%
	IniWrite, % GemSwapTab_%Hk%, UnrapeKitConfig.ini, SwapTabs, GemSwapTab_%Hk%, %A_Space%
	IniWrite, % EquipSwapTab_%Hk%, UnrapeKitConfig.ini, SwapTabs, EquipSwapTab_%Hk%, %A_Space%
	T7:= 1
	Loop, % Hkey%Hk%Iterations {
		IniWrite, % Hkey%Hk%DelayIteration%T7%, UnrapeKitConfig.ini, Type7Delay, Hkey%Hk%DelayIteration%T7%, %A_Space%
		IniWrite, % Hkey%Hk%Iteration%T7%Toggle, UnrapeKitConfig.ini, Type7Hotkey%Hk%, Hkey%Hk%Iteration%T7%Toggle, %A_Space%
		IniWrite, % Hkey%Hk%Iteration%T7%, UnrapeKitConfig.ini, Type7Hotkey%Hk%, Hkey%Hk%Iteration%T7%, %A_Space%
		IniWrite, % Hkey%Hk%SpellIteration%T7%, UnrapeKitConfig.ini, Type7HotkeySpells, Hkey%Hk%SpellIteration%T7%, %A_Space%
		IniWrite, % Hkey%Hk%KeyIteration%T7%, UnrapeKitConfig.ini, Type7HotkeyKey, Hkey%Hk%KeyIteration%T7%, %A_Space%
		IniWrite, % Hkey%Hk%SendIteration%T7%, UnrapeKitConfig.ini, Type7Send, Hkey%Hk%SendIteration%T7%, %A_Space%
		IniWrite, % Hkey%Hk%MouseXPosIteration%T7%, UnrapeKitConfig.ini, Type7MousePos, Hkey%Hk%MouseXPosIteration%T7%, %A_Space%
		IniWrite, % Hkey%Hk%MouseYPosIteration%T7%, UnrapeKitConfig.ini, Type7MousePos, Hkey%Hk%MouseYPosIteration%T7%, %A_Space%
		IniWrite, % Hkey%Hk%GoMousePosIteration%T7%, UnrapeKitConfig.ini, Type7MousePos, Hkey%Hk%GoMousePosIteration%T7%, %A_Space%
		IniWrite, % Hkey%Hk%GetMousePosToggleIteration%T7%, UnrapeKitConfig.ini, Type7MousePos, Hkey%Hk%GetMousePosToggleIteration%T7%, %A_Space%
		IniWrite, % ScanCoordinatesHotkey%Hk%Iteration%T7%_L, UnrapeKitConfig.ini, ScanType7, ScanCoordinatesHotkey%Hk%Iteration%T7%_L, %A_Space%
		IniWrite, % ScanCoordinatesHotkey%Hk%Iteration%T7%_T, UnrapeKitConfig.ini, ScanType7, ScanCoordinatesHotkey%Hk%Iteration%T7%_T, %A_Space%
		IniWrite, % ScanCoordinatesHotkey%Hk%Iteration%T7%_R, UnrapeKitConfig.ini, ScanType7, ScanCoordinatesHotkey%Hk%Iteration%T7%_R, %A_Space%
		IniWrite, % ScanCoordinatesHotkey%Hk%Iteration%T7%_B, UnrapeKitConfig.ini, ScanType7, ScanCoordinatesHotkey%Hk%Iteration%T7%_B, %A_Space%
		IniWrite, % ImageNameHotkey%Hk%Iteration%T7%, UnrapeKitConfig.ini, ScanType7, ImageNameHotkey%Hk%Iteration%T7%, %A_Space%
		IniWrite, % ShadeVariationHotkey%Hk%Iteration%T7%, UnrapeKitConfig.ini, ScanType7, ShadeVariationHotkey%Hk%Iteration%T7%, %A_Space%
		IniWrite, % GemSwap1Hotkey%Hk%Iteration%T7%_X, UnrapeKitConfig.ini, GemSwap1CoordinatesType7, GemSwap1Hotkey%Hk%Iteration%T7%_X, %A_Space%
		IniWrite, % GemSwap1Hotkey%Hk%Iteration%T7%_Y, UnrapeKitConfig.ini, GemSwap1CoordinatesType7, GemSwap1Hotkey%Hk%Iteration%T7%_Y, %A_Space%
		IniWrite, % GemSwap2Hotkey%Hk%Iteration%T7%_X, UnrapeKitConfig.ini, GemSwap2CoordinatesType7, GemSwap2Hotkey%Hk%Iteration%T7%_X, %A_Space%
		IniWrite, % GemSwap2Hotkey%Hk%Iteration%T7%_Y, UnrapeKitConfig.ini, GemSwap2CoordinatesType7, GemSwap2Hotkey%Hk%Iteration%T7%_Y, %A_Space%
		IniWrite, % GemSwap2AltHotkey%Hk%Iteration%T7%_X, UnrapeKitConfig.ini, GemSwap2CoordinatesType7, GemSwap2AltHotkey%Hk%Iteration%T7%_X, %A_Space%
		IniWrite, % GemSwap2AltHotkey%Hk%Iteration%T7%_Y, UnrapeKitConfig.ini, GemSwap2CoordinatesType7, GemSwap2AltHotkey%Hk%Iteration%T7%_Y, %A_Space%
		IniWrite, % EquipSwap1Hotkey%Hk%Iteration%T7%_X, UnrapeKitConfig.ini, EquipSwap1CoordinatesType7, EquipSwap1Hotkey%Hk%Iteration%T7%_X, %A_Space%
		IniWrite, % EquipSwap1Hotkey%Hk%Iteration%T7%_Y, UnrapeKitConfig.ini, EquipSwap1CoordinatesType7, EquipSwap1Hotkey%Hk%Iteration%T7%_Y, %A_Space%
		IniWrite, % EquipSwap2Hotkey%Hk%Iteration%T7%_X, UnrapeKitConfig.ini, EquipSwap2CoordinatesType7, EquipSwap2Hotkey%Hk%Iteration%T7%_X, %A_Space%
		IniWrite, % EquipSwap2Hotkey%Hk%Iteration%T7%_Y, UnrapeKitConfig.ini, EquipSwap2CoordinatesType7, EquipSwap2Hotkey%Hk%Iteration%T7%_Y, %A_Space%
		IniWrite, % EquipSwap2AltHotkey%Hk%Iteration%T7%_X, UnrapeKitConfig.ini, EquipSwap2CoordinatesType7, EquipSwap2AltHotkey%Hk%Iteration%T7%_X, %A_Space%
		IniWrite, % EquipSwap2AltHotkey%Hk%Iteration%T7%_Y, UnrapeKitConfig.ini, EquipSwap2CoordinatesType7, EquipSwap2AltHotkey%Hk%Iteration%T7%_Y, %A_Space%
		IniWrite, % KeyX_%Hk%Iteration%T7%, UnrapeKitConfig.ini, Type7KeyCoordinates, KeyX_%Hk%Iteration%T7%, %A_Space%
		IniWrite, % KeyY_%Hk%Iteration%T7%, UnrapeKitConfig.ini, type7KeyCoordinates, KeyY_%Hk%Iteration%T7%, %A_Space%
		T7 += 1
	}
	T7:= 1
return

Type7Write2:
	Loop, % Hkey%Hk%Iterations {
		IniWrite, % Hkey%Hk%Iteration%T7%, UnrapeKitConfig.ini, Type7Hotkey%Hk%, Hkey%Hk%Iteration%T7%
	}
return
