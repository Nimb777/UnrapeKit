Type2:
	HKeyHkSpell1:= HKey%Hk%Spell1
	HKeyHkSpell2:= HKey%Hk%Spell2
	HKeyHkKey:= HKey%Hk%Key
	MouseGetPos, Xpos, Ypos
	BlockInput, MouseMove
	GetKeyState, LButtonState, LButton, P
		If LButtonState = D
			MouseClick, , , , , , U
	If (Hkey%Hk%AltEquiptoggle = 1)
		Send, {X Down}
	MouseMove, KeyX_%Hk%, KeyY_%Hk%
	SetMouseDelay, 40
	MouseClick, , KeyX_%Hk%, KeyY_%Hk%
	SetMouseDelay, %MouseDelay%
	MouseMove,  %HKeyHkSpell1%X, %HKeyHkSpell1%Y
	SetMouseDelay, 40
	MouseClick, ,  %HKeyHkSpell1%X, %HKeyHkSpell1%Y
	SetMouseDelay, %MouseDelay%
		If (Type2MoveToggleHotkey%Hk% = 1) {
			MouseMove, Xpos, Ypos
			Sleep, %FrameTime%
		}
	SendInput, {%HKeyHkKey%}
	MouseMove, KeyX_%Hk%, KeyY_%Hk%
	SetMouseDelay, 40
	MouseClick, , KeyX_%Hk%, KeyY_%Hk%
	SetMouseDelay, %MouseDelay%
	MouseMove, %HKeyHkSpell2%X, %HKeyHkSpell2%Y
	SetMouseDelay, 40
	MouseClick, , %HKeyHkSpell2%X, %HKeyHkSpell2%Y
	If (Hkey%Hk%AltEquiptoggle = 1) {
		Send, {X Up}
		Sleep, %FrameTime%
		Sleep, %FrameTime%
		Send, {X}
	}
	SetMouseDelay, %MouseDelay%
	MouseMove, Xpos, Ypos
	GetKeyState, LButtonState2, LButton, P
		If LButtonState2 = D
			MouseClick, , , , , , D
	BlockInput, MouseMoveOff
Return