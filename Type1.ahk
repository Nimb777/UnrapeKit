Type1:
	HkT1:= Hk
	If (T1%HkT1% = 1) {
		Gosub V1Loop
		return
	}

	If (T1%HkT1% = 2) 0r (T1%HkT1% = 3){
		i:= TriggeredCount%HkT1% + 1
		Loop, %i% {
			Cooldown:= Hkey%HkT1%T1Cooldown%A_Index%
			HKeyHkT1KeyTrigN:= HKey%HkT1%Key%A_Index%
			If (HKey%HkT1%Key%TrigN% = LButton) {
				Tx:= 1549
				Ty:= 952
				color:= 0x343233
			}
			If (HKey%HkT1%Key%TrigN% = MButton) {
				Tx:= 1604
				Ty:= 952
				color:= 0x5D5B5B
			}
			If (HKey%HkT1%Key%TrigN% = RButton) {
				Tx:= 1660
				Ty:= 952
				color:= 0x605A5D
			}
			If (HKey%HkT1%Key%TrigN% = Q) {
				Tx:= 1438
				Ty:= 1021
				color:= 0x625D5F
			}
			If (HKey%HkT1%Key%TrigN% = W) {
				Tx:= 1493
				Ty:= 1021
				color:= 0x5E5C5D
			}
			If (HKey%HkT1%Key%TrigN% = E) {
				Tx:= 1549
				Ty:= 1021
				color:= 0x5D5B5C
			}
			If (HKey%HkT1%Key%TrigN% = R) {
				Tx:= 1605
				Ty:= 1021
				color:= 0x5D5B5B
			}
			If (HKey%HkT1%Key%TrigN% = T) {
				Tx:= 1661
				Ty:= 1021
				color:= "0x5C5A5B"
			}
		}
		If (T1%HkT1% = 2) {
			Gosub V2Loop
			return
		}

		If (T1%HkT1% = 3){
			Gosub V3Loop
			return
		}
		return
	}

Return

V1Loop:
	Trig:= 3
	CooldownCount:= 0
	CoolDown%Trig%:= 0
	HKeyHkT1Spell1:= HKey%HkT1%Spell1
	HKeyHkT1Spell2:= HKey%HkT1%Spell2
	HKeyHkT1Key:= HKey%HkT1%Key
	HKey%HkT1%KeyToggle:= !HKey%HkT1%KeyToggle
	If HKey%HkT1%KeyToggle {
		While HKey%HkT1%KeyToggle {
			ImageSearch, , , 0, 0, 1000, 90, % "*10 " HKey%HkT1%Spell1 "Timer.png"
				If (ErrorLevel = 0) {
					CooldownCount+= 1
					HKey%HkT1%Spell1Timer:= True
				}
				If (ErrorLevel = 1) {
					loop, 7 {
						Var:= A_Index + 1
						ImageSearch, , , 0, 0, 1000, 80, % "*10 " HKey%HkT1%Spell1 "Timer" var ".png"
						If (ErrorLevel = 0) {
							CooldownCount+= 1
							HKey%HkT1%Spell1Timer:= True
							break
						}
						if (ErrorLevel = 1) and (A_Index = 7) {
							HKey%HkT1%Spell1Timer:= False
							break
						}
					}
				}
				If (HKey%HkT1%Spell1timer = False) {
					If CooldownCount >= 1
						Sleep, % T1Cooldown%HK%
					ImageSearch, , , 1575, 1020, 1630, 1075, % "*10 " HKey%HkT1%Spell1 "-" HKey%HkT1%Key ".png"
						If (ErrorLevel = 0 AND HKey%HkT1%KeyToggle = 1) {
							GetKeyState, LButtonState, LButton, P
								If LButtonState = D
									MouseClick, , , , , , U
							SendInput, {%HKeyHkT1Key%}
							GetKeyState, LButtonState, LButton, P
								If LButtonState = D
									MouseClick, , , , , , D
						}
						If (ErrorLevel = 1 AND HKey%HkT1%KeyToggle = 1) {
							MouseGetPos, Xpos, Ypos
							BlockInput, MouseMove
							GetKeyState, LButtonState, LButton, P
								If LButtonState = D
									MouseClick, , , , , , U
							MouseMove, KeyX_%HkT1%, KeyY_%HkT1%
							SetMouseDelay, 40
							MouseClick, , KeyX_%HkT1%, KeyY_%HkT1%
							SetMouseDelay, %MouseDelay%
							MouseMove, %HKeyHkT1Spell1%X, %HKeyHkT1Spell1%Y
							SetMouseDelay, 40
							MouseClick, , %HKeyHkT1Spell1%X, %HKeyHkT1Spell1%Y
							SetMouseDelay, %MouseDelay%
							MouseMove, Xpos, Ypos
							Sleep, %FrameTime%
							SendInput, {%HKeyHkT1Key%}
							GetKeyState, LButtonState, LButton, P
								If LButtonState = D
									MouseClick, , , , , , D
							BlockInput, MouseMoveOff
						}
				}
			While HKey%HkT1%KeyToggle {
				If (TriggeredCount%Hk% = 0)
					Break
				If (TriggerToggle%Trig%_%HkT1% = 1) {
					ImageSearch, , , 0, 0, 1000, 90, % "*10 " HKey%HkT1%Spell%Trig% "Timer.png"
						If (ErrorLevel = 0) {
							CoolDown%Trig%+= 1
							HKey%HkT1%Spell%Trig%Timer:= True
						}
						If (ErrorLevel = 1) {
							loop, 7 {
								var:= A_Index + 1
								ImageSearch, , , 0, 0, 1000, 80, % "*10 " HKey%HkT1%Spell%Trig% "Timer" var ".png"
									If (ErrorLevel = 0) {
										CoolDown%Trig%+= 1
										HKey%HkT1%Spell%Trig%Timer:= True
										break
									}
									if (ErrorLevel = 1) and (A_Index = 7) {
										HKey%HkT1%Spell%Trig%Timer:= False
										break
									}
							}
						}
						If (HKey%HkT1%Spell%Trig%timer = False) {
							Sleep, % HKey%Hk%T1Cooldown%TrigN%
							ImageSearch, , , 1575, 1020, 1630, 1075, % "*10 " HKey%hKT1%Spell%Trig% "-" HKey%HkT1%Key ".png"
								If (ErrorLevel = 0 AND HKey%HkT1%KeyToggle = 1) {
									GetKeyState, LButtonState, LButton, P
										if LButtonState = D
											MouseClick, , , , , , U
									SendInput, {%HKeyHkT1Key%}
									GetKeyState, LButtonState, LButton, P
										If LButtonState = D
											MouseClick, , , , , , D
								}
								If (ErrorLevel = 1 AND HKey%HkT1%KeyToggle = 1) {
									HKeyHkT1SpellTrig:= HKey%HkT1%Spell%Trig%
									MouseGetPos, Xpos, Ypos
									BlockInput, MouseMove
									GetKeyState, LButtonState, LButton, P
										if LButtonState = D
											MouseClick, , , , , , U
									MouseMove, KeyX_%HkT1%, KeyY_%HkT1%
									SetMouseDelay, 40
									MouseClick, , KeyX_%HkT1%, KeyY_%HkT1%
									SetMouseDelay, %MouseDelay%
									MouseMove, %HKeyHkT1SpellTrig%X, %HKeyHkT1SpellTrig%Y
									SetMouseDelay, 40
									MouseClick, , %HKeyHkT1SpellTrig%X, %HKeyHkT1SpellTrig%Y
									SetMouseDelay, %MouseDelay%
									MouseMove, Xpos, Ypos
									Sleep, %FrameTime%
									SendInput, {%HKeyHkT1Key%}
									GetKeyState, LButtonState, LButton, P
										If LButtonState = D
											MouseClick, , , , , , D
									BlockInput, MouseMoveOff
								}
						}
				}
				If (A_Index = TriggeredCount%Hk%) {
					Trig:= 3
					Break
				}
			}
			Trig+= 1
			Sleep, % ScanDelay%Hk%
		}
	CooldownCount:= 0
	CoolDown%Trig%:= 0
	}
	If !HKey%HkT1%KeyToggle {
		MouseGetPos, Xpos, Ypos
		BlockInput, MouseMove
			GetKeyState, LButtonState, LButton, P
				If LButtonState = D
					MouseClick, , , , , , U
		MouseMove, KeyX_%HkT1%, KeyY_%HkT1%
		SetMouseDelay, 40
		MouseClick, , KeyX_%HkT1%, KeyY_%HkT1%
		SetMouseDelay, %MouseDelay%
		MouseMove, %HKeyHkT1Spell2%X, %HKeyHkT1Spell2%Y
		SetMouseDelay, 40
		MouseClick, , %HKeyHkT1Spell2%X, %HKeyHkT1Spell2%Y
		SetMouseDelay, %MouseDelay%
		MouseMove, Xpos, Ypos
		GetKeyState, LButtonState, LButton, P
			If LButtonState = D
				MouseClick, , , , , , D
		BlockInput, MouseMoveOff
	}
Return

V2Loop:
	HKey%HkT1%KeyToggle:= !HKey%HkT1%KeyToggle
	While HKey%HkT1%KeyToggle {
		If (A_Index = 1) {
			Tooltip, % "HKeyHkT1KeyTrigN = " HKeyHkT1KeyTrigN , 1880, 1050
				SetTimer, RemoveToolTip, -2000
		}
		PixelSearch, , , Tx, Ty, Tx, Ty, Color, 20
			If (ErrorLevel = 0) {
				gosub SendShortcut2
			}
	}
Return

SendShortcut2:
	Tooltip, % Cooldown "ms" , 1880, 1050
		SetTimer, RemoveToolTip, -%Cooldown%
	Sleep, %Cooldown%
		GetKeyState, LButtonState, LButton, P
			If LButtonState = D
				MouseClick, , , , , , U
	send, {%HKeyHkT1KeyTrigN%}
	GetKeyState, LButtonState, LButton, P
		If LButtonState = D
			MouseClick, , , , , , D
return

V3Loop:
	TrigN:= 1
	HKeyHkT1Spell1:= HKey%HkT1%Spell1
	HKey%HkT1%KeyToggle:= !HKey%HkT1%KeyToggle
	While HKey%HkT1%KeyToggle {
		If (A_Index = 1) {
			Tooltip, % "Toggle State = " HKey%HkT1%KeyToggle  "`nCtrl Toggle State = " HKey%HkT1%CtrlKeyToggle "`nCooldown = " Cooldown , 1880, 1050

				SetTimer, RemoveToolTip, -500
		}
		Loop, 8 {
			ImageSearch, T1X, T1Y, 0, 0, 1000, 80, % "*40 " HKey%HkT1%Spell%TrigN% "Timer" A_Index ".png"
;				If (ErrorLevel = 2) {
;					msgbox, error
;				}
;				If (ErrorLevel = 1) {
;					msgbox, not found
;				}
				If (ErrorLevel = 0) {
					Tooltip, found at %T1X%x %T1Y%Y, T1X, T1Y +40
						SetTimer, RemoveToolTip, -1000
					i:= A_Index
					loop {
						ImageSearch, , , T1X -5, T1Y -5, T1X + 50, T1Y + 50, % "*40 " HKey%HkT1%Spell%TrigN% "Timer" i ".png"
							If (ErrorLevel = 1) {
									Tooltip, HKey%HkT1%Spell%TrigN%: %Cooldown%ms, T1X, T1Y +40
									SetTimer, RemoveToolTip, -1000
								GoSub SendShortcut3
								break, 2
							}
					}
				}
		}
	}
Return

SendShortcut3:
	HKeyHkT1KeyTrigN:= HKey%HkT1%Key%TrigN%
	Sleep, %Cooldown%
	BlockInput, on
	GetKeyState, LButtonState, LButton, P
		If LButtonState = D
			MouseClick, , , , , , U
	If (HKey%HkT1%CtrlKeyToggle = 0) {
		send, {%HKeyHkT1KeyTrigN%}
	}
	If (HKey%HkT1%CtrlKeyToggle = 1) {
		Send, {Ctrl Down}
		sleep, 40
		Send, {%HKeyHkT1KeyTrigN%}{Ctrl Up}
	}
	If LButtonState = D
		MouseClick, , , , , , D
	BlockInput, Off

;		loop {
;			If (HKey%HkT1%CtrlKeyToggle = 1) {
;				GetKeyState, CtrlState, Ctrl, P
;					If CtrlState = D
;						Send, {Ctrl Up}
;				Send, {Ctrl down}
;				Sleep, 50
;			}
;			GetKeyState, LButtonState, LButton, P
;				If LButtonState = D
;					MouseClick, , , , , , U
;			send, {%HKeyHkT1KeyTrigN%}
;			If LButtonState = D
;				MouseClick, , , , , , D
;			Send, {Ctrl Up}
;			ImageSearch, , , T1X -5, T1Y -5, T1X + 50, T1Y + 50, % HKey%HkT1%Spell%TrigN% "Timer" i ".png"
;				If (ErrorLevel = 0) {
;					Break
;				}
;		}
return