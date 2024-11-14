SpellScan:
	MouseGetPos, Xpos, Ypos
	BlockInput, MouseMove
	GetKeyState, LButtonState, LButton
		If LButtonState = D
			MouseClick, , , , , , U
	MouseMove, 1660, 1025 ; t
	Sleep, %Delay%
	MouseClick, , 1660, 1025 ; t
	Sleep, %Delay%
	ToolTipIndex:= 1
	Loop, %ScanCount% {
		IniRead, IconToggle%A_Index%, UnrapeKitConfig.ini, IconToggle, IconToggle%A_Index%
		If (IconToggle%A_Index% = 1) {
			ToolTipIndex += 1
			IniRead, Name%A_Index%, UnrapeKitConfig.ini, Names, Name%A_Index%
			IniRead, Line%A_Index%, UnrapeKitConfig.ini, Lines, Line%A_Index%
			NameN:= % Name%A_Index%
			LineN:= % Line%A_Index%
			CaptureName%A_Index%:= % Name%A_Index% "" Line%A_Index%
			ImageSearch, %NameN%X, %NameN%Y, 1410, 410, 1605, 925, *10 %NameN%%LineN%.png
				If(ErrorLevel = 0) {
					Tooltip, % CaptureName%A_Index% ":= " %NameN%X "x, " %NameN%Y "y", 1700, 1050 - (21 * ToolTipIndex), %ToolTipIndex%
					SetTimer, RemoveToolTip%tooltipindex%, -9500
					IniWrite, % %NameN%X, UnrapeKitConfig.ini, SpellCoordinates, %NameN%X
					IniWrite, % %NameN%Y, UnrapeKitConfig.ini, SpellCoordinates, %NameN%Y
				}
				If(ErrorLevel = 1) {
					Tooltip, % CaptureName%A_Index% " not found" , 1700, 1050 - (21 * ToolTipIndex), %ToolTipIndex%
					SetTimer, RemoveToolTip%tooltipindex%, -5000
				}
				If(ErrorLevel = 2) {
					Tooltip, % CaptureName%A_Index% ": Error " , 1700, 1050 - (21 * ToolTipIndex), %ToolTipIndex%
					SetTimer, RemoveToolTip%tooltipindex%, -5000
				}
		}
	}
	Send, {Esc}
	GetKeyState, LButtonState, LButton, P
		If LButtonState = D
			MouseClick, , , , , , D
	MouseMove, Xpos, Ypos
	SetTimer, RemoveTooltip, -1000
	BlockInput, MouseMoveOff
Return
