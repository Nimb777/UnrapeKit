Type7:
	T7:= 1
	MouseGetPos, Xpos, Ypos
	Loop, % Hkey%Hk%Iterations {
			If (Hkey%Hk%Iteration%T7% = "SpellScan") {
				Gosub SpellScan
			}
			If (Hkey%Hk%Iteration%T7% = "ImageSearch") {
				gosub T7ImageSearch
			}
			If (Hkey%Hk%Iteration%T7% = "Spell") {
				gosub T7Spell
			}
			If (Hkey%Hk%Iteration%T7% = "SendInput") {
				gosub T7SendInput
			}
			If (Hkey%Hk%Iteration%T7% = "GetMousePos") {
				gosub T7GetMouse
			}
			If (Hkey%Hk%Iteration%T7% = "GoMousePos") {
				gosub T7GoMouse
			}
			If (Hkey%Hk%Iteration%T7% = "MouseMove") {
				gosub T7MouseMove
			}
			If (Hkey%Hk%Iteration%T7% = "Delay") {
				Sleep, % HKey%Hk%DelayIteration%T7%
			}
			If (Hkey%Hk%Iteration%T7% = "GemSwap") {
				gosub T7GemSwap
			}
			If (Hkey%Hk%Iteration%T7% = "EquipmentSwap") {
				gosub T7EquipSwap
			}
		T7+= 1
	}
	MouseMove, Xpos, Ypos
Return

T7Routing:
Return

T7ImageSearch:
	;BlockInput, MouseMove
	GetKeyState, LButtonState, LButton, P
		If LuttonState = D
			MouseClick, , , , , , U
	MouseMove, A_ScreenWidth, A_ScreenHeight
	Loop {
		ImageSearch, HKey%Hk%MouseXPosIteration%T7%, HKey%Hk%MouseYPosIteration%T7%, ScanCoordinatesHotkey%Hk%Iteration%T7%_L, ScanCoordinatesHotkey%Hk%Iteration%T7%_T, ScanCoordinatesHotkey%Hk%Iteration%T7%_R, ScanCoordinatesHotkey%Hk%Iteration%T7%_B, % "*" ShadeVariationHotkey%Hk%Iteration%T7% " " ImageNameHotkey%Hk%Iteration%T7% ".png"
			If (ErrorLevel = 2) {
				MsgBox % "Search Failed for image " ImageNameHotkey%Hk%Iteration%T7%
				break
			}
			If (ErrorLevel = 1) {
				MsgBox % "Search could not find image " ImageNameHotkey%Hk%Iteration%T7%
				break
			}
			If (ErrorLevel = 0) {
				ToolTip, % HKey%Hk%MouseXPosIteration%T7% ", " HKey%Hk%MouseYPosIteration%T7%
				SetTimer, RemoveToolTip, 500
				break
			}
	}
	GetKeyState, LButtonState, LButton, P
		If LButtonState = D
			MouseClick, , , , , , D
;			BlockInput, MouseMoveOff
return

T7Spell:
	HKeyHkSpellIterationT7:= HKey%Hk%SpellIteration%T7%
	BlockInput, MouseMove
	GetKeyState, LButtonState, LButton, P
		If LButtonState = D
			MouseClick, , , , , , U
	MouseMove, KeyX_%Hk%Iteration%T7%, KeyY_%Hk%Iteration%T7%
	Sleep, %FrameTime%
	MouseClick, ,  KeyX_%Hk%Iteration%T7%, KeyY_%Hk%Iteration%T7%
	Sleep, %FrameTime%
	MouseMove, %HKeyHkSpellIterationT7%X, %HKeyHkSpellIterationT7%Y
	SetMouseDelay, 40
	MouseClick, , %HKeyHkSpellIterationT7%X, %HKeyHkSpellIterationT7%Y
	SetMouseDelay, %MouseDelay%
	GetKeyState, LButtonState, LButton, P
		If LButtonState = D
			MouseClick, , , , , , D
	BlockInput, MouseMoveOff
return

T7SendInput:
	HKeyHkSendIterationT7:= HKey%Hk%SendIteration%T7%
	SendInput, {%HKeyHkSendIterationT7%}
return

T7GetMouse:
	If (Hkey%Hk%GetMousePosToggleIteration%T7% = 1) {
		BlockInput, MouseMove
		GetKeyState, LButtonState, LButton, P
		If LButtonState = D
			MouseClick, , , , , , U
		MouseGetPos, HKey%Hk%MouseXPosIteration%T7%, HKey%Hk%MouseYPosIteration%T7%
			SetTimer, RemoveToolTip, -500
		GetKeyState, LButtonState, LButton, P
		If LButtonState = D
			MouseClick, , , , , , D
		BlockInput, MouseMoveOff
	}
return

T7GoMouse:
	MouseT7:= HKey%Hk%GoMousePosIteration%T7%
	BlockInput, MouseMove
	GetKeyState, LButtonState, LButton, P
		If LButtonState = D
			MouseClick, , , , , , U
	MouseMove, HKey%Hk%MouseXPosIteration%MouseT7%, HKey%Hk%MouseYPosIteration%MouseT7%
	Tooltip, % "x: " HKey%Hk%MouseXPosIteration%MouseT7% ", y: "HKey%Hk%MouseYPosIteration%MouseT7%
		SetTimer, RemoveToolTip, -500
	GetKeyState, LButtonState, LButton, P
		If LButtonState = D
			MouseClick, , , , , , D
	BlockInput, MouseMoveOff
return

T7MouseMove:
	BlockInput, MouseMove
	GetKeyState, LButtonState, LButton, P
		If LButtonState = D
			MouseClick, , , , , , U
	MouseMove, HKey%Hk%MouseXPosIteration%T7%, HKey%Hk%MouseYPosIteration%T7%
	Tooltip, % "x: " HKey%Hk%MouseXPosIteration%T7% ", y: "HKey%Hk%MouseYPosIteration%T7%
		SetTimer, RemoveToolTip, -500
	GetKeyState, LButtonState, LButton, P
		If LButtonState = D
				MouseClick, , , , , , D
	BlockInput, MouseMoveOff
return

T7GemSwap:
	BlockInput, MouseMove
	GetKeyState, LButtonState, LButton, P
		If LButtonState = D
			MouseClick, , , , , , U
	SendInput, {i}
	Sleep, %FrameTime%
	MouseMove, GemSwap1Hotkey%Hk%Iteration%T7%_X, GemSwap1Hotkey%Hk%Iteration%T7%_Y
	SetMouseDelay, 40
	MouseClick, Right, GemSwap1Hotkey%Hk%Iteration%T7%_X, GemSwap1Hotkey%Hk%Iteration%T7%_Y
	SetMouseDelay, %MouseDelay%
	If (GemSwapTab_%Hk% = 1) {
		MouseMove, GemSwap2Hotkey%Hk%Iteration%T7%_X, GemSwap2Hotkey%Hk%Iteration%T7%_Y
		SetMouseDelay, 40
		MouseClick, , GemSwap2Hotkey%Hk%Iteration%T7%_X, GemSwap2Hotkey%Hk%Iteration%T7%_Y
		SetMouseDelay, %MouseDelay%
		MouseMove, GemSwap1Hotkey%Hk%Iteration%T7%_X, GemSwap1Hotkey%Hk%Iteration%T7%_Y
		SetMouseDelay, 40
		MouseClick, , GemSwap1Hotkey%Hk%Iteration%T7%_X, GemSwap1Hotkey%Hk%Iteration%T7%_Y
		SetMouseDelay, %MouseDelay%
	}
	If (GemSwapTab_%Hk% = 2) {
		SendInput, {x}
		Sleep, %FrameTime%
		MouseMove, GemSwap2AltHotkey%Hk%Iteration%T7%_X, GemSwap2AltHotkey%Hk%Iteration%T7%_Y
		SetMouseDelay, 40
		MouseClick, , GemSwap2AltHotkey%Hk%Iteration%T7%_X, GemSwap2AltHotkey%Hk%Iteration%T7%_Y
		SetMouseDelay, %MouseDelay%
		SendInput, {x}
		Sleep, %FrameTime%
		MouseMove, GemSwap1Hotkey%Hk%Iteration%T7%_X, GemSwap1Hotkey%Hk%Iteration%T7%_Y
		SetMouseDelay, 40
		MouseClick, , GemSwap1Hotkey%Hk%Iteration%T7%_X, GemSwap1Hotkey%Hk%Iteration%T7%_Y
		SetMouseDelay, %MouseDelay%
	}
	SendInput, {i}
	GetKeyState, LButtonState, LButton, P
		If LButtonState = D
			MouseClick, , , , , , D
	BlockInput, MouseMoveOff
return

T7EquipSwap:
	BlockInput, MouseMove
	GetKeyState, LButtonState, LButton, P
		If LButtonState = D
			MouseClick, , , , , , U
	SendInput, {i}
	Sleep, %FrameTime%
	MouseMove, EquipSwap1Hotkey%Hk%Iteration%T7%_X, EquipSwap1Hotkey%Hk%Iteration%T7%_Y
	SetMouseDelay, 40
	MouseClick, , EquipSwap1Hotkey%Hk%Iteration%T7%_X, EquipSwap1Hotkey%Hk%Iteration%T7%_Y
	SetMouseDelay, %MouseDelay%
	If (EquipSwapTab_%Hk% = 1) {
		MouseMove, EquipSwap2Hotkey%Hk%Iteration%T7%_X, EquipSwap2Hotkey%Hk%Iteration%T7%_Y
		SetMouseDelay, 40
		MouseClick, , EquipSwap2Hotkey%Hk%Iteration%T7%_X, EquipSwap2Hotkey%Hk%Iteration%T7%_Y
		SetMouseDelay, %MouseDelay%
		MouseMove, EquipSwap1Hotkey%Hk%Iteration%T7%_X, EquipSwap1Hotkey%Hk%Iteration%T7%_Y
		SetMouseDelay, 40
		MouseClick, , EquipSwap1Hotkey%Hk%Iteration%T7%_X, EquipSwap1Hotkey%Hk%Iteration%T7%_Y
		SetMouseDelay, %MouseDelay%
	}
	If (EquipSwapTab_%Hk% = 2) {
		SendInput, {x}
		Sleep, %FrameTime%
		MouseMove, EquipSwap2AltHotkey%Hk%Iteration%T7%_X, EquipSwap2AltHotkey%Hk%Iteration%T7%_Y
		SetMouseDelay, 40
		MouseClick, , EquipSwap2AltHotkey%Hk%Iteration%T7%_X, EquipSwap2AltHotkey%Hk%Iteration%T7%_Y
		SetMouseDelay, %MouseDelay%
		SendInput, {x}
		Sleep, %FrameTime%
		MouseMove, EquipSwap1Hotkey%Hk%Iteration%T7%_X, EquipSwap1Hotkey%Hk%Iteration%T7%_Y
		SetMouseDelay, 40
		MouseClick, , EquipSwap1Hotkey%Hk%Iteration%T7%_X, EquipSwap1Hotkey%Hk%Iteration%T7%_Y
		SetMouseDelay, %MouseDelay%
	}
	SendInput, {i}
	GetKeyState, LButtonState, LButton, P
		If LButtonState = D
			MouseClick, , , , , , D
	BlockInput, MouseMoveOff
return