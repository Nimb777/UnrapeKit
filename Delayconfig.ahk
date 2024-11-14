DelayConfig:
	MouseGetPos, Xpos, Ypos
	GuiWidth:= 220
	GuiHeight:= 160
	gosub GuiBuild
	Gui, Add, Text, x10 y13, Server Latency (ms)
	Gui, Add, Edit, x140 y10 w30 h20 vDelay, %Delay%
	Gui, Add, Text, x10 y43, Maximum Frame Time (Ms)
	Gui, Add, Edit, x140 y40 w30 h20 vFrameTime, %FrameTime%
	Gui, Add, Text, x10 y73, Keyboard Delays (Ms)
	Gui, Add, Edit, x140 y70 w30 h20 vKeyDelay1, %KeyDelay1%
	Gui, Add, Edit, x180 y70 w30 h20 vKeyDelayPress, %KeyDelayPress%
	Gui, Add, Text, x10 y103, Mouse Delay (Ms)
	Gui, Add, Edit, x140 y100 w30 h20 vMouseDelay, %MouseDelay%
	Gui, Add, Button, x20 y130 w90 h20 gDelayConfigRecord Default, Record
	Gui, Add, Button, x120 y130 w90 h20 gCancel, Reload
	Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, Delay configuration
Return

DelayWrite:
	gosub GuiSD
	IniWrite, %Delay%, UnrapeKitConfig.ini, Delay, Delay
	IniWrite, %FrameTime%, UnrapeKitConfig.ini, Delay, FrameTime
	IniWrite, %KeyDelay1%, UnrapeKitConfig.ini, Delay, KeyDelay1
	IniWrite, %KeyDelayPress%, UnrapeKitConfig.ini, Delay, KeyDelayPress
	IniWrite, %MouseDelay%, UnrapeKitConfig.ini, Delay, MouseDelay
return

DelayConfigRecord:
	gosub DelayWrite
	Reload
Return

Delay:
		MouseGetPos, Xpos, Ypos
		GuiWidth:= 220
		GuiHeight:= 160
		gosub GuiBuild
		Gui, Add, Text, x10 y13, Server Latency (ms)
		Gui, Add, Edit, x140 y10 w30 h20 vDelay, %Delay%
		Gui, Add, Text, x10 y43, Maximum Frame Time (Ms)
		Gui, Add, Edit, x140 y40 w30 h20 vFrameTime, %FrameTime%
		Gui, Add, Text, x10 y73, Keyboard Delays (Ms)
		Gui, Add, Edit, x140 y70 w30 h20 vKeyDelay1, %KeyDelay1%
		Gui, Add, Edit, x180 y70 w30 h20 vKeyDelayPress, %KeyDelayPress%
		Gui, Add, Text, x10 y103, Mouse Delay (Ms)
		Gui, Add, Edit, x140 y100 w30 h20 vMouseDelay, %MouseDelay%
		Gui, Add, Button, x20 y130 w90 h20 gDelayRecord Default, Record
		Gui, Add, Button, x120 y130 w90 h20 gCancel, Reload
		Gui, Show, w%GuiWidth% h%GuiHeight% X%Move_X% Y%Move_Y%, Server Latency
Return

DelayRecord:
		gosub DelayWrite
Return
