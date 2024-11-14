ScreenCapture:
	GuiWidth:= 300
	GuiHeight:= 130
    gosub LoadScanSettings
	MouseGetPos, Xpos, Ypos
	gosub GuiBuild
    Gui, Add, Text, x10 y10, Choose the capture type for window positioning:
    Gui, Add, Text, x10 y30, For buff timer The suffixes are "Timer1", etc.
    Gui, Add, Text, x10 y50, For For the spell menu it's the line number bottom to top.
    Gui, Add, Checkbox, x10 y70 VScreenCapturePos Checked%ScreenCapturePos%, Unclick for Buff Timer Capture
    Gui, Add, Button, x10 y100 w100 gScreenCapture1 Default, Continue
    Gui, Add, Button, x110 y100 w100 gCancel, Cancel
    Gui, Show, % "w" GuiWidth " h" GuiHeight " X" Move_X " Y" Move_Y, Capture Gui positioning
Return


ScreenCapture1:
	gosub GuiSD
    IniWrite, %ScreenCapturePos%, UnrapeKitConfig.ini, ScanLangList, ScreenCapturePos
	GuiWidth:= 300
	GuiHeight:= 380
	MouseGetPos, Xpos, Ypos
	gosub GuiBuild
    If (ScreenCapturePos = 1) {
        Move_X -= (GuiWidth/2 + 20)
        Move_Y -= (GuiHeight/2 + 20)
    }
    If (ScreenCapturePos = 0) {
        Move_X += (GuiWidth/2 + 20)
        Move_Y += (GuiHeight/2 + 20)
    }


    Gui, Add, Text, x10 y10 w280, move the cursor to the top left of the snip and hit enter/tab
    Gui, Add, Text, x10 y25 w280, Hotkey syntax: ^ (Ctrl), ! (Alt), + (Shift), # (Win).
    Gui, Add, Text, x10 y40 w280,  Examples: ^!c for Ctrl+Alt+C
    Gui, Add, Edit, x10 y70 w100 h20 vSaveHotkey, % SaveHotkey
    Gui, Add, Text, % "x" 120 " y" 73, SaveHotkey
    Gui, Add, Edit, x10 y100 w100 h20 vSaveAsHotkey, % SaveAsHotkey
    Gui, Add, Text, % "x" 120 " y" 103, SaveAsHotkey
    Gui, Add, Edit, x10 y130 w100 h20 vCloseHotkey, % CloseHotkey
    Gui, Add, Text, % "x" 120 " y" 133, CloseHotkey
    Gui, Add, Edit, x10 y160 w100 h20 vYesHotkey, % YesHotkey
    Gui, Add, Text, % "x" 120 " y" 163, YesHotkey
    Gui, Add, Edit, x10 y190 w100 h20 vAddressBarHotkey, % AddressBarHotkey
    Gui, Add, Text, % "x" 120 " y" 193, AddressBarHotkey
    Gui, Add, Edit, x10 y220 w100 h20 vSaveAsWindowName, % SaveAsWindowName
    Gui, Add, Text, % "x" 120 " y" 223, SaveAsWindowName
    Gui, Add, Edit, x10 y250 w100 h20 vConfirmSaveAsWindowName, % ConfirmSaveAsWindowName
    Gui, Add, Text, % "x" 120 " y" 253, ConfirmSaveAsWindowName
    Gui, Add, Edit, x10 y280 w100 h20 vSnippingToolWindowName, % SnippingToolWindowName
    Gui, Add, Text, % "x" 120 " y" 283, SnippingToolWindowName
    Gui, Add, Edit, x10 y310 w100 h20 vSnippingToolPath, % SnippingToolPath
    Gui, Add, Text, % "x" 120 " y" 313, SnippingToolPath
; Run on PowerShell as admin: "Get-AppXPackage *Microsoft.ScreenSketch* -AllUsers" , then paste the directory on a browser to navigate to the correct directory (these might not work well though).

    Gui, Add, Button, x10 y350 w135 gCaptureSave Default, Save and Continue
    Gui, Add, Button, x155 y350 w135 gCancel, Cancel
    Gui, Show, % "w" GuiWidth " h" GuiHeight " X" Move_X " Y" Move_Y, Language Settings and top-left snip coordinates
Return

CaptureSave:
	MouseGetPos, CaptureX1, CaptureY1
	gosub GuiSD
	gosub WriteScanSettings
	gosub ScreenCapture2
Return

ScreenCapture2:
    IniRead, TempName, UnrapeKitConfig.ini, TemporaryScan, TempName
    IniRead, TempLine, UnrapeKitConfig.ini, TemporaryScan, TempLine
    N := ScanCount + 1
	GuiWidth:= 210
	GuiHeight:= 160
    gosub GuiBuild
    If (ScreenCapturePos = 1) {
        Move_X -= (GuiWidth/2 + 20)
        Move_Y -= (GuiHeight/2 + 20)
    }
    If (ScreenCapturePos = 0) {
        Move_X += (GuiWidth/2 + 20)
        Move_Y += (GuiHeight/2 + 20)
    }

    Gui, Add, Text, x10 y10 w190, Enter the spell name and Suffix from the bottom up in the spell menu then move the cursor to the second set of coordinates and press Enter
    Gui, Add, Text, x10 y80, name                                        Suffix
    Gui, Add, Edit, x10 y100 w120 h20 vTempName, %TempName%
    Gui, Add, Edit, x+10 w60 h20 vTempLine, %TempLine%
    Gui, Add, Button, x10 y130 w90 h20 gCaptureSave2 Default, Ok
    Gui, Add, Button, x110 y130 w90 h20 gCancel, Reload
    Gui, Show, % "w" GuiWidth " h" GuiHeight " X" Move_X " Y" Move_Y, name, menu line and B/R coordinates
return

CaptureSave2:
	MouseGetPos, CaptureX2, CaptureY2
    gosub GuiSD
    IniWrite, %TempName%, UnrapeKitConfig.ini, TemporaryScan, TempName
    IniWrite, %TempLine%, UnrapeKitConfig.ini, TemporaryScan, TempLine
    CaptureName := TempName TempLine
    gosub SnippingTool
return

SnippingTool:
    SetMouseDelay, 40
    SetKeyDelay, 40, 40
    SendInput {PrintScreen}
    sleep, 500
    Send, #+s
    sleep, 400
    BlockInput, MouseMove
	MouseClickDrag, L, CaptureX1, CaptureY1, CaptureX2, CaptureY2, 2
    BlockInput, MouseMoveOff
;    run C:\Program Files\WindowsApps\Microsoft.ScreenSketch_11.2407.3.0_x64__8wekyb3d8bbwe\SnippingTool\SnippingTool.exe
    sleep, 500
    Mousemove, 1800, 850, 2
    sleep, 100
    MouseClick, L
    sleep, 1500
    WinMaximize, Snipping Tool
    sleep, 300
	MouseClick, L, 150, 20
    sleep, 300
    tooltip, Send, %SaveAsHotkey%
    Send, %SaveAsHotkey%
    sleep, 300
    tooltip, WinWait, %SaveAsWindowName%
    WinWait, %SaveAsWindowName%
    sleep, 300
    tooltip, SendInput %CaptureName%.png
    SendInput %CaptureName%.png
    sleep, 300
    tooltip, Send, %AddressBarHotkey%
    Send, %AddressBarHotkey%
    sleep, 300
    tooltip, SendInput %A_ScriptDir%
    SendInput %A_ScriptDir%
    sleep, 300
    tooltip, SendInput {Enter}
    SendInput {Enter}
    sleep, 300
    Send, !s
    ImageRepeat := 0
    sleep, 300
    Send, %YesHotkey%
    ImageRepeat := 1
    sleep, 300
;    Send, !F4
;    MouseClick, L, 1910, 10
    WinClose, Snipping Tool
    MouseMove, CaptureX2, CaptureY2
    if (CaptureX1 >= 1410 and CaptureX2 <= 1605 and CaptureY1 >= 410 and CaptureY2 <= 925) {
        CaptureX1 -= 5
        CaptureY1 -= 5
        CaptureX2 += 5
        CaptureY2 += 5
        tooltip, gosub CaptureSave3
        gosub CaptureSave3
    }

    SetMouseDelay, %MouseDelay%
    SetKeyDelay, %KeyDelay1%, %KeyDelayPress%
    Reload
    SetTimer, RemoveToolTip, -500
return

CaptureSave3:
    Loop, 20 {
        ImageSearch, %TempName%X, %TempName%Y, %CaptureX1%, %CaptureY1%, %CaptureX2%, %CaptureY2%, *10 %CaptureName%.png
        if (ErrorLevel = 2 and A_Index = 20)
            ToolTip, Could Not perform scan
        else if (ErrorLevel = 1 and A_Index = 20)
            ToolTip, Could Not Find Scan %CaptureName%.png
        else if (ErrorLevel = 0) {
            Send, {Click}
            if (ImageRepeat = 1) {
                Loop {
                    if (CaptureName = CaptureName%A_Index%) {
                        N := A_Index
                        break
                    }
                }
            } else {
                ScanCount += 1
                N := ScanCount
            }
            Name%N%:= TempName
            Line%N%:= TempLine
            IconToggle%N%:= 1
            IniWrite, %ScanCount%, UnrapeKitConfig.ini, ScanCount, ScanCount
            IniWrite, % IconToggle%N%, UnrapeKitConfig.ini, IconToggle, IconToggle%N%
            IniWrite, % %TempName%X, UnrapeKitConfig.ini, SpellCoordinates, %TempName%X
            IniWrite, % %TempName%Y, UnrapeKitConfig.ini, SpellCoordinates, %TempName%Y
            IniWrite, % Name%N%, UnrapeKitConfig.ini, Names, Name%N%
            IniWrite, % Line%N%, UnrapeKitConfig.ini, Lines, Line%N%
            Break
        }
        Sleep, 10
    }
return
; ==================== END SCREEN CAPTURE HANDLERS ====================