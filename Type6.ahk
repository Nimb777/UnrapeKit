Type6:
	MouseGetPos, Xpos, Ypos
	BlockInput, MouseMove
	GetKeyState, LButtonState, LButton, P
		If LButtonState = D
			MouseClick, , , , , , U
	SendInput, {i}
	Sleep, %FrameTime%
	MouseClick, Left, EquipSwap1Hotkey%Hk%_X, EquipSwap1Hotkey%Hk%_Y
		If (EquipSwapTab_%Hk% = 1) {
			MouseMove, EquipSwap2Hotkey%Hk%_X, EquipSwap2Hotkey%Hk%_Y
			SetMouseDelay, 40
			MouseClick, Left, EquipSwap2Hotkey%Hk%_X, EquipSwap2Hotkey%Hk%_Y
			SetMouseDelay, %MouseDelay%
			MouseMove, EquipSwap1Hotkey%Hk%_X, EquipSwap1Hotkey%Hk%_Y
			SetMouseDelay, 40
			MouseClick, Left, EquipSwap1Hotkey%Hk%_X, EquipSwap1Hotkey%Hk%_Y
			SetMouseDelay, %MouseDelay%
		}
		If (EquipSwapTab_%Hk% = 2) {
			SendInput, {x}
			Sleep, %FrameTime%
			MouseMove, EquipSwap2AltHotkey%Hk%_X, EquipSwap2AltHotkey%Hk%_Y
			SetMouseDelay, 40
			MouseClick, , EquipSwap2AltHotkey%Hk%_X, EquipSwap2AltHotkey%Hk%_Y
			SetMouseDelay, %MouseDelay%
			SendInput, {x}
			Sleep, %FrameTime%
			MouseMove, EquipSwap1AltHotkey%Hk%_X, EquipSwap1AltHotkey%Hk%_Y
			SetMouseDelay, 40
			MouseClick, , EquipSwap1AltHotkey%Hk%_X, EquipSwap1AltHotkey%Hk%_Y
			SetMouseDelay, %MouseDelay%
		}
	SendInput, {i}
	MouseMove, Xpos, Ypos
	GetKeyState, LButtonState, LButton, P
		If LButtonState = D
			MouseClick, , , , , , D
	BlockInput, MouseMoveOff
Return