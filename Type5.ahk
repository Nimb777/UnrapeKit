Type5:
	MouseGetPos, Xpos, Ypos
	BlockInput, MouseMove
	GetKeyState, LButtonState, LButton, P
		If LButtonState = D
			MouseClick, , , , , , U
	SendInput, {i}
	Sleep, %FrameTime%
	SetMouseDelay, 40
	MouseClick, Right, GemSwap1Hotkey%Hk%_X, GemSwap1Hotkey%Hk%_Y
		If (GemSwapTab_%Hk% = 1) {
			MouseMove, GemSwap2Hotkey%Hk%_X, GemSwap2Hotkey%Hk%_Y
			SetMouseDelay, 40
			MouseClick, Left, GemSwap2Hotkey%Hk%_X, GemSwap2Hotkey%Hk%_Y
			SetMouseDelay, %MouseDelay%
			MouseMove, GemSwap1Hotkey%Hk%_X, GemSwap1Hotkey%Hk%_Y
			SetMouseDelay, 40
			MouseClick, Left, GemSwap1Hotkey%Hk%_X, GemSwap1Hotkey%Hk%_Y
			SetMouseDelay, %MouseDelay%
		}
		If (GemSwapTab_%Hk% = 2) {
			SendInput, {x}
			Sleep, %FrameTime%
			MouseMove, GemSwap2AltX%Hk%, GemSwap2AltY%Hk%
			SetMouseDelay, 40
			MouseClick, , GemSwap2AltX%Hk%, GemSwap2AltY%Hk%
			SetMouseDelay, %MouseDelay%
			SendInput, {x}
			Sleep, %FrameTime%
			MouseMove, GemSwap1AltHotkey%Hk%_X, GemSwap1AltHotkey%Hk%_Y
			SetMouseDelay, 40
			MouseClick, , GemSwap1Hotkey%Hk%_X, GemSwap1Hotkey%Hk%_Y
			SetMouseDelay, %MouseDelay%
		}
	SendInput, {i}
	MouseMove, Xpos, Ypos
	GetKeyState, LButtonState, LButton, P
		If LButtonState = D
			MouseClick, , , , , , D
	BlockInput, MouseMoveOff
Return
