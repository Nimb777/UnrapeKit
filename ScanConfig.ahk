
ScanConfig:
	IniRead, ScanCount, UnrapeKitConfig.ini, ScanCount, ScanCount
	MouseGetPos, Xpos, Ypos
	GuiWidth:= 210
	GuiHeight:= 100
	gosub GuiBuild
	Gui, Add, Text, x10 y5 w200 h26, Icons Count:
	Gui, Add, Text, x10 y33 w120 h26, Scans:
	Gui, Add, Edit, x145 y30 w30 h21 vScanCount, %ScanCount%
	Gui, Add, Button, x10 y70 w90 h20 gScanDefinitions Default, Definitions
	Gui, Add, Button, x110 y70 w90 h20 gCancel, Reload
	Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, Scan Count
Return

ScanDefinitions:
	gosub GuiSD
	IniWrite, %ScanCount%, UnrapeKitConfig.ini, ScanCount, ScanCount
		Loop, %ScanCount% {
			IniRead, Name%A_Index%, UnrapeKitConfig.ini, Names, Name%A_Index%
			IniRead, IconToggle%A_Index%, UnrapeKitConfig.ini, IconToggle, IconToggle%A_Index%
			IniRead, Line%A_Index%, UnrapeKitConfig.ini, Lines, Line%A_Index%
			NameN:= % Name%A_Index%
			LineN:= % Line%A_Index%
		}
	H:= 1
	W:= 1
	HMax:= 1
	SysGet, SGW, 71
	MouseGetPos, Xpos, Ypos
	Gui, -0x80000 AlwaysOnTop
	Gui, Add, Text, X5 Y10, Toggle       SpellName       Line# (Bottom to Top)
	Loop, %ScanCount% {
		GuiY:= 50 + 30 * H
		ScreenHeight:= A_ScreenHeight - 95
			If (GuiY > ScreenHeight) {
					W+= 1
					HMax:= H
					H= 1
			}
		Y1:= 18 + 30 * H
		Y2:= 15 + 30 * H
		GuiWidth:= 240 * W
			If (W = 1) {
				GuiHeight:= 105 + 30 * H
				AddHeight:= 48 + 30 * H
				AddButtonHeight:= 45 + 30 * H
				ButtonHeight:= 75 + 30 * H
			}
			If (W > 1) {
				GuiHeight:= 105 + 30 * HMax
				AddHeight:= 48 + 30 * HMax
				AddButtonHeight:= 45 + 30 * HMax
				ButtonHeight:= 75 + 30 * HMax
			}
		Button1Width:= GuiWidth - 200
		Button2Width:= GuiWidth - 100
		TextWidth:= GuiWidth - 215
		CheckboxWidth:= GuiWidth - 230
		NameWidth:= GuiWidth - 200
		LineWidth:= GuiWidth - 60
		Gui, Add, Text, x%TextWidth% Y%Y1%, %A_Index%
		Gui, Add, Checkbox, % " x" CheckboxWidth " y" Y1 " h13 w13 vIconToggle" A_Index " Checked" IconToggle%A_Index%
		Gui, Add, Edit, x%NameWidth% y%Y2% w130 h20 vName%A_Index%, % Name%A_Index%
		Gui, Add, Edit, x%LineWidth% y%Y2% w50 h20 vLine%A_Index%, % Line%A_Index%
			If (A_Index = ScanCount) {
				X_Offset:= GuiWidth/2
				Y_Offset:= GuiHeight/2
				X_Limit:= A_ScreenWidth - X_Offset
				Y_Limit:= A_ScreenHeight - Y_Offset
				Mouse_X:= Xpos - X_Offset
				Mouse_Y:= Ypos - Y_Offset
					If Xpos between 0 and %X_Offset%
						Move_X:= 0
					If Xpos between %X_Offset% and %X_Limit%
						Move_X:= Mouse_X
					If Xpos between %X_Limit% and %A_ScreenWidth%
						Move_X:= A_ScreenWidth - GuiWidth
					If Ypos between 0 and %Y_Offset%
						Move_Y:= 0
					If Ypos between %Y_Offset% and %Y_Limit%
						Move_Y:= Mouse_Y
					If Ypos between %Y_Limit% and %A_ScreenHeight%
						Move_Y:= A_ScreenHeight - GuiHeight - 30
				Gui, Add, Button, x10 y%AddButtonHeight% w90 h20 gAddScan, Add
				Gui, Add, Text, x110 y%AddHeight%, Add
				Gui, Add, Edit, x140 y%AddButtonHeight% w30 h20 vXDefinitions
				Gui, Add, Text, x180 y%AddHeight%, Definition(s)
				Gui, Add, Button, x%Button1Width% y%ButtonHeight% w90 h20 gScanWrite Default, Record
				Gui, Add, Button, x%Button2Width% y%ButtonHeight% w90 h20 gCancel, Reload
				Gui, Show, x%Move_X% y%Move_Y% w%GuiWidth% h%GuiHeight%, Scan Configuration
				Break
			}
		H+= 1
	}
Return

AddScan:
	Gui, Submit
	Gui, Destroy
	N:= 1
	Loop, %ScanCount% {
		IniWrite, % IconToggle%A_Index%, UnrapeKitConfig.ini, IconToggle, IconToggle%A_Index%
		IniWrite, % Name%A_Index%, UnrapeKitConfig.ini, Names, Name%A_Index%
		IniWrite, % Line%A_Index%, UnrapeKitConfig.ini, Lines, Line%A_Index%
		N+=1
	}
	ScanCount+= %XDefinitions%
	Gosub ScanDefinitions
Return

ScanWrite:
	Gui, Submit
	Gui, Destroy
	N:= 1
	Loop, %ScanCount% {
		IniWrite, % IconToggle%A_Index%, UnrapeKitConfig.ini, IconToggle, IconToggle%A_Index%
		IniWrite, % Name%A_Index%, UnrapeKitConfig.ini, Names, Name%A_Index%
		IniWrite, % Line%A_Index%, UnrapeKitConfig.ini, Lines, Line%A_Index%
		N+=1
	}
	Gosub SpellScan
Return
