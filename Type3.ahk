Type3:
	HKeyHkSpell1:= HKey%Hk%Spell1
	HKeyHkSpell2:= HKey%Hk%Spell2
	HKeyHkKey:= HKey%Hk%Key
	HKey%Hk%Keytoggle:= !HKey%Hk%Keytoggle
	If HKey%Hk%Keytoggle {
		MouseGetPos, Xpos, Ypos
		BlockInput, MouseMove
		GetKeyState, LButtonState, LButton, P
			If LButtonState = D
				MouseClick, , , , , , U
		MouseMove, KeyX_%Hk%, KeyY_%Hk%
		SetMouseDelay, 40
		MouseClick, , KeyX_%Hk%, KeyY_%Hk%
		SetMouseDelay, %MouseDelay%
		MouseMove, %HKeyHkSpell1%X, %HKeyHkSpell1%Y
		SetMouseDelay, 40
		MouseClick, , %HKeyHkSpell1%X, %HKeyHkSpell1%Y
		SetMouseDelay, %MouseDelay%
		MouseMove, Xpos, Ypos
			If (Type3Cast1ToggleHotkey%Hk% = 1) {
				Sleep, %FrameTime%
				SendInput, {%HKeyHkKey%}
			}
		GetKeyState, LButtonState, LButton, P
			If LButtonState = D
				MouseClick, , , , , , D
		BlockInput, MouseMoveOff
	Return
	}
	If !HKey%Hk%Keytoggle {
		MouseGetPos, Xpos, Ypos
		BlockInput, MouseMove
			GetKeyState, LButtonState, LButton, P
				If LButtonState = D
					MouseClick, , , , , , U
		MouseMove, KeyX_%Hk%, KeyY_%Hk%
		SetMouseDelay, 40
		MouseClick, , KeyX_%Hk%, KeyY_%Hk%
		SetMouseDelay, %MouseDelay%
		MouseMove, %HKeyHkSpell2%X, %HKeyHkSpell2%Y
		SetMouseDelay, 40
		MouseClick, , %HKeyHkSpell2%X, %HKeyHkSpell2%Y
		SetMouseDelay, %MouseDelay%
		MouseMove, Xpos, Ypos
			If (Type3Cast2ToggleHotkey%Hk% = 1) {
				Sleep, %FrameTime%
				SendInput, {%HKeyHkKey%}
			}
		GetKeyState, LButtonState, LButton, P
			If LButtonState = D
				MouseClick, , , , , , D
		BlockInput, MouseMoveOff
	Return
	}
	SetTimer, RemoveToolTip, -500
Return