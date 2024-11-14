GemSwap1:
	Swap:= "GemSwap1"
	Gosub Swap
Return

GemSwap2:
	Swap:= "GemSwap2"
	Gosub Swap
return

EquipSwap1:
	Swap:= "EquipSwap1"
	GoSub Swap
Return

EquipSwap2:
	Swap:= "EquipSwap2"
	GoSub Swap
Return

Swap:
	Gosub LCAdd
	gosub SwapRead1
	gosub SwapRead2
	SysGet, SGW, 71
	GuiWidth:= 650
	GuiHeight:= 800
	If (Swap = "GemSwap2") {
		GemSwapTab:= 1
		Gui, Add, Tab2, w%GuiWidth% h%GuiHeight% AltSubmit vGemSwapTab_%Hk%, 1||2
		Gui, Tab, 1
	}
	If (Swap = "EquipSwap2") {
		EquipSwapTab:= 1
		Gui, Add, Tab2, w%GuiWidth% h%GuiHeight% AltSubmit vEquipSwapTab_%Hk%, 1||2
		Gui, Tab, 1
	}
	Gui, -0x80000 AlwaysOnTop
	Gui, Add, Picture, x0 y0, InventoryEquip.png
	Gui, Color, 0x050505

	gosub guiBuild
	gosub Radio1
	gosub Radio3

	Gui, Add, Button, x550 y772 w90 h20 gCancel, Reload
	Gui, Add, Button, x450 y772 w90 h20 gSwapCoord Default, Select
	If (Swap = "GemSwap2") OR (Swap = "EquipSwap2") {
		GuiWidth:= 650
		GuiHeight:= 800
		Button1X:= 40
		Button2X:= 460
		ButtonY:= 450
		gosub guibuild
		Gui, Tab, 2
		Gui, Add, Picture, x0 y0, InventoryEquip.png
		Gui, Color, 0x050505
		gosub Radio2
		Gui, Add, Button, x550 y772 w90 h20 gCancel, Reload
		Gui, Add, Button, x450 y772 w90 h20 gSwapCoord Default, Select
	}
	If (Swap = "GemSwap1")
		Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, % Hkey%Hk%Shortcut " - Equipped Gem Swap"
	If (Swap = "EquipSwap1")
		Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, % Hkey%Hk%Shortcut " - Equipment Swap"
	If (Swap = "GemSwap2")
		Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, % Hkey%Hk%Shortcut " - Equipped Gem Swap: Ctrl + Tab/PgUp/PgDn To Alternate Equipment"
	If (Swap = "EquipSwap2")
		Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, % Hkey%Hk%Shortcut " - Equipment Swap: Ctrl + Tab/PgUp/PgDn To Alternate Equipment"
Return

SwapCoord:
	Gui, Submit
	Gui, Destroy
	Gosub LCCoordAdd
	gosub SwapWrite1
	gosub SwapCoord1
	gosub SwapRouting
Return

LCAdd:
	L:= 1
	C:= 1
	Loop {
		IniRead, RadioL%L%C%C%%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RadioL%L%C%C%%Swap%Hotkey%Hk%
			If (C = 12) {
					If (L = 5)
						Break
				C:= 0
				L+= 1
			}
		C+= 1
	}
	C:= 1
	L:= 1
Return

LCCoordAdd:
	L:= 1
	C:= 1
	Loop {
			IniWrite, % RadioL%L%C%C%%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RadioL%L%C%C%%Swap%Hotkey%Hk%
			%Swap%Hotkey%Hk%_X:= 1240 + (C*53)
			%Swap%Hotkey%Hk%_Y:= 560 + (L*54)
		If (C = 12) {
				If (L = 5)
					Break
			C:= 0
			L+= 1
		}
		C+= 1
	}
	C:= 1
	L:= 1
Return

Radio1:
	Gui, Add, Radio, % "x29 y511 w13 h13 vRadioL1C1" Swap "Hotkey" Hk " Checked" RadioL1C1%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL1C2" Swap "Hotkey" Hk " Checked" RadioL1C2%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL1C3" Swap "Hotkey" Hk " Checked" RadioL1C3%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL1C4" Swap "Hotkey" Hk " Checked" RadioL1C4%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+40 w13 h13 vRadioL1C5" Swap "Hotkey" Hk " Checked" RadioL1C5%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL1C6" Swap "Hotkey" Hk " Checked" RadioL1C6%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL1C7" Swap "Hotkey" Hk " Checked" RadioL1C7%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL1C8" Swap "Hotkey" Hk " Checked" RadioL1C8%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+40 w13 h13 vRadioL1C9" Swap "Hotkey" Hk " Checked" RadioL1C9%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL1C10" Swap "Hotkey" Hk " Checked" RadioL1C10%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL1C11" Swap "Hotkey" Hk " Checked" RadioL1C11%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL1C12" Swap "Hotkey" Hk " Checked" RadioL1C12%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x29 y563 w13 h13 vRadioL2C1" Swap "Hotkey" Hk " Checked" RadioL2C1%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL2C2" Swap "Hotkey" Hk " Checked" RadioL2C2%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL2C3" Swap "Hotkey" Hk " Checked" RadioL2C3%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL2C4" Swap "Hotkey" Hk " Checked" RadioL2C4%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+40 w13 h13 vRadioL2C5" Swap "Hotkey" Hk " Checked" RadioL2C5%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL2C6" Swap "Hotkey" Hk " Checked" RadioL2C6%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL2C7" Swap "Hotkey" Hk " Checked" RadioL2C7%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL2C8" Swap "Hotkey" Hk " Checked" RadioL2C8%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+40 w13 h13 vRadioL2C9" Swap "Hotkey" Hk " Checked" RadioL2C9%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL2C10" Swap "Hotkey" Hk " Checked" RadioL2C10%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL2C11" Swap "Hotkey" Hk " Checked" RadioL2C11%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL2C12" Swap "Hotkey" Hk " Checked" RadioL2C12%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x29 y616 w13 h13 vRadioL3C1" Swap "Hotkey" Hk " Checked" RadioL3C1%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL3C2" Swap "Hotkey" Hk " Checked" RadioL3C2%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL3C3" Swap "Hotkey" Hk " Checked" RadioL3C3%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL3C4" Swap "Hotkey" Hk " Checked" RadioL3C4%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+40 w13 h13 vRadioL3C5" Swap "Hotkey" Hk " Checked" RadioL3C5%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL3C6" Swap "Hotkey" Hk " Checked" RadioL3C6%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL3C7" Swap "Hotkey" Hk " Checked" RadioL3C7%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL3C8" Swap "Hotkey" Hk " Checked" RadioL3C8%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+40 w13 h13 vRadioL3C9" Swap "Hotkey" Hk " Checked" RadioL3C9%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL3C10" Swap "Hotkey" Hk " Checked" RadioL3C10%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL3C11" Swap "Hotkey" Hk " Checked" RadioL3C11%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL3C12" Swap "Hotkey" Hk " Checked" RadioL3C12%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x29 y669 w13 h13 vRadioL4C1" Swap "Hotkey" Hk " Checked" RadioL4C1%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL4C2" Swap "Hotkey" Hk " Checked" RadioL4C2%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL4C3" Swap "Hotkey" Hk " Checked" RadioL4C3%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL4C4" Swap "Hotkey" Hk " Checked" RadioL4C4%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+40 w13 h13 vRadioL4C5" Swap "Hotkey" Hk " Checked" RadioL4C5%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL4C6" Swap "Hotkey" Hk " Checked" RadioL4C6%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL4C7" Swap "Hotkey" Hk " Checked" RadioL4C7%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL4C8" Swap "Hotkey" Hk " Checked" RadioL4C8%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+40 w13 h13 vRadioL4C9" Swap "Hotkey" Hk " Checked" RadioL4C9%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL4C10" Swap "Hotkey" Hk " Checked" RadioL4C10%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL4C11" Swap "Hotkey" Hk " Checked" RadioL4C11%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL4C12" Swap "Hotkey" Hk " Checked" RadioL4C12%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x29 y721 w13 h13 vRadioL5C1" Swap "Hotkey" Hk " Checked" RadioL1C5%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL5C2" Swap "Hotkey" Hk " Checked" RadioL5C2%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL5C3" Swap "Hotkey" Hk " Checked" RadioL5C3%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL5C4" Swap "Hotkey" Hk " Checked" RadioL5C4%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+40 w13 h13 vRadioL5C5" Swap "Hotkey" Hk " Checked" RadioL5C5%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL5C6" Swap "Hotkey" Hk " Checked" RadioL5C6%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL5C7" Swap "Hotkey" Hk " Checked" RadioL5C7%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL5C8" Swap "Hotkey" Hk " Checked" RadioL5C8%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+40 w13 h13 vRadioL5C9" Swap "Hotkey" Hk " Checked" RadioL5C9%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL5C10" Swap "Hotkey" Hk " Checked" RadioL5C10%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL5C11" Swap "Hotkey" Hk " Checked" RadioL5C11%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x+39 w13 h13 vRadioL5C12" Swap "Hotkey" Hk " Checked" RadioL5C12%Swap%Hotkey%Hk%
return

Radio2:
	Gui, Add, Radio, % "x72 Y50 w13 h13 v6SocketWeaponTopRightSocket" Swap "AltHotkey" Hk " Checked" 6SocketWeaponTopRightSocket%Swap%AltHotkey%Hk%
	Gui, Add, Radio, % "x149 y50 w13 h13 v6SocketWeaponTopCenterSocket" Swap "AltHotkey" Hk " Checked" 6SocketWeaponTopCenterSocket%Swap%AltHotkey%Hk%
	Gui, Add, Radio, % "x71 y125 w13 h13 v6SocketWeaponMiddleRightSocket" Swap "AltHotkey" Hk " Checked" 6SocketWeaponMiddleRightSocket%Swap%AltHotkey%Hk%
	Gui, Add, Radio, % "x149 y125 w13 h13 v6SocketWeaponMiddleCenterSocket" Swap "AltHotkey" Hk " Checked" 6SocketWeaponMiddleCenterSocket%Swap%AltHotkey%Hk%
	Gui, Add, Radio, % "x72 y200 w13 h13 v6SocketWeaponBottomRightSocket" Swap "AltHotkey" Hk " Checked" 6SocketWeaponBottomRightSocket%Swap%AltHotkey%Hk%
	Gui, Add, Radio, % "x149 y200 w13 h13 v6SocketWeaponBottomCenterSocket" Swap "AltHotkey" Hk " Checked" 6SocketWeaponBottomCenterSocket%Swap%AltHotkey%Hk%
	Gui, Add, Radio, % "x111 Y50 13 h13 vRightWeaponTopSocket" Swap "AltHotkey" Hk " Checked" RightWeaponTopSocket%Swap%AltHotkey%Hk%
	Gui, Add, Radio, % "x111 y125w13 h13 vRightWeaponMiddleSocket" Swap "AltHotkey" Hk " Checked" RightWeaponMiddleSocket%Swap%AltHotkey%Hk%
	Gui, Add, Radio, % "x111 y200w13 h13 vRightWeaponBottomSocket" Swap "AltHotkey" Hk " Checked" RightWeaponBottomSocket%Swap%AltHotkey%Hk%
	Gui, Add, Radio, % "x84 y88 w13 h13 vRightWeaponTopRightSocket" Swap "AltHotkey" Hk " Checked" RightWeaponTopRightSocket%Swap%AltHotkey%Hk%
	Gui, Add, Radio, % "x137 y88 w13 h13 vRightWeaponTopCenterSocket" Swap "AltHotkey" Hk " Checked" RightWeaponTopCenterSocket%Swap%AltHotkey%Hk%
	Gui, Add, Radio, % "x137 y163 w13 h13 vRightWeaponBottomCenterSocket" Swap "AltHotkey" Hk " Checked" RightWeaponBottomCenterSocket%Swap%AltHotkey%Hk%
	Gui, Add, Radio, % "x523 y50 w13 h13 vLeftHandTopSocket" Swap "AltHotkey" Hk " Checked" LeftHandTopSocket%Swap%AltHotkey%Hk%
	Gui, Add, Radio, % "x523 y125 w13 h13 vLeftHandMiddleSocket" Swap "AltHotkey" Hk " Checked" LeftHandMiddleSocket%Swap%AltHotkey%Hk%
	Gui, Add, Radio, % "x523 y200 w13 h13 vLeftHandBottomSocket" Swap "AltHotkey" Hk " Checked" LeftHandBottomSocket%Swap%AltHotkey%Hk%
	Gui, Add, Radio, % "x496 y88 w13 h13 vLeftHandTopCenterSocket" Swap "AltHotkey" Hk " Checked" LeftHandTopCenterSocket%Swap%AltHotkey%Hk%
	Gui, Add, Radio, % "x550 y88 w13 h13 vLeftHandTopLeftSocket" Swap "AltHotkey" Hk " Checked" LeftHandTopLeftSocket%Swap%AltHotkey%Hk%
	Gui, Add, Radio, % "x550 y163 w13 h13 vLeftHandBottomLeftSocket" Swap "AltHotkey" Hk " Checked" LeftHandBottomLeftSocket%Swap%AltHotkey%Hk%
	Gui, Add, Radio, % "x485 y125 w13 h13 vLeftHandMiddleCenterSocket" Swap "AltHotkey" Hk " Checked" LeftHandMiddleCenterSocket%Swap%AltHotkey%Hk%
	Gui, Add, Radio, % "x561 y125 w13 h13 vLeftHandMiddleLeftSocket" Swap "AltHotkey" Hk " Checked" LeftHandMiddleLeftSocket%Swap%AltHotkey%Hk%
return

Radio3:
	Gui, Add, Radio, % "x72 Y50 w13 h13 v6SocketWeaponTopRightSocket" Swap "Hotkey" Hk " Checked" 6SocketWeaponTopRightSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x149 y50 w13 h13 v6SocketWeaponTopCenterSocket" Swap "Hotkey" Hk " Checked" 6SocketWeaponTopCenterSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x71 y125 w13 h13 v6SocketWeaponMiddleRightSocket" Swap "Hotkey" Hk " Checked" 6SocketWeaponMiddleRightSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x149 y125 w13 h13 v6SocketWeaponMiddleCenterSocket" Swap "Hotkey" Hk " Checked" 6SocketWeaponMiddleCenterSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x72 y200 w13 h13 v6SocketWeaponBottomRightSocket" Swap "Hotkey" Hk " Checked" 6SocketWeaponBottomRightSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x149 y200 w13 h13 v6SocketWeaponBottomCenterSocket" Swap "Hotkey" Hk " Checked" 6SocketWeaponBottomCenterSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x111 Y50 w13 h13 vRightWeaponTopSocket" Swap "Hotkey" Hk " Checked" RightWeaponTopSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x111 y125 w13 h13 vRightWeaponMiddleSocket" Swap "Hotkey" Hk " Checked" RightWeaponMiddleSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x111 y200 w13 h13 vRightWeaponBottomSocket" Swap "Hotkey" Hk " Checked" RightWeaponBottomSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x84 y88 w13 h13 vRightWeaponTopRightSocket" Swap "Hotkey" Hk " Checked" RightWeaponTopRightSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x137 y88 w13 h13 vRightWeaponTopCenterSocket" Swap "Hotkey" Hk " Checked" RightWeaponTopCenterSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x137 y163 w13 h13 vRightWeaponBottomCenterSocket" Swap "Hotkey" Hk " Checked" RightWeaponBottomCenterSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x523 y50 w13 h13 vLeftHandTopSocket" Swap "Hotkey" Hk " Checked" LeftHandTopSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x523 y125 w13 h13 vLeftHandMiddleSocket" Swap "Hotkey" Hk " Checked" LeftHandMiddleSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x523 y200 w13 h13 vLeftHandBottomSocket" Swap "Hotkey" Hk " Checked" LeftHandBottomSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x496 y88 w13 h13 vLeftHandTopCenterSocket" Swap "Hotkey" Hk " Checked" LeftHandTopCenterSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x550 y88 w13 h13 vLeftHandTopLeftSocket" Swap "Hotkey" Hk " Checked" LeftHandTopLeftSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x550 y163 w13 h13 vLeftHandBottomLeftSocket" Swap "Hotkey" Hk " Checked" LeftHandBottomLeftSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x485 y125 w13 h13 vLeftHandMiddleCenterSocket" Swap "Hotkey" Hk " Checked" LeftHandMiddleCenterSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x561 y125 w13 h13 vLeftHandMiddleLeftSocket" Swap "Hotkey" Hk " Checked" LeftHandMiddleLeftSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x279 y21 w13 h13 vHelmetTopRightSocket" Swap "Hotkey" Hk " Checked" HelmetTopRightSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x355 y21 w13 h13 vHelmetTopLeftSocket" Swap "Hotkey" Hk " Checked" HelmetTopLeftSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x279 y97 w13 h13 vHelmetBottomRightSocket" Swap "Hotkey" Hk " Checked" HelmetBottomRightSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x355 y97 w13 h13 vHelmetBottomLeftSocket" Swap "Hotkey" Hk " Checked" HelmetBottomLeftSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x279 y57 w13 h13 vHelmetMiddleRightSocket" Swap "Hotkey" Hk " Checked" HelmetMiddleRightSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x355 y57 w13 h13 vHelmetMiddleLeftSocket" Swap "Hotkey" Hk " Checked" HelmetMiddleLeftSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x317 y57 w13 h13 vHelmetMiddleSocket" Swap "Hotkey" Hk " Checked" HelmetMiddleSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x151 y257 w13 h13 vGlovesTopRightSocket" Swap "Hotkey" Hk " Checked" GlovesTopRightSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x224 y257 w13 h13 vGlovesTopCenterSocket" Swap "Hotkey" Hk " Checked" GlovesTopCenterSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x151 y332 w13 h13 vGlovesBottomRightSocket" Swap "Hotkey" Hk " Checked" GlovesBottomRightSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x224 y332 w13 h13 vGlovesBottomCenterSocket" Swap "Hotkey" Hk " Checked" GlovesBottomCenterSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x151 y294 w13 h13 vGlovesMiddleRightSocket" Swap "Hotkey" Hk " Checked" GlovesMiddleRightSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x224 y294 w13 h13 vGlovesMiddleCenterSocket" Swap "Hotkey" Hk " Checked" GlovesMiddleCenterSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x187 y294 w13 h13 vGlovesMiddleSocket" Swap "Hotkey" Hk " Checked" GlovesMiddleSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x293 y172 w13 h13 v4SocketArmorTopRightSocket" Swap "Hotkey" Hk " Checked" 4SocketArmorTopRightSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x343 y172 w13 h13 v4SocketArmorTopLeftSocket" Swap "Hotkey" Hk " Checked" 4SocketArmorTopLeftSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x293 y235 w13 h13 v4SocketArmorBottomRightSocket" Swap "Hotkey" Hk " Checked" 4SocketArmorBottomRightSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x343 y235 w13 h13 v4SocketArmorBottomLeftSocket" Swap "Hotkey" Hk " Checked" 4SocketArmorBottomLeftSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x281 y140 w13 h13 v6SocketArmorTopRightSocket" Swap "Hotkey" Hk " Checked" 6SocketArmorTopRightSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x355 y140 w13 h13 v6SocketArmorTopLeftSocket" Swap "Hotkey" Hk " Checked" 6SocketArmorTopLeftSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x281 y203 w13 h13 v6SocketArmorMiddleRightSocket" Swap "Hotkey" Hk " Checked" 6SocketArmorMiddleRightSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x355 y203 w13 h13 v6SocketArmorMiddleLeftSocket" Swap "Hotkey" Hk " Checked" 6SocketArmorMiddleLeftSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x281 y266 w13 h13 v6SocketArmorBottomRightSocket" Swap "Hotkey" Hk " Checked" 6SocketArmorBottomRightSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x355 y266 w13 h13 v6SocketArmorBottomLeftSocket" Swap "Hotkey" Hk " Checked" 6SocketArmorBottomLeftSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x317 y204 w13 h13 v1SocketArmorMiddleSocket" Swap "Hotkey" Hk " Checked" 1SocketArmorMiddleSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x411 y257 w13 h13 vBootsTopCenterSocket" Swap "Hotkey" Hk " Checked" BootsTopCenterSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x484 y257 w13 h13 vBootsTopLeftSocket" Swap "Hotkey" Hk " Checked" BootsTopLeftSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x411 y332 w13 h13 vBootsBottomCenterSocket" Swap "Hotkey" Hk " Checked" BootsBottomCenterSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x484 y332 w13 h13 vBootsBottomLeftSocket" Swap "Hotkey" Hk " Checked" BootsBottomLeftSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x411 y294 w13 h13 vBootsMiddleCenterSocket" Swap "Hotkey" Hk " Checked" BootsMiddleCenterSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x484 y294 w13 h13 vBootsMiddleLeftSocket" Swap "Hotkey" Hk " Checked" BootsMiddleLeftSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x447 y294 w13 h13 vBootsMiddleSocket" Swap "Hotkey" Hk " Checked" BootsMiddleSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x213 Y202 w13 h13 vRightFingerSocket" Swap "Hotkey" Hk " Checked" RightFingerSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x421 y202 w13 h13 vLeftFingerSocket" Swap "Hotkey" Hk " Checked" LeftFingerSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x421 y137 w13 h13 vAmuletSocket" Swap "Hotkey" Hk " Checked" AmuletSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x293 y320 w13 h13 vBeltRightSocket" Swap "Hotkey" Hk " Checked" BeltRightSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x317 y320 w13 h13 vBeltCenterSocket" Swap "Hotkey" Hk " Checked" BeltCenterSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x343 y320 w13 h13 vBeltLeftSocket" Swap "Hotkey" Hk " Checked" BeltLeftSocket%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x218 y410 w13 h13 vFlask1" Swap "Hotkey" Hk " Checked" Flask1%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x270 y410 w13 h13 vFlask2" Swap "Hotkey" Hk " Checked" Flask2%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x322 y410 w13 h13 vFlask3" Swap "Hotkey" Hk " Checked" Flask3%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x375 y410 w13 h13 vFlask4" Swap "Hotkey" Hk " Checked" Flask4%Swap%Hotkey%Hk%
	Gui, Add, Radio, % "x427 y410 w13 h13 vFlask5" Swap "Hotkey" Hk " Checked" Flask5%Swap%Hotkey%Hk%
return

SwapRouting:
	If (Swap = "GemSwap2" AND GemSwapTab_%Hk% = 2) OR (Swap = "EquipSwap2" AND EquipSwapTab_%Hk% = 2) {
		gosub SwapWrite2
		gosub SwapCoord2
	}
	If (Swap = "GemSwap1") {
		IniWrite, % %Swap%Hotkey%Hk%_X, UnrapeKitConfig.ini, %Swap%Coordinates, %Swap%Hotkey%Hk%_X
		IniWrite, % %Swap%Hotkey%Hk%_Y, UnrapeKitConfig.ini, %Swap%Coordinates, %Swap%Hotkey%Hk%_Y
		Gosub GemSwap2
	Return
	}
	If (Swap = "EquipSwap1") {
		IniWrite, % %Swap%Hotkey%Hk%_X, UnrapeKitConfig.ini, %Swap%Coordinates, %Swap%Hotkey%Hk%_X
		IniWrite, % %Swap%Hotkey%Hk%_Y, UnrapeKitConfig.ini, %Swap%Coordinates, %Swap%Hotkey%Hk%_Y
		Gosub EquipSwap2
	Return
	}
	If (Swap = "GemSwap2" AND GemSwapTab_%Hk% = 1) {
		IniWrite, % GemSwapTab_%Hk%, UnrapeKitConfig.ini, SwapTabs, GemSwapTab_%Hk%
		IniWrite, % %Swap%Hotkey%Hk%_X, UnrapeKitConfig.ini, %Swap%Coordinates, %Swap%Hotkey%Hk%_X
		IniWrite, % %Swap%Hotkey%Hk%_Y, UnrapeKitConfig.ini, %Swap%Coordinates, %Swap%Hotkey%Hk%_Y
	Return
	}
	If (Swap = "EquipSwap2" AND EquipSwapTab_%Hk% = 1) {
		IniWrite, % EquipSwapTab_%Hk%, UnrapeKitConfig.ini, SwapTabs, EquipSwapTab_%Hk%
		IniWrite, % %Swap%Hotkey%Hk%_X, UnrapeKitConfig.ini, %Swap%Coordinates, %Swap%Hotkey%Hk%_X
		IniWrite, % %Swap%Hotkey%Hk%_Y, UnrapeKitConfig.ini, %Swap%Coordinates, %Swap%Hotkey%Hk%_Y
	Return
	}
	If (Swap = "GemSwap2" AND GemSwapTab_%Hk% = 2) {
		IniWrite, % GemSwapTab_%Hk%, UnrapeKitConfig.ini, SwapTabs, GemSwapTab_%Hk%
		IniWrite, % %Swap%AltHotkey%Hk%_X, UnrapeKitConfig.ini, %Swap%Coordinates, %Swap%AltHotkey%Hk%_X
		IniWrite, % %Swap%AltHotkey%Hk%_Y, UnrapeKitConfig.ini, %Swap%Coordinates, %Swap%AltHotkey%Hk%_Y
	Return
	}
	If (Swap = "EquipSwap2" AND EquipSwapTab_%Hk% = 2) {
		IniWrite, % EquipSwapTab_%Hk%, UnrapeKitConfig.ini, SwapTabs, EquipSwapTab_%Hk%
		IniWrite, % %Swap%AltHotkey%Hk%_X, UnrapeKitConfig.ini, %Swap%Coordinates, %Swap%AltHotkey%Hk%_X
		IniWrite, % %Swap%AltHotkey%Hk%_Y, UnrapeKitConfig.ini, %Swap%Coordinates, %Swap%AltHotkey%Hk%_Y
	Return
	}
return

SwapRead1:
	IniRead, 6SocketWeaponTopRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponTopRightSocket%Swap%Hotkey%Hk%
	IniRead, 6SocketWeaponTopCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponTopCenterSocket%Swap%Hotkey%Hk%
	IniRead, 6SocketWeaponMiddleRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponMiddleRightSocket%Swap%Hotkey%Hk%
	IniRead, 6SocketWeaponMiddleCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponMiddleCenterSocket%Swap%Hotkey%Hk%
	IniRead, 6SocketWeaponBottomRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponBottomRightSocket%Swap%Hotkey%Hk%
	IniRead, 6SocketWeaponBottomCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponBottomCenterSocket%Swap%Hotkey%Hk%
	IniRead, RightWeaponTopSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightWeaponTopSocket%Swap%Hotkey%Hk%
	IniRead, RightWeaponMiddleSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position,  RightWeaponMiddleSocket%Swap%Hotkey%Hk%
	IniRead, RightWeaponBottomSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightWeaponBottomSocket%Swap%Hotkey%Hk%
	IniRead, RightWeaponTopRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightWeaponTopRightSocket%Swap%Hotkey%Hk%
	IniRead, RightWeaponTopCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightWeaponTopCenterSocket%Swap%Hotkey%Hk%
	IniRead, RightWeaponBottomCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightWeaponBottomCenterSocket%Swap%Hotkey%Hk%
	IniRead, LeftHandTopSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandTopSocket%Swap%Hotkey%Hk%
	IniRead, LeftHandMiddleSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandMiddleSocket%Swap%Hotkey%Hk%
	IniRead, LeftHandBottomSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandBottomSocket%Swap%Hotkey%Hk%
	IniRead, LeftHandTopCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandTopCenterSocket%Swap%Hotkey%Hk%
	IniRead, LeftHandTopLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandTopLeftSocket%Swap%Hotkey%Hk%
	IniRead, LeftHandBottomLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandBottomLeftSocket%Swap%Hotkey%Hk%
	IniRead, LeftHandMiddleCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandMiddleCenterSocket%Swap%Hotkey%Hk%
	IniRead, LeftHandMiddleLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandMiddleLeftSocket%Swap%Hotkey%Hk%
	IniRead, HelmetTopRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, HelmetTopRightSocket%Swap%Hotkey%Hk%
	IniRead, HelmetTopLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, HelmetTopLeftSocket%Swap%Hotkey%Hk%
	IniRead, HelmetBottomRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, HelmetBottomRightSocket%Swap%Hotkey%Hk%
	IniRead, HelmetBottomLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, HelmetBottomLeftSocket%Swap%Hotkey%Hk%
	IniRead, HelmetMiddleRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, HelmetMiddleRightSocket%Swap%Hotkey%Hk%
	IniRead, HelmetMiddleLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, HelmetMiddleLeftSocket%Swap%Hotkey%Hk%
	IniRead, HelmetMiddleSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, HelmetMiddleSocket%Swap%Hotkey%Hk%
	IniRead, GlovesTopRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, GlovesTopRightSocket%Swap%Hotkey%Hk%
	IniRead, GlovesTopCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, GlovesTopCenterSocket%Swap%Hotkey%Hk%
	IniRead, GlovesBottomRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, GlovesBottomRightSocket%Swap%Hotkey%Hk%
	IniRead, GlovesBottomCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, GlovesBottomCenterSocket%Swap%Hotkey%Hk%
	IniRead, GlovesMiddleRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, GlovesMiddleRightSocket%Swap%Hotkey%Hk%
	IniRead, GlovesMiddleCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, GlovesMiddleCenterSocket%Swap%Hotkey%Hk%
	IniRead, GlovesMiddleSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, GlovesMiddleSocket%Swap%Hotkey%Hk%
	IniRead, 4SocketArmorTopRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 4SocketArmorTopRightSocket%Swap%Hotkey%Hk%
	IniRead, 4SocketArmorTopLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 4SocketArmorTopLeftSocket%Swap%Hotkey%Hk%
	IniRead, 4SocketArmorBottomRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 4SocketArmorBottomRightSocket%Swap%Hotkey%Hk%
	IniRead, 4SocketArmorBottomLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 4SocketArmorBottomLeftSocket%Swap%Hotkey%Hk%
	IniRead, 6SocketArmorTopRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketArmorTopRightSocket%Swap%Hotkey%Hk%
	IniRead, 6SocketArmorTopLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketArmorTopLeftSocket%Swap%Hotkey%Hk%
	IniRead, 6SocketArmorMiddleRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketArmorMiddleRightSocket%Swap%Hotkey%Hk%
	IniRead, 6SocketArmorMiddleLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketArmorMiddleLeftSocket%Swap%Hotkey%Hk%
	IniRead, 6SocketArmorBottomRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketArmorBottomRightSocket%Swap%Hotkey%Hk%
	IniRead, 6SocketArmorBottomLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketArmorBottomLeftSocket%Swap%Hotkey%Hk%
	IniRead, 1SocketArmorMiddleSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 1SocketArmorMiddleSocket%Swap%Hotkey%Hk%
	IniRead, BootsTopCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, BootsTopCenterSocket%Swap%Hotkey%Hk%
	IniRead, BootsTopLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, BootsTopLeftSocket%Swap%Hotkey%Hk%
	IniRead, BootsBottomCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, BootsBottomCenterSocket%Swap%Hotkey%Hk%
	IniRead, BootsBottomLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, BootsBottomLeftSocket%Swap%Hotkey%Hk%
	IniRead, BootsMiddleCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, BootsMiddleCenterSocket%Swap%Hotkey%Hk%
	IniRead, BootsMiddleLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, BootsMiddleLeftSocket%Swap%Hotkey%Hk%
	IniRead, BootsMiddleSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, BootsMiddleSocket%Swap%Hotkey%Hk%
	IniRead, RightFingerSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightFingerSocket%Swap%Hotkey%Hk%
	IniRead, LeftFingerSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftFingerSocket%Swap%Hotkey%Hk%
	IniRead, AmuletSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, AmuletSocket%Swap%Hotkey%Hk%
	IniRead, BeltRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, BeltRightSocket%Swap%Hotkey%Hk%
	IniRead, BeltCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, BeltCenterSocket%Swap%Hotkey%Hk%
	IniRead, BeltLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, BeltLeftSocket%Swap%Hotkey%Hk%
	IniRead, Flask1%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, Flask1%Swap%Hotkey%Hk%
	IniRead, Flask2%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, Flask2%Swap%Hotkey%Hk%
	IniRead, Flask3%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, Flask3%Swap%Hotkey%Hk%
	IniRead, Flask4%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, Flask4%Swap%Hotkey%Hk%
	IniRead, Flask5%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, Flask5%Swap%Hotkey%Hk%
Return

SwapWrite1:
	IniWrite, % 6SocketWeaponTopRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponTopRightSocket%Swap%Hotkey%Hk%
	IniWrite, % 6SocketWeaponTopCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponTopCenterSocket%Swap%Hotkey%Hk%
	IniWrite, % 6SocketWeaponMiddleRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponMiddleRightSocket%Swap%Hotkey%Hk%
	IniWrite, % 6SocketWeaponMiddleCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponMiddleCenterSocket%Swap%Hotkey%Hk%
	IniWrite, % 6SocketWeaponBottomRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponBottomRightSocket%Swap%Hotkey%Hk%
	IniWrite, % 6SocketWeaponBottomCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponBottomCenterSocket%Swap%Hotkey%Hk%
	IniWrite, % RightWeaponTopSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightWeaponTopSocket%Swap%Hotkey%Hk%
	IniWrite, % RightWeaponMiddleSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position,  RightWeaponMiddleSocket%Swap%Hotkey%Hk%
	IniWrite, % RightWeaponBottomSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightWeaponBottomSocket%Swap%Hotkey%Hk%
	IniWrite, % RightWeaponTopRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightWeaponTopRightSocket%Swap%Hotkey%Hk%
	IniWrite, % RightWeaponTopCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightWeaponTopCenterSocket%Swap%Hotkey%Hk%
	IniWrite, % RightWeaponBottomCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightWeaponBottomCenterSocket%Swap%Hotkey%Hk%
	IniWrite, % HelmetTopRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, HelmetTopRightSocket%Swap%Hotkey%Hk%
	IniWrite, % HelmetTopLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, HelmetTopLeftSocket%Swap%Hotkey%Hk%
	IniWrite, % HelmetBottomRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, HelmetBottomRightSocket%Swap%Hotkey%Hk%
	IniWrite, % HelmetBottomLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, HelmetBottomLeftSocket%Swap%Hotkey%Hk%
	IniWrite, % HelmetMiddleRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, HelmetMiddleRightSocket%Swap%Hotkey%Hk%
	IniWrite, % HelmetMiddleLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, HelmetMiddleLeftSocket%Swap%Hotkey%Hk%
	IniWrite, % HelmetMiddleSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, HelmetMiddleSocket%Swap%Hotkey%Hk%
	IniWrite, % LeftHandTopSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandTopSocket%Swap%Hotkey%Hk%
	IniWrite, % LeftHandMiddleSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandMiddleSocket%Swap%Hotkey%Hk%
	IniWrite, % LeftHandBottomSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandBottomSocket%Swap%Hotkey%Hk%
	IniWrite, % LeftHandTopCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandTopCenterSocket%Swap%Hotkey%Hk%
	IniWrite, % LeftHandTopLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandTopLeftSocket%Swap%Hotkey%Hk%
	IniWrite, % LeftHandBottomLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandBottomLeftSocket%Swap%Hotkey%Hk%
	IniWrite, % LeftHandMiddleCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandMiddleCenterSocket%Swap%Hotkey%Hk%
	IniWrite, % LeftHandMiddleLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandMiddleLeftSocket%Swap%Hotkey%Hk%
	IniWrite, % GlovesTopRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, GlovesTopRightSocket%Swap%Hotkey%Hk%
	IniWrite, % GlovesTopCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, GlovesTopCenterSocket%Swap%Hotkey%Hk%
	IniWrite, % GlovesBottomRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, GlovesBottomRightSocket%Swap%Hotkey%Hk%
	IniWrite, % GlovesBottomCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, GlovesBottomCenterSocket%Swap%Hotkey%Hk%
	IniWrite, % GlovesMiddleRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, GlovesMiddleRightSocket%Swap%Hotkey%Hk%
	IniWrite, % GlovesMiddleCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, GlovesMiddleCenterSocket%Swap%Hotkey%Hk%
	IniWrite, % GlovesMiddleSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, GlovesMiddleSocket%Swap%Hotkey%Hk%
	IniWrite, % 4SocketArmorTopRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 4SocketArmorTopRightSocket%Swap%Hotkey%Hk%
	IniWrite, % 4SocketArmorTopLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 4SocketArmorTopLeftSocket%Swap%Hotkey%Hk%
	IniWrite, % 4SocketArmorBottomRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 4SocketArmorBottomRightSocket%Swap%Hotkey%Hk%
	IniWrite, % 4SocketArmorBottomLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 4SocketArmorBottomLeftSocket%Swap%Hotkey%Hk%
	IniWrite, % 6SocketArmorTopRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketArmorTopRightSocket%Swap%Hotkey%Hk%
	IniWrite, % 6SocketArmorTopLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketArmorTopLeftSocket%Swap%Hotkey%Hk%
	IniWrite, % 6SocketArmorMiddleRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketArmorMiddleRightSocket%Swap%Hotkey%Hk%
	IniWrite, % 6SocketArmorMiddleLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketArmorMiddleLeftSocket%Swap%Hotkey%Hk%
	IniWrite, % 6SocketArmorBottomRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketArmorBottomRightSocket%Swap%Hotkey%Hk%
	IniWrite, % 6SocketArmorBottomLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketArmorBottomLeftSocket%Swap%Hotkey%Hk%
	IniWrite, % 1SocketArmorMiddleSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 1SocketArmorMiddleSocket%Swap%Hotkey%Hk%
	IniWrite, % BootsTopCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, BootsTopCenterSocket%Swap%Hotkey%Hk%
	IniWrite, % BootsTopLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, BootsTopLeftSocket%Swap%Hotkey%Hk%
	IniWrite, % BootsBottomCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, BootsBottomCenterSocket%Swap%Hotkey%Hk%
	IniWrite, % BootsBottomLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, BootsBottomLeftSocket%Swap%Hotkey%Hk%
	IniWrite, % BootsMiddleCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, BootsMiddleCenterSocket%Swap%Hotkey%Hk%
	IniWrite, % BootsMiddleLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, BootsMiddleLeftSocket%Swap%Hotkey%Hk%
	IniWrite, % BootsMiddleSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, BootsMiddleSocket%Swap%Hotkey%Hk%
	IniWrite, % RightFingerSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightFingerSocket%Swap%Hotkey%Hk%
	IniWrite, % LeftFingerSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftFingerSocket%Swap%Hotkey%Hk%
	IniWrite, % AmuletSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, AmuletSocket%Swap%Hotkey%Hk%
	IniWrite, % BeltRightSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, BeltRightSocket%Swap%Hotkey%Hk%
	IniWrite, % BeltCenterSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, BeltCenterSocket%Swap%Hotkey%Hk%
	IniWrite, % BeltLeftSocket%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, BeltLeftSocket%Swap%Hotkey%Hk%
	IniWrite, % Flask1%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, Flask1%Swap%Hotkey%Hk%
	IniWrite, % Flask2%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, Flask2%Swap%Hotkey%Hk%
	IniWrite, % Flask3%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, Flask3%Swap%Hotkey%Hk%
	IniWrite, % Flask4%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, Flask4%Swap%Hotkey%Hk%
	IniWrite, % Flask5%Swap%Hotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, Flask5%Swap%Hotkey%Hk%
return

SwapRead2:
	IniRead, 6SocketWeaponTopRightSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponTopRightSocket%Swap%AltHotkey%Hk%
	IniRead, 6SocketWeaponTopCenterSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponTopCenterSocket%Swap%AltHotkey%Hk%
	IniRead, 6SocketWeaponMiddleRightSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponMiddleRightSocket%Swap%AltHotkey%Hk%
	IniRead, 6SocketWeaponMiddleCenterSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponMiddleCenterSocket%Swap%AltHotkey%Hk%
	IniRead, 6SocketWeaponBottomRightSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponBottomRightSocket%Swap%AltHotkey%Hk%
	IniRead, 6SocketWeaponBottomCenterSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponBottomCenterSocket%Swap%AltHotkey%Hk%
	IniRead, RightWeaponTopSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightWeaponTopSocket%Swap%AltHotkey%Hk%
	IniRead, RightWeaponMiddleSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position,  RightWeaponMiddleSocket%Swap%AltHotkey%Hk%
	IniRead, RightWeaponBottomSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightWeaponBottomSocket%Swap%AltHotkey%Hk%
	IniRead, RightWeaponTopRightSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightWeaponTopRightSocket%Swap%AltHotkey%Hk%
	IniRead, RightWeaponTopCenterSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightWeaponTopCenterSocket%Swap%AltHotkey%Hk%
	IniRead, RightWeaponBottomCenterSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightWeaponBottomCenterSocket%Swap%AltHotkey%Hk%
	IniRead, LeftHandTopSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandTopSocket%Swap%AltHotkey%Hk%
	IniRead, LeftHandMiddleSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandMiddleSocket%Swap%AltHotkey%Hk%
	IniRead, LeftHandBottomSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandBottomSocket%Swap%AltHotkey%Hk%
	IniRead, LeftHandTopCenterSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandTopCenterSocket%Swap%AltHotkey%Hk%
	IniRead, LeftHandTopLeftSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandTopLeftSocket%Swap%AltHotkey%Hk%
	IniRead, LeftHandBottomLeftSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandBottomLeftSocket%Swap%AltHotkey%Hk%
	IniRead, LeftHandMiddleCenterSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandMiddleCenterSocket%Swap%AltHotkey%Hk%
	IniRead, LeftHandMiddleLeftSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandMiddleLeftSocket%Swap%AltHotkey%Hk%
return

SwapWrite2:
	IniWrite, % 6SocketWeaponTopRightSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponTopRightSocket%Swap%AltHotkey%Hk%
	IniWrite, % 6SocketWeaponTopCenterSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponTopCenterSocket%Swap%AltHotkey%Hk%
	IniWrite, % 6SocketWeaponMiddleRightSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponMiddleRightSocket%Swap%AltHotkey%Hk%
	IniWrite, % 6SocketWeaponMiddleCenterSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponMiddleCenterSocket%Swap%AltHotkey%Hk%
	IniWrite, % 6SocketWeaponBottomRightSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponBottomRightSocket%Swap%AltHotkey%Hk%
	IniWrite, % 6SocketWeaponBottomCenterSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, 6SocketWeaponBottomCenterSocket%Swap%AltHotkey%Hk%
	IniWrite, % RightWeaponTopSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightWeaponTopSocket%Swap%AltHotkey%Hk%
	IniWrite, % RightWeaponMiddleSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position,  RightWeaponMiddleSocket%Swap%AltHotkey%Hk%
	IniWrite, % RightWeaponBottomSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightWeaponBottomSocket%Swap%AltHotkey%Hk%
	IniWrite, % RightWeaponTopRightSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightWeaponTopRightSocket%Swap%AltHotkey%Hk%
	IniWrite, % RightWeaponTopCenterSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightWeaponTopCenterSocket%Swap%AltHotkey%Hk%
	IniWrite, % RightWeaponBottomCenterSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, RightWeaponBottomCenterSocket%Swap%AltHotkey%Hk%
	IniWrite, % LeftHandTopSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandTopSocket%Swap%AltHotkey%Hk%
	IniWrite, % LeftHandMiddleSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandMiddleSocket%Swap%AltHotkey%Hk%
	IniWrite, % LeftHandBottomSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandBottomSocket%Swap%AltHotkey%Hk%
	IniWrite, % LeftHandTopCenterSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandTopCenterSocket%Swap%AltHotkey%Hk%
	IniWrite, % LeftHandTopLeftSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandTopLeftSocket%Swap%AltHotkey%Hk%
	IniWrite, % LeftHandBottomLeftSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandBottomLeftSocket%Swap%AltHotkey%Hk%
	IniWrite, % LeftHandMiddleCenterSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandMiddleCenterSocket%Swap%AltHotkey%Hk%
	IniWrite, % LeftHandMiddleLeftSocket%Swap%AltHotkey%Hk%, UnrapeKitConfig.ini, %Swap%Position, LeftHandMiddleLeftSocket%Swap%AltHotkey%Hk%
Return

SwapCoord1:
	If (6SocketWeaponTopRightSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1355
		%Swap%Hotkey%Hk%_Y = 170
	}
	If (6SocketWeaponTopCenterSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1405
		%Swap%Hotkey%Hk%_Y = 170
	}
	If (6SocketWeaponMiddleRightSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1355
		%Swap%Hotkey%Hk%_Y = 225
	}
	If (6SocketWeaponMiddleCenterSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1405
		%Swap%Hotkey%Hk%_Y = 225
	}
	If (6SocketWeaponBottomRightSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1355
		%Swap%Hotkey%Hk%_Y = 280
	}
	If (6SocketWeaponBottomCenterSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1405
		%Swap%Hotkey%Hk%_Y = 280
	}
	If (RightWeaponTopSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1380
		%Swap%Hotkey%Hk%_Y = 170
	}
	If (RightWeaponMiddleSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1380
		%Swap%Hotkey%Hk%_Y = 225
	}
	If (RightWeaponBottomSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1380
		%Swap%Hotkey%Hk%_Y = 280
	}
	If (RightWeaponTopRightSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1355
		%Swap%Hotkey%Hk%_Y = 200
	}
	If (RightWeaponTopCenterSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1405
		%Swap%Hotkey%Hk%_Y = 200
	}
	If (RightWeaponBottomCenterSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1405
		%Swap%Hotkey%Hk%_Y = 250
	}
	If (LeftHandTopSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1795
		%Swap%Hotkey%Hk%_Y = 170
	}
	If (LeftHandMiddleSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1795
		%Swap%Hotkey%Hk%_Y = 225
	}
	If (LeftHandBottomSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1795
		%Swap%Hotkey%Hk%_Y = 280
	}
	If (LeftHandTopCenterSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1765
		%Swap%Hotkey%Hk%_Y = 200
	}
	If (LeftHandTopLeftSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1820
		%Swap%Hotkey%Hk%_Y = 200
	}
	If (LeftHandBottomLeftSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1820
		%Swap%Hotkey%Hk%_Y = 250
	}
	If (LeftHandMiddleCenterSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1770
		%Swap%Hotkey%Hk%_Y = 225
	}
	If (LeftHandMiddleLeftSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1820
		%Swap%Hotkey%Hk%_Y = 225
	}
	If (HelmetTopRightSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1560
		%Swap%Hotkey%Hk%_Y = 135
	}
	If (HelmetTopLeftSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1615
		%Swap%Hotkey%Hk%_Y = 135
	}
	If (HelmetBottomRightSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1560
		%Swap%Hotkey%Hk%_Y = 185
	}
	If (HelmetBottomLeftSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1615
		%Swap%Hotkey%Hk%_Y = 185
	}
	If (HelmetMiddleRightSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1560
		%Swap%Hotkey%Hk%_Y = 160
	}
	If (HelmetMiddleLeftSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1615
		%Swap%Hotkey%Hk%_Y = 160
	}
	If (HelmetMiddleSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1690
		%Swap%Hotkey%Hk%_Y = 160
	}
	If (GlovesTopRightSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1430
		%Swap%Hotkey%Hk%_Y = 370
	}
	If (GlovesTopCenterSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1485
		%Swap%Hotkey%Hk%_Y = 370
	}
	If (GlovesBottomRightSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1430
		%Swap%Hotkey%Hk%_Y = 420
	}
	If (GlovesBottomCenterSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1485
		%Swap%Hotkey%Hk%_Y = 420
	}
	If (GlovesMiddleRightSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1430
		%Swap%Hotkey%Hk%_Y = 395
	}
	If (GlovesMiddleCenterSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1485
		%Swap%Hotkey%Hk%_Y = 395
	}
	If (GlovesMiddleSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1455
		%Swap%Hotkey%Hk%_Y = 395
	}
	If (4SocketArmorTopRightSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1560
		%Swap%Hotkey%Hk%_Y = 275
	}
	If (4SocketArmorTopLeftSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1615
		%Swap%Hotkey%Hk%_Y = 275
	}
	If (4SocketArmorBottomRightSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1560
		%Swap%Hotkey%Hk%_Y = 333
	}
	If (4SocketArmorBottomLeftSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1615
		%Swap%Hotkey%Hk%_Y = 333
	}
	If (6SocketArmorTopRightSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1560
		%Swap%Hotkey%Hk%_Y = 250
	}
	If (6SocketArmorTopLeftSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1615
		%Swap%Hotkey%Hk%_Y = 250
	}
	If (6SocketArmorMiddleRightSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1560
		%Swap%Hotkey%Hk%_Y = 305
	}
	If (6SocketArmorMiddleLeftSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1615
		%Swap%Hotkey%Hk%_Y = 305
	}
	If (6SocketArmorBottomRightSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1560
		%Swap%Hotkey%Hk%_Y = 360
	}
	If (6SocketArmorBottomLeftSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1615
		%Swap%Hotkey%Hk%_Y = 360
	}
	If (1SocketArmorMiddleSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1585
		%Swap%Hotkey%Hk%_Y = 305
	}
	If (BootsTopCenterSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1690
		%Swap%Hotkey%Hk%_Y = 370
	}
	If (BootsTopLeftSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1740
		%Swap%Hotkey%Hk%_Y = 370
	}
	If (BootsBottomCenterSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1690
		%Swap%Hotkey%Hk%_Y = 420
	}
	If (BootsBottomLeftSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1740
		%Swap%Hotkey%Hk%_Y = 420
	}
	If (BootsMiddleCenterSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1690
		%Swap%Hotkey%Hk%_Y = 395
	}
	If (BootsMiddleLeftSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1740
		%Swap%Hotkey%Hk%_Y = 395
	}
	If (BootsMiddleSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1715
		%Swap%Hotkey%Hk%_Y = 395
	}
	If (RightFingerSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1485
		%Swap%Hotkey%Hk%_Y = 305
	}
	If (LeftFingerSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1690
		%Swap%Hotkey%Hk%_Y = 305
	}
	If (AmuletSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1690
		%Swap%Hotkey%Hk%_Y = 245
	}
	If (BeltRightSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1565
		%Swap%Hotkey%Hk%_Y = 420
	}
	If (BeltCenterSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1585
		%Swap%Hotkey%Hk%_Y = 420
	}
	If (BeltLeftSocket%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1605
		%Swap%Hotkey%Hk%_Y = 420
	}
	If (Flask1%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1487
		%Swap%Hotkey%Hk%_Y = 515
	}
	If (Flask2%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1540
		%Swap%Hotkey%Hk%_Y = 515
	}
	If (Flask3%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1592
		%Swap%Hotkey%Hk%_Y = 515
	}
	If (Flask4%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1645
		%Swap%Hotkey%Hk%_Y = 515
	}
	If (Flask5%Swap%Hotkey%Hk% = 1) {
		%Swap%Hotkey%Hk%_X = 1697
		%Swap%Hotkey%Hk%_Y = 515
	}
return

SwapCoord2:
	If (6SocketWeaponTopRightSocket%Swap%AltHotkey%Hk% = 1) {
		%Swap%AltHotkey%Hk%_X = 1355
		%Swap%AltHotkey%Hk%_Y = 170
	}
	If (6SocketWeaponTopCenterSocket%Swap%AltHotkey%Hk% = 1) {
		%Swap%AltHotkey%Hk%_X = 1405
		%Swap%AltHotkey%Hk%_Y = 170
	}
	If (6SocketWeaponMiddleRightSocket%Swap%AltHotkey%Hk% = 1) {
		%Swap%AltHotkey%Hk%_X = 1355
		%Swap%AltHotkey%Hk%_Y = 225
	}
	If (6SocketWeaponMiddleCenterSocket%Swap%AltHotkey%Hk% = 1) {
		%Swap%AltHotkey%Hk%_X = 1405
		%Swap%AltHotkey%Hk%_Y = 225
	}
	If (6SocketWeaponBottomRightSocket%Swap%AltHotkey%Hk% = 1) {
		%Swap%AltHotkey%Hk%_X = 1355
		%Swap%AltHotkey%Hk%_Y = 280
	}
	If (6SocketWeaponBottomCenterSocket%Swap%AltHotkey%Hk% = 1) {
		%Swap%AltHotkey%Hk%_X = 1405
		%Swap%AltHotkey%Hk%_Y = 280
	}
	If (RightWeaponTopSocket%Swap%AltHotkey%Hk% = 1) {
		%Swap%AltHotkey%Hk%_X = 1380
		%Swap%AltHotkey%Hk%_Y = 170
	}
	If (RightWeaponMiddleSocket%Swap%AltHotkey%Hk% = 1) {
		%Swap%AltHotkey%Hk%_X = 1380
		%Swap%AltHotkey%Hk%_Y = 225
	}
	If (RightWeaponBottomSocket%Swap%AltHotkey%Hk% = 1) {
		%Swap%AltHotkey%Hk%_X = 1380
		%Swap%AltHotkey%Hk%_Y = 280
	}
	If (RightWeaponTopRightSocket%Swap%AltHotkey%Hk% = 1) {
		%Swap%AltHotkey%Hk%_X = 1355
		%Swap%AltHotkey%Hk%_Y = 200
	}
	If (RightWeaponTopCenterSocket%Swap%AltHotkey%Hk% = 1) {
		%Swap%AltHotkey%Hk%_X = 1405
		%Swap%AltHotkey%Hk%_Y = 200
	}
	If (RightWeaponBottomCenterSocket%Swap%AltHotkey%Hk% = 1) {
		%Swap%AltHotkey%Hk%_X = 1405
		%Swap%AltHotkey%Hk%_Y = 250
	}
	If (LeftHandTopSocket%Swap%AltHotkey%Hk% = 1) {
		%Swap%AltHotkey%Hk%_X = 1795
		%Swap%AltHotkey%Hk%_Y = 170
	}
	If (LeftHandMiddleSocket%Swap%AltHotkey%Hk% = 1) {
		%Swap%AltHotkey%Hk%_X = 1795
		%Swap%AltHotkey%Hk%_Y = 225
	}
	If (LeftHandBottomSocket%Swap%AltHotkey%Hk% = 1) {
		%Swap%AltHotkey%Hk%_X = 1795
		%Swap%AltHotkey%Hk%_Y = 280
	}
	If (LeftHandTopCenterSocket%Swap%AltHotkey%Hk% = 1) {
		%Swap%AltHotkey%Hk%_X = 1765
		%Swap%AltHotkey%Hk%_Y = 200
	}
	If (LeftHandTopLeftSocket%Swap%AltHotkey%Hk% = 1) {
		%Swap%AltHotkey%Hk%_X = 1820
		%Swap%AltHotkey%Hk%_Y = 200
	}
	If (LeftHandBottomLeftSocket%Swap%AltHotkey%Hk% = 1) {
		%Swap%AltHotkey%Hk%_X = 1820
		%Swap%AltHotkey%Hk%_Y = 250
	}
	If (LeftHandMiddleCenterSocket%Swap%AltHotkey%Hk% = 1) {
		%Swap%AltHotkey%Hk%_X = 1770
		%Swap%AltHotkey%Hk%_Y = 225
	}
	If (LeftHandMiddleLeftSocket%Swap%AltHotkey%Hk% = 1) {
		%Swap%AltHotkey%Hk%_X = 1820
		%Swap%AltHotkey%Hk%_Y = 225
	}
Return
