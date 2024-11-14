HotkeyConfig:
	MouseGetPos, Xpos, Ypos
	GuiWidth:= 210
	GuiHeight:= 100
	gosub GuiBuild
	Gui, Add, Text, x10 y10, Hotkeys wanted:
	Gui, Add, Text, x50 y33, 200 Hotkeys Maximum
	Gui, Add, Edit, x10 y30 w30 h20 vHotkeyLimit, %HotkeyLimit%
	Gui, Add, Button, x10 y70 w90 h20 gHkeyEdit Default, Hotkeys
	Gui, Add, Button, x110 y70 w90 h20 gCancel, Reload
	Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, Hotkey Count
Return

HkeyEdit:
	gosub GuiSD
	IniWrite, %HotkeyLimit%, UnrapeKitConfig.ini, Hotkeys, HotkeyLimit
	H:= 1
	W:= 1
	HMax:= 1
	Hk:= 1
	MouseGetPos, Xpos, Ypos
	SysGet, SGW, 71
	Gui, -0x80000 AlwaysOnTop
	Loop, %HotkeyLimit% {
		GuiY:= 120 + 30 * H
		ScreenHeight:= A_ScreenHeight - 45
			If (GuiY > ScreenHeight) {
				W+= 1
				HMax:= H
				H= 1
			}
		Y1:= 13 + 30 * H
		Y2:= 10 + 30 * H
		GuiWidth:= 610 * W
			If (W = 1) {
				GuiHeight:= 80 + 30 * H
				ButtonHeight:= 50 + 30 * H
				ButtonTxtHeight:= 53 + 30 * H
			}
			If (W > 1) {
				GuiHeight:= 80 + 30 * HMax
				ButtonHeight:= 50 + 30 * HMax
				ButtonTxtHeight:= 53 + 30 * HMax
			}
		Button1X:= GuiWidth - 300
		Button2X:= GuiWidth - 200
		Button3X:= GuiWidth - 100
		Text1X:= GuiWidth - 550
		Radio0X:= GuiWidth - 590
		Radio1X:= GuiWidth - 520
		Radio2X:= GuiWidth - 480
		Radio3X:= GuiWidth - 440
		Radio4X:= GuiWidth - 400
		Radio5X:= GuiWidth - 360
		Radio6X:= GuiWidth - 320
		Radio7X:= GuiWidth - 280
		EditX:= GuiWidth - 240
		EditButtonX:= GuiWidth -100
		Radio0Txt:= GuiWidth - 600
		Radio1Txt:= GuiWidth - 530
		Radio2Txt:= GuiWidth - 490
		Radio3Txt:= GuiWidth - 450
		Radio4Txt:= GuiWidth - 410
		Radio5Txt:= GuiWidth - 370
		Radio6Txt:= GuiWidth - 330
		Radio7Txt:= GuiWidth - 290
		EditTxt:= GuiWidth - 220
		EditButtonTxt:= GuiWidth -85
		Gui, Add, Text, x%Radio0Txt% y20,Disable  Index
		Gui, Add, Text, x%Radio1Txt% y20,Type 1
		Gui, Add, Text, x%Radio2Txt% y20,Type 2
		Gui, Add, Text, x%Radio3Txt% y20,Type 3
		Gui, Add, Text, x%Radio4Txt% y20,Type 4
		Gui, Add, Text, x%Radio5Txt% y20,Type 5
		Gui, Add, Text, x%Radio6Txt% y20,Type 6
		Gui, Add, Text, x%Radio7Txt% y20,Type 7
		Gui, Add, Text, x%EditTxt% y20, Hotkey Shortcut
		Gui, Add, Text, x%EditButtonTxt% y20, Hotkey Edit
		Gui, Add, Text, x%Text1X% y%Y1%, %Hk%
		Gui, Add, Radio, % "X" Radio0x " Y" Y1 " h13 w13 vHkey" Hk "Toggle Checked" Hkey%Hk%Toggle
		Gui, Add, Radio, % "x" Radio1X " y" Y1 " h13 w13 vHkey" Hk "Type1 Checked" Hkey%Hk%Type1,1
		Gui, Add, Radio, % "x" Radio2X " y" Y1 " h13 w13 vHkey" Hk "Type2 Checked" Hkey%Hk%Type2,2
		Gui, Add, Radio, % "x" Radio3X " y" Y1 " h13 w13 vHkey" Hk "Type3 Checked" Hkey%Hk%Type3,3
		Gui, Add, Radio, % "x" Radio4X " y" Y1 " h13 w13 vHkey" Hk "Type4 Checked" Hkey%Hk%Type4,4
		Gui, Add, Radio, % "x" Radio5X " y" Y1 " h13 w13 vHkey" Hk "Type5 Checked" Hkey%Hk%Type5,5
		Gui, Add, Radio, % "x" Radio6X " y" Y1 " h13 w13 vHkey" Hk "Type6 Checked" Hkey%Hk%Type6,6
		Gui, Add, Radio, % "x" Radio7X " y" Y1 " h13 w13 vHkey" Hk "Type7 Checked" Hkey%Hk%Type7,7
		Gui, Add, Edit, x%EditX% y%Y2% w120 h20 vHkey%Hk%Shortcut, % Hkey%Hk%Shortcut
		Gui, Add, Button, x%EditButtonX% y%Y2% w90 h20 gEditHk, %Hk%
		If (Hk = HotkeyLimit) {
			gosub GuiBuild
			Gui, Add, Button, x10 y%ButtonHeight% w90 H20 gHkAdd, Add
			Gui, Add, Text, x110 y%ButtonTxtHeight%,Add
			Gui, Add, Edit, x140 y%ButtonHeight% w20 h20 vHotkeyAdd
			Gui, Add, Text, x170 y%ButtonTxtHeight%,Hotkey(s)
			Gui, Add, Button, x%Button1X% y%ButtonHeight% w90 h20 gRecordHk Default, Record
			Gui, Add, Button, x%Button2X% y%ButtonHeight% w90 h20 gSetHk, Configure
			Gui, Add, Button, x%Button3X% y%ButtonHeight% w90 h20 gCancel, Reload
			Gui, Show, x%Move_X% y%Move_Y% w%GuiWidth% h%GuiHeight%, Hotkey Configuration
			Break
		}
	H+= 1
	Hk+= 1
	}
Return

WriteHk:
	IniWrite, % Hkey%Hk%Toggle, UnrapeKitConfig.ini, HotkeyToggle, Hkey%Hk%Toggle
	IniWrite, % Hkey%Hk%Type1, UnrapeKitConfig.ini, HotkeyType, Hkey%Hk%Type1
	IniWrite, % Hkey%Hk%Type2, UnrapeKitConfig.ini, HotkeyType, Hkey%Hk%Type2
	IniWrite, % Hkey%Hk%Type3, UnrapeKitConfig.ini, HotkeyType, Hkey%Hk%Type3
	IniWrite, % Hkey%Hk%Type4, UnrapeKitConfig.ini, HotkeyType, Hkey%Hk%Type4
	IniWrite, % Hkey%Hk%Type5, UnrapeKitConfig.ini, HotkeyType, Hkey%Hk%Type5
	IniWrite, % Hkey%Hk%Type6, UnrapeKitConfig.ini, HotkeyType, Hkey%Hk%Type6
	IniWrite, % Hkey%Hk%Type7, UnrapeKitConfig.ini, HotkeyType, Hkey%Hk%Type7
	IniWrite, % Hkey%Hk%Shortcut, UnrapeKitConfig.ini, HotkeyShortcut, Hkey%Hk%Shortcut
		If (Hkey%Hk%Shortcut !=  AND Hkey%Hk%Toggle = 1)
			Hotkey, % Hkey%Hk%Shortcut, Hotkey%Hk%
return

RecordHk:
	gosub GuiSD
	Hk:= 1
	RecordToggle:= 1
	Loop, %HotkeyLimit% {
		gosub WriteHk
		Hk+= 1
	}
	Hk:= 1
	gosub HkeyEdit
Return

HkAdd:
	gosub GuiSD
	HotkeyLimit+= %HotkeyAdd%
	Hk:= 1
	Loop, %HotkeyLimit% {
		gosub WriteHk
		Hk+= 1
	}
	gosub HkeyEdit
Return

SetHk:
	gosub GuiSD
	Hk:= 1
	Loop, %HotkeyLimit% {
		gosub WriteHk
		Hk+= 1
	}
	Hk:= 1
	gosub HkTypeConfigLoop
Return

EditHk:
	A_GuiControlHk:= A_GuiControl
	Hk:= A_GuiControlHk
	If (Hkey%Hk%Toggle = 0)
		Hkey%Hk%Toggle = 1
	gosub GuiSD
	gosub WriteHK
	gosub HkTypeConfigRouting
Return

HkTypeConfigLoop:
	Loop {
			If (Hkey%Hk%Toggle = 1) {
				Hk += 1
			}
			If (Hk > HotKeyLimit) {
				Reload
				Break
			}
			If (Hkey%Hk%Type1 = 1) {
				Gosub ConfigType1
				Break
			}
			If (Hkey%Hk%Type2 = 1) {
				Gosub ConfigType2
				Break
			}
			If (Hkey%Hk%Type3 = 1) {
				Gosub ConfigType3
				Break
			}
			If (Hkey%Hk%Type4 = 1) {
				Gosub ConfigType4
				Break
			}
			If (Hkey%Hk%Type5 = 1) {
				Gosub GemSwap1
				Break
			}
			If (Hkey%Hk%Type6 = 1) {
				Gosub EquipSwap1
				Break
			}
			If (Hkey%Hk%Type7 = 1) {
				Gosub Type7Config
				Break
			}
	}
Return

HkTypeConfigRouting:
	If (Hkey%Hk%Type1 = 1)
		Gosub ConfigType1
	If (Hkey%Hk%Type2 = 1)
		Gosub ConfigType2
	If (Hkey%Hk%Type3 = 1)
		Gosub ConfigType3
	If (Hkey%Hk%Type4 = 1)
		Gosub ConfigType4
	If (Hkey%Hk%Type5 = 1)
		Gosub GemSwap1
	If (Hkey%Hk%Type6 = 1)
		Gosub EquipSwap1
	If (Hkey%Hk%Type7 = 1)
		Gosub Type7Config
Return
