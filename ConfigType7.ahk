Type7Config:
	gosub Type7Load
	MouseGetPos, Xpos, Ypos
	Type7ConfigRecord:= 0
	GuiWidth:= 210
	GuiHeight:= 100
	gosub GuiSD
	Gui, Add, Text, x40 y10, Type 7 configuration
	Gui, Add, Edit, x10 y40 w30 h20 vHkey%Hk%Iterations, % Hkey%Hk%Iterations
	Gui, Add, Text, x50 y43, % "Iterations Hotkey " Hk
	Gui, Add, Button, x10 y70 w90 h20 gType7Config2 Default, Configure
	Gui, Add, Button, x110 y70 w90 h20 gCancel, Reload
	Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, Type 7
Return

Type7Config2:
	gosub GuiSD
	IniWrite, % Hkey%Hk%Iterations, UnrapeKitConfig.ini, Type7Hotkey%Hk%, Hkey%Hk%Iterations
	MouseGetPos, Xpos, Ypos
	H:= 1
	W:= 1
	HMax:= 1
	SysGet, SGW, 71
	Gui, -0x80000 AlwaysOnTop
	Gui, Add, Text, x10 y10, Options:
	Gui, Add, Text, x10 y40, Choose any of these or skip
	Gui, Add, Text, x10 y70,
	Gui, Add, Text, x10 y100, ImageSearch
	Gui, Add, Text, x10 y130, GetMousePos
	Gui, Add, Text, x10 y160, GoMousePos
	Gui, Add, Text, x10 y190, SpellScan
	Gui, Add, Text, x10 y220, Spell
	Gui, Add, Text, x10 y250, SendInput
	Gui, Add, Text, x10 y280, MouseMove
	Gui, Add, Text, x10 y310, Delay
	Gui, Add, Text, x10 y340, GemSwap
	Gui, Add, Text, x10 y370, EquipmentSwap
	Gui, Add, Text, x10 y400, Add
	Gui, Add, Edit, x110 y400 w20 h20 vHkey%Hk%7Iterations
	Gui, Add, Text, x140 y403, Iteration(s)
	Gui, Add, Button, x10 y400 w90 h20 gType7ConfigAdd, Add
	T7:= 1
	Loop, % Hkey%Hk%Iterations {
		GuiY:= 60 + 30 * H
		ScreenHeight:= A_ScreenHeight - 45
		If (GuiY > ScreenHeight) {
			W+= 1
			HMax:= H
			H= 1
		}
		Y1:= 8 + 30 * H
		Y2:= 5 + 30 * H
		GuiWidth:= 160 + 360 * W
		If (W = 1) {
			GuiHeight:= 70 + 30 * H
			ButtonHeight:= 40 + 30 * H
		}
		If (W > 1) {
			GuiHeight:= 70 + 30 * HMax
			ButtonHeight:= 40 + 30 * HMax
		}
		Button1X:= GuiWidth - 300
		Button2X:= GuiWidth - 200
		Button3X:= GuiWidth - 100
		CheckboxX:= GuiWidth - 310
		EditButtonX:= GuiWidth - 100
		EditX:= GuiWidth - 280
		TextX:= GuiWidth - 170
		var1= Hkey%Hk%Iteration%T7%Toggle
		Gui, Add, Edit, x%EditX% y%Y2% w100 h20 vHkey%Hk%Iteration%T7%, % Hkey%Hk%Iteration%T7%
		Gui, Add, Text, x%TextX% y%Y1%, % "Iteration " T7
		Gui, Add, Button, x%EditButtonX% y%Y2% w90 h20 gEditT7, %T7%
		If (T7 = Hkey%Hk%Iterations) {
			If ButtonHeight < 400
				ButtonHeight = 400
			If GuiHeight < 430
				GuiHeight = 430
			gosub GuiBuild
			Gui, Add, Button, x%Button1X% y%ButtonHeight% w90 h20 gType7ConfigRecord Default, Record
			Gui, Add, Button, x%Button2X% y%ButtonHeight% w90 h20 gType7Config3, Configure
			Gui, Add, Button, x%Button3X% y%ButtonHeight% w90 h20 gCancel, Reload
			Gui, Show, x%Move_X% y%Move_Y% w%GuiWidth% h%GuiHeight%, Iteration Configuration
			Break
		}
		T7+= 1
		H+= 1
	}
Return

EditT7:
	A_GuiControlT7:= A_GuiControl
	T7:= A_GuiControlT7
	gosub GuiSD
	gosub Type7Write2
	Gosub Type7Config4
Return

Type7ConfigRecord:
	gosub GuiSD
	gosub Type7Write
	Gosub Type7Config2
Return

Type7ConfigAdd:
	gosub GuiSD
	gosub Type7Write2
	Hkey%Hk%Iterations+= % Hkey%Hk%7Iterations
	Gosub Type7Config2
Return

Type7Config3:
	gosub GuiSD
	T7 := 1
	gosub Type7Write2
	T7 := 1
	Gosub Type7Config4
Return

Type7Config4:
	gosub GuiSD
	If (A_GuiControlT7 > 0)
		A_GuiControlType7Config4:= A_GuiControlT7
	IniRead, Hkey%Hk%Iterations, UnrapeKitConfig.ini, Type7Hotkey%Hk%, Hkey%Hk%Iterations
	Loop {
		If (Hkey%Hk%Iteration%T7% = "ImageSearch") {
			Gosub Type7ImageSearch
			Break
		}
		If (Hkey%Hk%Iteration%T7% = "GetMousePos") {
			Gosub Type7GetMousePos
			Break
		}
		If (Hkey%Hk%Iteration%T7% = "GoMousePos") {
			Gosub Type7GoMousePos
			Break
		}
		If (Hkey%Hk%Iteration%T7% = "SpellScan") {
			Gosub Type7LoopAdd
			Break
		}
		If (Hkey%Hk%Iteration%T7% = "Spell") {
			Gosub Type7Spell
			Break
		}
		If (Hkey%Hk%Iteration%T7% = "SendInput") {
			Gosub Type7Send
			Break
		}
		If (Hkey%Hk%Iteration%T7% = "MouseMove") {
			Gosub Type7MouseMove
			Break
		}
		If (Hkey%Hk%Iteration%T7% = "Delay") {
			Gosub Type7DelayConfig
			Break
		}
		If (Hkey%Hk%Iteration%T7% = "GemSwap") {
			Gosub Type7GemSwap1
			Break
		}
		If (Hkey%Hk%Iteration%T7% = "EquipmentSwap") {
			Gosub Type7EquipSwap1
			Break
		}
		If (T7 >= Hkey%Hk%Iterations) {
			Hk += 1
			Gosub HkTypeConfigLoop
			Break
		}
	}
Return

Type7Msg:
	MsgBox, % "Iteration " T7 " = " Hkey%Hk%Iteration%T7%
	Gosub Type7LoopAdd
Return

Type7LoopAdd:
	gosub GuiSD
	If (A_GuiControlType7Config4 > 0) {
		A_GuiControlT7:= 0
		gosub Type7Config2
	} Else {
		T7+= 1
		Gosub Type7Config4
	}
Return

Type7LoopSubtract:
	gosub GuiSD
	A_GuiControlT7:= 0
	Loop {
		T7-= 1
		If (T7 = 0) {
			T7:= 1
			Gosub Type7Config4
			Break
		}
	}
Return

Type7ImageSearch:
	gosub GuiSD
	gosub GuiBuild
	Gui, Add, Edit, x10 y10 w30 h20 vScanCoordinatesHotkey%Hk%Iteration%T7%_L, % ScanCoordinatesHotkey%Hk%Iteration%T7%_L
	Gui, Add, Edit, x50 y10 w30 h20 vScanCoordinatesHotkey%Hk%Iteration%T7%_T, % ScanCoordinatesHotkey%Hk%Iteration%T7%_T
	Gui, Add, Edit, x90 y10 W30 H20 vScanCoordinatesHotkey%Hk%Iteration%T7%_R, % ScanCoordinatesHotkey%Hk%Iteration%T7%_R
	Gui, Add, Edit, x130 y10 W30 H20 vScanCoordinateHotkey%Hk%Iteration%T7%_B, % ScanCoordinatesHotkey%Hk%Iteration%T7%_B
	Gui, Add, Edit, x10 y40 W110 H20 vShadeVariationHotkey%Hk%Iteration%T7%, % ShadeVariationHotkey%Hk%Iteration%T7%
	Gui, Add, Edit, x10 y70 w110 h20 vImageNameHotkey%Hk%Iteration%T7%, % ImageNameHotkey%Hk%Iteration%T7%
	Gui, Add, Text, x170 y13, Left, Top, Right and Bottom Scan Coordinates
	Gui, Add, Text, x130 y43, Scan Color Shade Variation and Optional Parameters
	Gui, Add, Text, x130 y73, Scan Image Name
	Gui, Add, Button, x310 y100 w90 h20 gType7ImageSearchWrite Default, Define
	Gui, Add, Button, x210 y100 w90 h20 gType7LoopAdd, Skip
	Gui, Add, Button, x110 y100 w90 h20 gType7LoopSubtract, Go Back
	Gui, Add, Button, x10 y100 w90 h20 gCancel, Reload
	Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%,  Type 7 - Hotkey %Hk% Iteration %T7%: Image Scan
Return

Type7ImageSearchWrite:
	gosub GuiSD
	Hkey%Hk%GetMousePosToggleIteration%T7%:= 1
	IniWrite, % Hkey%Hk%GetMousePosToggleIteration%T7%, UnrapeKitConfig.ini, type7MousePos, Hkey%Hk%GetMousePosToggleIteration%T7%
	IniWrite, % ScanCoordinatesHotkey%Hk%Iteration%T7%_L, UnrapeKitConfig.ini, ScanType7, ScanCoordinatesHotkey%Hk%Iteration%T7%_L
	IniWrite, % ScanCoordinatesHotkey%Hk%Iteration%T7%_T, UnrapeKitConfig.ini, ScanType7, ScanCoordinatesHotkey%Hk%Iteration%T7%_T
	IniWrite, % ScanCoordinatesHotkey%Hk%Iteration%T7%_R, UnrapeKitConfig.ini, ScanType7, ScanCoordinatesHotkey%Hk%Iteration%T7%_R
	IniWrite, % ScanCoordinatesHotkey%Hk%Iteration%T7%_B, UnrapeKitConfig.ini, ScanType7, ScanCoordinatesHotkey%Hk%Iteration%T7%_B
	IniWrite, % ImageNameHotkey%Hk%Iteration%T7%, UnrapeKitConfig.ini, ScanType7, ImageNameHotkey%Hk%Iteration%T7%
	IniWrite, % ShadeVariationHotkey%Hk%Iteration%T7%, UnrapeKitConfig.ini, ScanType7, ShadeVariationHotkey%Hk%Iteration%T7%
	Gosub Type7LoopAdd
Return

Type7GetMousePos:
	GuiWidth:= 410
	GuiHeight:= 100
	gosub GuiBuild
	If (Hkey%Hk%MouseXPosIteration%T7% is Integer Hkey%Hk%MouseYPosIteration%T7% is Integer) {
		MouseMove, Hkey%Hk%MouseXPosIteration%T7%, Hkey%Hk%MouseYPosIteration%T7%
	} Else {
		MouseMove, 960, 540
	}
	Gui, -0x80000 AlwaysOnTop
	Gui, Add, Text, x10 y13, Hotkey %Hk% Iteration %T7%: Move the mouse to the position to be saved and press ENTER
	Gui, Add, Checkbox, % "x10 y40 h13 w13 vHkey" Hk "GetMousePosToggleIteration" T7 " Checked" Hkey%Hk%GetMousePosToggleIteration%T7%, Cancel Saving and get position during hotkey execution
	Gui, Add, Button, x310 y70 w90 h20 gType7GetMousePosWrite Default, Define
	Gui, Add, Button, x210 y70 w90 h20 gType7LoopAdd, Skip
	Gui, Add, Button, x110 y70 w90 h20 gType7LoopSubtract, Go Back
	Gui, Add, Button, x10 y70 w90 h20 gCancel, Reload
	Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%,  Type 7 - Hotkey %Hk% Iteration %T7%: Get Mouse Position
Return

Type7GetMousePosWrite:
	gosub GuiSD
	If (Hkey%Hk%GetMousePosToggleIteration%T7% = 0) {
		MouseGetPos, Hkey%Hk%MouseXPosIteration%T7%, Hkey%Hk%Type7MouseYPosIteration%T7%
		IniWrite, % Hkey%Hk%MouseXPosIteration%T7%, UnrapeKitConfig.ini, type7MousePos, Hkey%Hk%MouseXPosIteration%T7%
		IniWrite, % Hkey%Hk%MouseYPosIteration%T7%, UnrapeKitConfig.ini, type7MousePos, Hkey%Hk%MouseYPosIteration%T7%
	}
	IniWrite, % Hkey%Hk%GetMousePosToggleIteration%T7%, UnrapeKitConfig.ini, type7MousePos, Hkey%Hk%GetMousePosToggleIteration%T7%
	Gosub Type7LoopAdd
Return

Type7GoMousePos:
	GuiWidth:= 410
	GuiHeight:= 70
	gosub GuiBuild
	Gui, Add, Edit, x200 y10 w20 h20 vHkey%Hk%GoMousePosIteration%T7%, % Hkey%Hk%GoMousePosIteration%T7%
	Gui, Add, Text, x10 y13, Move to Mouse Position from Iteration:
	Gui, Add, Button, x310 y40 w90 h20 gType7GoMousePosWrite Default, Define
	Gui, Add, Button, x210 y40 w90 h20 gType7LoopAdd, Skip
	Gui, Add, Button, x110 y40 w90 h20 gType7LoopSubtract, Go Back
	Gui, Add, Button, x10 y40 w90 h20 gCancel, Reload
	Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%,  Type 7 - Hotkey %Hk% Iteration %T7%:Mouse Position
Return

Type7GoMousePosWrite:
	gosub GuiSD
	IniWrite, % Hkey%Hk%GoMousePosIteration%T7%, UnrapeKitConfig.ini, type7MousePos, Hkey%Hk%GoMousePosIteration%T7%
	Gosub Type7Config2
Return

Type7MouseMove:
	GuiWidth:= 410
	GuiHeight:= 70
	gosub GuiBuild
	If (Hkey%Hk%MouseXPosIteration%T7% is Integer) and (Hkey%Hk%MouseYPosIteration%T7% is Integer) {
		MouseMove, Hkey%Hk%MouseXPosIteration%T7%, Hkey%Hk%MouseYPosIteration%T7%
	} Else {
		MouseMove, 960, 540
	}
	Gui, Add, Text, x10 y13, Hotkey %Hk% Iteration %T7%: Move the mouse to the position to be saved and press ENTER
	Gui, Add, Button, x310 y40 w90 h20 gType7MouseMoveWrite Default, Define
	Gui, Add, Button, x210 y40 w90 h20 gType7LoopAdd, Skip
	Gui, Add, Button, x110 y40 w90 h20 gType7LoopSubtract, Go Back
	Gui, Add, Button, x10 y40 w90 h20 gCancel, Reload
	Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%,  Type 7 - Hotkey %Hk% Iteration %T7%: Mouse Position

Return

Type7MouseMoveWrite:
	gosub GuiSD
	MouseGetPos, Hkey%Hk%MouseXPosIteration%T7%, Hkey%Hk%MouseYPosIteration%T7%
	IniWrite, % Hkey%Hk%MouseXPosIteration%T7%, UnrapeKitConfig.ini, type7MousePos, Hkey%Hk%MouseXPosIteration%T7%
	IniWrite, % Hkey%Hk%MouseYPosIteration%T7%, UnrapeKitConfig.ini, type7MousePos, Hkey%Hk%MouseYPosIteration%T7%
	Gosub Type7LoopAdd
Return

Type7Spell:
	GuiWidth:= 410
	GuiHeight:= 140
	gosub GuiBuild
	Gui, Add, Text, x10 y10, % Type 7 - "Iteration " T7 " Spell Configuration"
	Gui, Add, Edit, x10 y40 w110 h20 vHkey%Hk%SpellIteration%T7%, % Hkey%Hk%SpellIteration%T7%
	Gui, Add, Text, x130 y43, % "Spell - Hotkey " Hk
	Gui, Add, Edit, x10 y70 W70 H20 vHkey%Hk%KeyIteration%T7%, % Hkey%Hk%KeyIteration%T7%
	Gui, Add, Text, x90 y73, % "Key - Hotkey " Hk
	Gui, Add, Button, x310 y110 w90 h20 gType7SpellWrite Default, Define
	Gui, Add, Button, x210 y110 w90 h20 gType7LoopAdd, Skip
	Gui, Add, Button, x110 y110 w90 h20 gType7LoopSubtract, Go Back
	Gui, Add, Button, x10 y110 w90 h20 gCancel, Reload
	Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, Type 7 Spell Configuration
Return

Type7SpellWrite:
	gosub GuiSD
	IniWrite, % Hkey%Hk%SpellIteration%T7%, UnrapeKitConfig.ini, type7HotkeySpells, Hkey%Hk%SpellIteration%T7%
	IniWrite, % Hkey%Hk%KeyIteration%T7%, UnrapeKitConfig.ini, type7HotkeyKey, Hkey%Hk%KeyIteration%T7%
	Gosub Type7Key
Return

Type7Key:
	If (Hkey%Hk%KeyIteration%T7% = "Q") {
		KeyX_%Hk%Iteration%T7%:= 1440
		KeyY_%Hk%Iteration%T7%:= 1045
	}
	If (Hkey%Hk%KeyIteration%T7% = "W") {
		KeyX_%Hk%Iteration%T7%:= 1495
		KeyY_%Hk%Iteration%T7%:= 1045
	}
	If (Hkey%Hk%KeyIteration%T7% = "E") {
		KeyX_%Hk%Iteration%T7%:= 1550
		KeyY_%Hk%Iteration%T7%:= 1045
	}
	If (Hkey%Hk%KeyIteration%T7% = "R") {
		KeyX_%Hk%Iteration%T7%:= 1605
		KeyY_%Hk%Iteration%T7%:= 1045
	}
	If (Hkey%Hk%KeyIteration%T7% = "T") {
		KeyX_%Hk%Iteration%T7%:= 1655
		KeyY_%Hk%Iteration%T7%:= 1045
	}
	If (Hkey%Hk%KeyIteration%T7% = "LButton") {
		KeyX_%Hk%Iteration%T7%:= 1550
		KeyY_%Hk%Iteration%T7%:= 975
	}
	If (Hkey%Hk%KeyIteration%T7% = "MButton") {
		KeyX_%Hk%Iteration%T7%:= 1600
		KeyY_%Hk%Iteration%T7%:= 975
	}
	If (Hkey%Hk%KeyIteration%T7% = "RButton") {
		KeyX_%Hk%Iteration%T7%:= 1650
		KeyY_%Hk%Iteration%T7%:= 975
	}
	IniWrite, % KeyX_%Hk%Iteration%T7%, UnrapeKitConfig.ini, Type7KeyCoordinates, KeyX_%Hk%Iteration%T7%
	IniWrite, % KeyY_%Hk%Iteration%T7%, UnrapeKitConfig.ini, type7KeyCoordinates, KeyY_%Hk%Iteration%T7%
	Gosub Type7LoopAdd
Return

Type7Send:
	GuiWidth:= 410
	GuiHeight:= 110
	gosub GuiBuild
	Gui, Add, Text, x185 y10, % "Hotkey " Hk
	Gui, Add, Edit, x10 y40 w70 h20 vHkey%Hk%SendIteration%T7%, % Hkey%Hk%SendIteration%T7%
	Gui, Add, Text, x90 y43, % "Iteration " T7 " Send"
	Gui, Add, Button, x310 y80 w90 h20 gType7SendWrite Default, Define
	Gui, Add, Button, x210 y80 w90 h20 gType7LoopAdd, Skip
	Gui, Add, Button, x110 y80 w90 h20 gType7LoopSubtract, Go Back
	Gui, Add, Button, x10 y80 w90 h20 gCancel, Reload
	Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, Send Config
Return

Type7SendWrite:
	gosub GuiSD
	IniWrite, % Hkey%Hk%SendIteration%T7%, UnrapeKitConfig.ini, type7Send, Hkey%Hk%SendIteration%T7%
	Gosub Type7LoopAdd
Return

Type7DelayConfig:
	GuiWidth:= 410
	GuiHeight:= 70
	gosub GuiBuild
	Gui, Add, Edit, x10 y10 w130 h20 vHkey%Hk%DelayIteration%T7%, % Hkey%Hk%DelayIteration%T7%
	Gui, Add, Text, x150 y13, % "Iteration " T7 " Delay"
	Gui, Add, Button, x310 y40 w90 h20 gType7DelayWrite Default, Define
	Gui, Add, Button, x210 y40 w90 h20 gType7LoopAdd, Skip
	Gui, Add, Button, x110 y40 w90 h20 gType7LoopSubtract, Go Back
	Gui, Add, Button, x10 y40 w90 h20 gCancel, Reload
	Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, % "Hotkey " Hk
Return

Type7DelayWrite:
	gosub GuiSD
	IniWrite, % Hkey%Hk%DelayIteration%T7%, UnrapeKitConfig.ini, type7Delay, Hkey%Hk%DelayIteration%T7%
	Gosub Type7LoopAdd
Return

Type7GemSwap1:
	Swap:= "7GemSwap1"
	GoSub Type7Swap
Return

Type7GemSwap2:
	Swap:= "7GemSwap2"
	GoSub Type7Swap
Return

Type7EquipSwap1:
	Swap:= "7EquipSwap1"
	GoSub Type7Swap
Return

Type7EquipSwap2:
	Swap:= "7EquipSwap2"
	GoSub Type7Swap
Return

Type7Swap:
	Gosub Type7LCAdd
	gosub Type7SwapRead1
	SysGet, SGW, 71
	GuiWidth:= 650
	GuiHeight:= 800
	If (Swap = "7GemSwap2") {
		GemSwapTab:= 1
		Gui, Add, Tab2, w%GuiWidth% h%GuiHeight% AltSubmit v7GemSwapTab_%Hk%, 1||2
		Gui, Tab, 1
	}
	If (Swap = "7EquipSwap2") {
		EquipSwapTab:= 1
		Gui, Add, Tab2, w%GuiWidth% h%GuiHeight% AltSubmit v7EquipSwapTab_%Hk%, 1||2
		Gui, Tab, 1
	}
	Gui, Color, 0x050505
	Gui, Add, Picture, x0 y0, InventoryEquip.png
	gosub GuiBuild
	gosub Type7Radio1
	gosub Type7Radio3
	Gui, Add, Button, x550 y770 w90 h20 gType7SwapCoord Default, Select
	Gui, Add, Button, x450 y770 w90 h20 gType7LoopAdd, Skip
	Gui, Add, Button, x350 y770 w90 h20 gType7LoopSubtract, Go Back
	Gui, Add, Button, x10 y770 w90 h20 gCancel, Reload
	If (Swap = "7GemSwap2") OR (Swap = "7EquipSwap2") {
		GuiWidth:= 650
		GuiHeight:= 800
		gosub GuiBuild
		Gui, Tab, 2
		gosub Type7Radio2
		Gui, Add, Button, x550 y770 w90 h20 gType7SwapCoord Default, Select
		Gui, Add, Button, x450 y770 w90 h20 gType7LoopAdd, Skip
		Gui, Add, Button, x350 y770 w90 h20 gType7LoopSubtract, Go Back
		Gui, Add, Button, x10 y770 w90 h20 gCancel, Reload
	}
	If (Swap = "7GemSwap2")
		Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, % Hkey%Hk%Shortcut " - Type 7: Equipped Gem Swap: Ctrl + Tab/PgUp/PgDn To Alternate Equipment"
	If (Swap = "7EquipSwap2")
		Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, % Hkey%Hk%Shortcut " - Type 7: Equipment Swap: Ctrl + Tab/PgUp/PgDn To Alternate Equipment"
	If (Swap = "7GemSwap1")
		Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, % Hkey%Hk%Shortcut " - Type 7: Equipped Gem Swap - Iteration " T7
	If (Swap = "7EquipSwap1")
		Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, % Hkey%Hk%Shortcut " - Type 7: Equipment Swap - Iteration " T7
Return

Type7LCAdd:
	L:= 1
	C:= 1
	Loop {
		IniRead, RadioL%L%C%C%%Swap%Hotkey%Hk%Iteration%T7%, UnrapeKitConfig.ini, %Swap%PositionType7, RadioL%L%C%C%%Swap%Hotkey%Hk%Iteration%T7%
		If (C = 12) {
			C:= 0
			L+= 1
			If (L > 5)
				Break
		}
		C+= 1
	}
	C:= 1
	L:= 1
Return

Type7SwapCoord:
	gosub GuiSD
	Gosub Type7LCCoordAdd
	Gosub Type7SwapWrite1
	Gosub Type7SwapCoord1
	gosub Type7SwapRouting
Return

Type7LCCoordAdd:
	L:= 1
	C:= 1
	Loop {
		If (RadioL%L%C%C%%Swap%Hotkey%Hk%Iteration%T7% = 1) {
			IniWrite, % RadioL%L%C%C%%Swap%Hotkey%Hk%Iteration%T7%, UnrapeKitConfig.ini, %Swap%PositionType7, RadioL%L%C%C%%Swap%Hotkey%Hk%Iteration%T7%
			%Swap%Hotkey%Hk%Iteration%T7%_X:= 1240 + (C*53)
			%Swap%Hotkey%Hk%Iteration%T7%_Y:= 560 + (L*54)
		}
		If (C = 12) {
			C:= 0
			L+= 1
			If (L > 5)
				Break
		}
		C+= 1
	}
	C:= 1
	L:= 1
Return

Type7Radio1:
	L:= 1
	C:= 1
	RadioCX:= -10
	RadioCY:= 459 + L*52
	Loop {
		RadioCX += 39
		var2 = RadioL%L%C%C%%Swap%Hotkey%Hk%Iteration%T7%
		var3:= % var2
		Gui, Add, Radio, % "x" RadioCX " y" RadioCY " h13 w13 v" var3 " Checked" var3
		If (C = 5) or (c = 9) {
			RadioCX += 1
		}
		If (C = 12) {
			C:= 0
			L+= 1
			If (L > 5)
				Break
		}
		C+= 1
	}
	C:= 1
	L:= 1

Type7Radio2:
	For _, socket in SocketList1 {
		var2 = % socket.name
		var3 = %var2%%Swap%AltHotkey%Hk%Iteration%T7%
		RadioCX:= % socket.x
		RadioCY:= % socket.y
		Gui, Add, Radio, % "x" RadioCX " y"RadioCY " w13 h13 v" var3 " Checked" var3
	}
return


Type7Radio3:
	For _, socket in SocketList1 {
		var2 = % socket.name
		var3 = %var2%%Swap%Hotkey%Hk%Iteration%T7%
		RadioCX:= % socket.x
		RadioCY:= % socket.y
		Gui, Add, Radio, % "x" RadioCX " y"RadioCY " w13 h13 v" var3 " Checked" var3
	}
	For _, socket in SocketList2 {
		var2 = % socket.name
		var3 = %var2%%Swap%Hotkey%Hk%Iteration%T7%
		RadioCX:= % socket.x
		RadioCY:= % socket.y
		Gui, Add, Radio, % "x" RadioCX " y"RadioCY " w13 h13 v" var3 " Checked" var3
	}
	For _, socket in SocketList3 {
		var2 = % socket.name
		var3 = %var2%%Swap%Hotkey%Hk%Iteration%T7%
		RadioCX:= % socket.x
		RadioCY:= % socket.y
		Gui, Add, Radio, % "x" RadioCX " y"RadioCY " w13 h13 v" var3 " Checked" var3
	}
return

Type7SwapRouting:
	If (Swap = "7GemSwap2" AND 7GemSwapTab_%Hk% = 2) OR (Swap = "7EquipSwap2" AND 7EquipSwapTab_%Hk% = 2) {
		gosub Type7SwapWrite2
		gosub Type7SwapCoord2
	}
	If (Swap = "7GemSwap1") {
		IniWrite, % %Swap%Hotkey%Hk%Iteration%T7%_X, UnrapeKitConfig.ini, %Swap%CoordinatesType7, %Swap%Hotkey%Hk%Iteration%T7%_X
		IniWrite, % %Swap%Hotkey%Hk%Iteration%T7%_Y, UnrapeKitConfig.ini, %Swap%CoordinatesType7, %Swap%Hotkey%Hk%Iteration%T7%_Y
		Gosub Type7GemSwap2
	}
	If (Swap = "7EquipSwap1") {
		IniWrite, % %Swap%Hotkey%Hk%Iteration%T7%_X, UnrapeKitConfig.ini, %Swap%CoordinatesType7, %Swap%Hotkey%Hk%Iteration%T7%_X
		IniWrite, % %Swap%Hotkey%Hk%Iteration%T7%_Y, UnrapeKitConfig.ini, %Swap%CoordinatesType7, %Swap%Hotkey%Hk%Iteration%T7%_Y
		Gosub Type7EquipSwap2
	}
	If (Swap = "7GemSwap2" AND 7GemSwapTab_%Hk% = 1) {
		IniWrite, % 7GemSwapTab_%Hk%, UnrapeKitConfig.ini, SwapTabs, 7GemSwapTab_%Hk%
		IniWrite, % %Swap%Hotkey%Hk%Iteration%T7%_X, UnrapeKitConfig.ini, %Swap%CoordinatesType7, %Swap%Hotkey%Hk%Iteration%T7%_X
		IniWrite, % %Swap%Hotkey%Hk%Iteration%T7%_Y, UnrapeKitConfig.ini, %Swap%CoordinatesType7, %Swap%Hotkey%Hk%Iteration%T7%_Y
	Return
	}
	If (Swap = "7EquipSwap2" AND 7EquipSwapTab_%Hk% = 1) {
		IniWrite, % 7EquipSwapTab_%Hk%, UnrapeKitConfig.ini, SwapTabs, 7EquipSwapTab_%Hk%
		IniWrite, % %Swap%Hotkey%Hk%Iteration%T7%_X, UnrapeKitConfig.ini, %Swap%CoordinatesType7, %Swap%Hotkey%Hk%Iteration%T7%_X
		IniWrite, % %Swap%Hotkey%Hk%Iteration%T7%_Y, UnrapeKitConfig.ini, %Swap%CoordinatesType7, %Swap%Hotkey%Hk%Iteration%T7%_Y
	Return
	}
	If (Swap = "7GemSwap2" AND 7GemSwapTab_%Hk% = 2) {
		IniWrite, % 7GemSwapTab_%Hk%, UnrapeKitConfig.ini, SwapTabs, 7GemSwapTab_%Hk%
		IniWrite, % %Swap%AltHotkey%Hk%Iteration%T7%_X, UnrapeKitConfig.ini, %Swap%CoordinatesType7, %Swap%AltHotkey%Hk%Iteration%T7%_X
		IniWrite, % %Swap%AltHotkey%Hk%Iteration%T7%_Y, UnrapeKitConfig.ini, %Swap%CoordinatesType7, %Swap%AltHotkey%Hk%Iteration%T7%_Y
	Return
	}
	If (Swap = "7EquipSwap2" AND 7EquipSwapTab_%Hk% = 2) {
		IniWrite, % 7EquipSwapTab_%Hk%, UnrapeKitConfig.ini, SwapTabs, 7EquipSwapTab_%Hk%
		IniWrite, % %Swap%AltHotkey%Hk%Iteration%T7%_X, UnrapeKitConfig.ini, %Swap%CoordinatesType7, %Swap%AltHotkey%Hk%Iteration%T7%_X
		IniWrite, % %Swap%AltHotkey%Hk%Iteration%T7%_Y, UnrapeKitConfig.ini, %Swap%CoordinatesType7, %Swap%AltHotkey%Hk%Iteration%T7%_Y
	Return
	}
return

Type7SwapCoord1:
	for _, socket in SocketList1 {
		var2:= % socket.name
		var3=  %var2%%Swap%Hotkey%Hk%Iteration%T7%
		var4:= % var3
		If (var4 = 1) {
			%Swap%Hotkey%Hk%Iteration%T7%_X:=  % socket.coordX
			%Swap%Hotkey%Hk%Iteration%T7%_Y:=  % socket.coordY
		}
	}
	for _, socket in SocketList2 {
		var2:= % socket.name
		var3=  %var2%%Swap%Hotkey%Hk%Iteration%T7%
		var4:= % var3
		If (var4 = 1) {
			%Swap%Hotkey%Hk%Iteration%T7%_X:=  % socket.coordX
			%Swap%Hotkey%Hk%Iteration%T7%_Y:=  % socket.coordY
		}
	}
	for _, socket in SocketList3 {
		var2:= % socket.name
		var3=  %var2%%Swap%Hotkey%Hk%Iteration%T7%
		var4:= % var3
		If (var4 = 1) {
			%Swap%Hotkey%Hk%Iteration%T7%_X:=  % socket.coordX
			%Swap%Hotkey%Hk%Iteration%T7%_Y:=  % socket.coordY
		}
	}
return

Type7SwapCoord2:
	for _, socket in SocketList1 {
		var2:= % socket.name
		var3=  %var2%%Swap%AltHotkey%Hk%Iteration%T7%
		var4:= % var3
		If (var4 = 1) {
			%Swap%AltHotkey%Hk%Iteration%T7%_X:=  % socket.coordX
			%Swap%AltHotkey%Hk%Iteration%T7%_Y:=  % socket.coordY
		}
	}
Return

Type7SwapRead1:
	for _, socket in SocketList1 {
		var2:= % socket.name
		var3=  %var2%%Swap%Hotkey%Hk%Iteration%T7%
		IniRead, %var3%, UnrapeKitConfig.ini, %Swap%PositionType7, %var3%, %A_Space%
	}
	for _, socket in SocketList2 {
		var2:= % socket.name
		var3=  %var2%%Swap%Hotkey%Hk%Iteration%T7%
		IniRead, %var3%, UnrapeKitConfig.ini, %Swap%PositionType7, %var3%, %A_Space%
	}
	for _, socket in SocketList3 {
		var2:= % socket.name
		var3=  %var2%%Swap%Hotkey%Hk%Iteration%T7%
		IniRead, %var3%, UnrapeKitConfig.ini, %Swap%PositionType7, %var3%, %A_Space%
	}
return

Type7SwapRead2:
	for _, socket in SocketList1 {
		var2:= % socket.name
		var3=  %var2%%Swap%AltHotkey%Hk%Iteration%T7%
		IniRead, %var3%, UnrapeKitConfig.ini, %Swap%PositionType7, %var3%, %A_Space%
	}
return

Type7SwapWrite1:
	for _, socket in SocketList1 {
		var2:= % socket.name
		var3=  %var2%%Swap%Hotkey%Hk%Iteration%T7%
		var4:= % var3
		if (var4 = 1)
			IniWrite, % var4, UnrapeKitConfig.ini, %Swap%PositionType7, %var3%, %A_Space%
	}
	for _, socket in SocketList2 {
		var2:= % socket.name
		var3=  %var2%%Swap%Hotkey%Hk%Iteration%T7%
		var4:= % var3
		if (var4 = 1)
			IniWrite, % var4, UnrapeKitConfig.ini, %Swap%PositionType7, %var3%, %A_Space%
	}
	for _, socket in SocketList3 {
		var2:= % socket.name
		var3=  %var2%%Swap%Hotkey%Hk%Iteration%T7%
		var4:= % var3
		if (var4 = 1)
			IniWrite, % var4, UnrapeKitConfig.ini, %Swap%PositionType7, %var3%, %A_Space%
	}
return

Type7SwapWrite2:
	for _, socket in SocketList1 {
		var2:= % socket.name
		var3=  %var2%%Swap%AltHotkey%Hk%Iteration%T7%
		var4:= % var3
		if (var4 = 1)
			IniWrite, % var4, UnrapeKitConfig.ini, %Swap%PositionType7, %var3%, %A_Space%
	}
return
