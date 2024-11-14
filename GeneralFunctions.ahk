GuiBuild:
    X_Offset := GuiWidth / 2
    Y_Offset := GuiHeight / 2
    If (Xpos < X_Offset)
        Move_X := 0
    Else If (Xpos < A_ScreenWidth - X_Offset)
        Move_X := Xpos - X_Offset
    Else
        Move_X := A_ScreenWidth - GuiWidth
    If (Ypos < Y_Offset)
        Move_Y := 0
    Else If (Ypos < A_ScreenHeight - Y_Offset)
        Move_Y := Ypos - Y_Offset
    Else
        Move_Y := A_ScreenHeight - GuiHeight - 30
    Gui, -0x80000 AlwaysOnTop
return

HotkeySetup:
	gosub HotkeySetupRead
    Loop, %HotKeyLimit% {
		If Hkey%A_Index%Toggle = 0
			Hotkey, % Hkey%A_Index%Shortcut, Hotkey%A_Index%
		If (Hkey%A_Index%Type1 = 1) {
			gosub Type1Load
		}
		If (Hkey%A_Index%Type2 = 1) {
			gosub Type2Load
		}
		If (Hkey%A_Index%Type3 = 1) {
			gosub Type3Load
		}
		If (Hkey%A_Index%Type4 = 1) {
			gosub Type4Load
		}
		If (Hkey%A_Index%Type5 = 1) {
			gosub Type5Load
		}
		If (Hkey%A_Index%Type6 = 1) {
			gosub Type6Load
		}
		If (Hkey%A_Index%Type7 = 1) {
			gosub Type7Load
		}
	}
return

KeyWrite:
		If (Hkey%Hk%Key = "Q") {
			KeyX_%Hk%:= 1440
			KeyY_%Hk%:= 1045
		}
		If (Hkey%Hk%Key = "W") {
			KeyX_%Hk%:= 1495
			KeyY_%Hk%:= 1045
		}
		If (Hkey%Hk%Key = "E") {
			KeyX_%Hk%:= 1550
			KeyY_%Hk%:= 1045
		}
		If (Hkey%Hk%Key = "R") {
			KeyX_%Hk%:= 1605
			KeyY_%Hk%:= 1045
		}
		If (Hkey%Hk%Key = "T") {
			KeyX_%Hk%:= 1655
			KeyY_%Hk%:= 1045
		}
		If (Hkey%Hk%Key = "LButton") {
			KeyX_%Hk%:= 1550
			KeyY_%Hk%:= 975
		}
		If (Hkey%Hk%Key = "MButton") {
			KeyX_%Hk%:= 1600
			KeyY_%Hk%:= 975
		}
		If (Hkey%Hk%Key = "RButton") {
			KeyX_%Hk%:= 1650
			KeyY_%Hk%:= 975
		}
	IniWrite, % KeyX_%Hk%, UnrapeKitConfig.ini, KeyCoordinates, KeyX_%Hk%
	IniWrite, % KeyY_%Hk%, UnrapeKitConfig.ini, KeyCoordinates, KeyY_%Hk%
	Hk += 1
	if (A_GuiControlHk is Integer) {
		Gosub HkeyEdit
	} Else {
		Gosub HkTypeConfigLoop
	}
Return

GuiSD:
    Gui, Submit
    Gui, Destroy
Return

RemoveToolTip:
    ToolTip
Return
RemoveToolTip2:
ToolTip,,,, 2
return
RemoveToolTip3:
ToolTip,,,, 3
return
RemoveToolTip4:
ToolTip,,,, 4
return
RemoveToolTip5:
ToolTip,,,, 5
return
RemoveToolTip6:
ToolTip,,,, 6
return
RemoveToolTip7:
ToolTip,,,, 7
return
RemoveToolTip8:
ToolTip,,,, 8
return
RemoveToolTip9:
ToolTip,,,, 9
return
RemoveToolTip10:
ToolTip,,,, 10
return
RemoveToolTip11:
ToolTip,,,, 11
return
RemoveToolTip12:
ToolTip,,,, 12
return
RemoveToolTip13:
ToolTip,,,, 13
return
RemoveToolTip14:
ToolTip,,,, 14
return
RemoveToolTip15:
ToolTip,,,, 15
return
RemoveToolTip16:
ToolTip,,,, 16
return
RemoveToolTip17:
ToolTip,,,, 17
return
RemoveToolTip18:
ToolTip,,,, 18
return
RemoveToolTip19:
ToolTip,,,, 19
return
RemoveToolTip20:
ToolTip,,,, 20
return