Type4:
	HKeyHkSpell1T4:= HKey%Hk%Spell1T4
	HKeyHkKey:= HKey%Hk%Key
	ImageSearch, , , 1575, 1020, 1630, 1075, % "*10 " HKey%Hk%Spell1T4 "-" Hkey%Hk%Key ".png"
		If ErrorLevel = 0
			SendInput, {%HKeyHkKey%}
		If (ErrorLevel = 1) {
			BlockInput, MouseMove
			MouseGetPos, Xpos, Ypos
			GetKeyState, LButtonState, LButton, P
				If LButtonState = D
					MouseClick, , , , , , U
			MouseMove, KeyX_%Hk%, KeyY_%Hk%
			SetMouseDelay, 40
			MouseClick, , KeyX_%Hk%, KeyY_%Hk%
			SetMouseDelay, %MouseDelay%
			MouseMove,  %HKeyHkSpell1T4%X, %HKeyHkSpell1T4%Y
			SetMouseDelay, 40
			MouseClick, ,  %HKeyHkSpell1T4%X, %HKeyHkSpell1T4%Y
			SetMouseDelay, %MouseDelay%
			MouseMove, Xpos, Ypos
			Sleep, %FrameTime%
			SendInput, {%HKeyHkKey%}
			GetKeyState, LButtonState, LButton, P
				If LButtonState = D
					MouseClick, , , , , , D
			BlockInput, MouseMoveOff
		}
Return