; ==================== DELAYCONFIG LISTS ====================
; -------------------- Delay List --------------------
DelayList := [ {Variable: "Delay", Key: "Delay"}
             , {Variable: "FrameTime", Key: "FrameTime"}
             , {Variable: "KeyDelay1", Key: "KeyDelay1"}
             , {Variable: "KeyDelayPress", Key: "KeyDelayPress"}
             , {Variable: "MouseDelay", Key: "MouseDelay"} ]

; ==================== CONFIGURATION LISTS ====================
; -------------------- Config Setup List --------------------
ConfigList := [ {Variable: "HotkeyConfig", Section: "Configuration", Key: "HotkeyConfig"}
              , {Variable: "ScanConfig", Section: "Configuration", Key: "ScanConfig"}
              , {Variable: "SpellScan", Section: "Configuration", Key: "SpellScan"}
              , {Variable: "ScreenCapture", Section: "Configuration", Key: "ScreenCapture"}
              , {Variable: "DelayConfig", Section: "Configuration", Key: "DelayConfig"} ]

; ==================== SCANCONFIG LISTS ====================
ScanLangList := [ {Variable: "CaptureHotkey", Section: "CaptureSettings", Key: "CaptureHotkey"}
                , {Variable: "SaveAsHotkey", Section: "CaptureSettings", Key: "SaveAsHotkey"}
                , {Variable: "CloseHotkey", Section: "CaptureSettings", Key: "CloseHotkey"}
                , {Variable: "YesHotkey", Section: "CaptureSettings", Key: "YesHotkey"}
                , {Variable: "AddressBarHotkey", Section: "CaptureSettings", Key: "AddressBarHotkey"}
                , {Variable: "SaveAsWindowName", Section: "WindowNames", Key: "SaveAsWindowName"}
                , {Variable: "ConfirmSaveAsWindowName", Section: "WindowNames", Key: "ConfirmSaveAsWindowName"}
                , {Variable: "SnippingToolWindowName", Section: "WindowNames", Key: "SnippingToolWindowName"}
                , {Variable: "SnippingToolPath", Section: "CaptureSettings", Key: "SnippingToolPath"}]

; ==================== HOTKEYCONFIG LISTS ====================
; -------------------- HK Setup List --------------------
HKSetupList := [ {Variable: "Hkey", Section: "HotkeyToggle", Key: "Toggle"}
               , {Variable: "Hkey", Section: "HotkeyType", Key: "Type1"}
               , {Variable: "Hkey", Section: "HotkeyType", Key: "Type2"}
               , {Variable: "Hkey", Section: "HotkeyType", Key: "Type3"}
               , {Variable: "Hkey", Section: "HotkeyType", Key: "Type4"}
               , {Variable: "Hkey", Section: "HotkeyType", Key: "Type5"}
               , {Variable: "Hkey", Section: "HotkeyType", Key: "Type6"}
               , {Variable: "Hkey", Section: "HotkeyType", Key: "Type7"}
               , {Variable: "Hkey", Section: "HotkeyShortcut", Key: "Shortcut"}]

; -------------------- HK Setup List --------------------
HotkeyTypes := [ {type: "Type1", setup: "ConfigType1"}
               , {type: "Type2", setup: "ConfigType2"}
               , {type: "Type3", setup: "ConfigType3"}
               , {type: "Type4", setup: "ConfigType4"}
               , {type: "Type5", setup: "ConfigType5"}
               , {type: "Type6", setup: "ConfigType6"}
               , {type: "Type7", setup: "ConfigType7"}]

; -------------------- HK Config List --------------------
HKConfigList := [ {Variable: "Key", Section: "HotkeyKey", Key: "Hkey"}
                , {Variable: "X", Section: "KeyCoordinates", Key: "KeyX_"}
                , {Variable: "Y", Section: "KeyCoordinates", Key: "KeyY_"}]

; -------------------- Type 1 Hotkey List --------------------
Type1List := [ {section: "HotkeySpells", key: "Hkey{Hk}Spell1"}
             , {section: "HotkeySpells", key: "Hkey{Hk}Spell2"}
             , {section: "HotkeyKey", key: "Hkey{Hk}Key"}
             , {section: "XTriggeredCount", key: "XTriggeredCount{Hk}"}
             , {section: "Delay", key: "ScanDelay{Hk}"}
             , {section: "Delay", key: "T1Cooldown{Hk}"}]

; -------------------- Type 1 Loop List --------------------
Type1LoopList := [ {section: "XTriggeredToggle", key: "TriggerToggle{TrigN}_{Hk}"}
                 , {section: "XTriggeredSpells", key: "Hkey{Hk}Spell{TrigN}"}
                 , {section: "XTriggeredSpells", key: "HKey{Hk}T1Cooldown{TrigN}"}]

; -------------------- Type 2 Hotkey List --------------------
Type2List := [ {section: "HotkeySpells", key: "Hkey{Hk}Spell1"}
             , {section: "HotkeySpells", key: "Hkey{Hk}Spell2"}
             , {section: "HotkeyKey", key: "HKey{Hk}Key"}
             , {section: "HotkeySpells", key: "Type2MoveToggleHotkey{Hk}"}]

; -------------------- Type 3 Hotkey List --------------------
Type3List := [ {section: "HotkeySpells", key: "Hkey{Hk}Spell1"}
             , {section: "HotkeySpells", key: "Hkey{Hk}Spell2"}
             , {section: "HotkeyKey", key: "HKey{Hk}Key"}
             , {section: "HotkeySpells", key: "Type3Cast1ToggleHotkey{Hk}"}
             , {section: "HotkeySpells", key: "Type3Cast2ToggleHotkey{Hk}"}]

; -------------------- Type 4 Hotkey List --------------------
Type4List := [ {section: "HotkeySpells", key: "HKey{Hk}Spell1T4"}
             , {section: "HotkeyKey", key: "HKey{Hk}Key"}]

; -------------------- KeyCoordinates List --------------------
KeyCoordList := { Q: {X: 1440, Y: 1045}
                , W: {X: 1495, Y: 1045}
                , E: {X: 1550, Y: 1045}
                , R: {X: 1605, Y: 1045}
                , T: {X: 1655, Y: 1045}
                , LButton: {X: 1550, Y: 975}
                , MButton: {X: 1600, Y: 975}
                , RButton: {X: 1650, Y: 975} }

; -------------------- Type 5 and 6 Hotkey List --------------------
Type5and6List := [ {section: "SwapTabs", key: "{SwapType}SwapTab_{Hk}"}
                 , {section: "{SwapType}Swap1Coordinates", key: "{SwapType}Swap1Hotkey{Hk}_X"}
                 , {section: "{SwapType}Swap1Coordinates", key: "{SwapType}Swap1Hotkey{Hk}_Y"}
                 , {section: "{SwapType}Swap2Coordinates", key: "{SwapType}Swap2Hotkey{Hk}_X"}
                 , {section: "{SwapType}Swap2Coordinates", key: "{SwapType}Swap2Hotkey{Hk}_Y"}
                 , {section: "{SwapType}Swap2Coordinates", key: "{SwapType}Swap2AltHotkey{Hk}_X"}
                 , {section: "{SwapType}Swap2Coordinates", key: "{SwapType}Swap2AltHotkey{Hk}_Y"}]

; -------------------- Type 7 Hotkey List --------------------
; Sockets
weaponSockets := [ {name: "6SocketWeaponTopRightSocket", x: 72, y: 50, coordX: 1355, coordY: 170}
				 , {name: "6SocketWeaponTopCenterSocket", x: 149, y: 50, coordX: 1405, coordY: 170}
				 , {name: "6SocketWeaponMiddleRightSocket", x: 71, y: 125, coordX: 1355, coordY: 225}
				 , {name: "6SocketWeaponMiddleCenterSocket", x: 149, y: 125, coordX: 1405, coordY: 225}
				 , {name: "6SocketWeaponBottomRightSocket", x: 72, y: 200, coordX: 1355, coordY: 280}
				 , {name: "6SocketWeaponBottomCenterSocket", x: 149, y: 200, coordX: 1405, coordY: 280}
				 , {name: "RightWeaponTopSocket", x: 111, y: 50, coordX: 1380, coordY: 170}
				 , {name: "RightWeaponMiddleSocket", x: 111, y: 125, coordX: 1380, coordY: 225}
				 , {name: "RightWeaponBottomSocket", x: 111, y: 200, coordX: 1380, coordY: 280}
				 , {name: "RightWeaponTopRightSocket", x: 84, y: 88, coordX: 1355, coordY: 200}
				 , {name: "RightWeaponTopCenterSocket", x: 137, y: 88, coordX: 1405, coordY: 200}
				 , {name: "RightWeaponBottomCenterSocket", x: 137, y: 163, coordX: 1405, coordY: 250} ]

helmetSockets := [ {name: "HelmetTopRightSocket", x: 279, y: 21, coordX: 1560, coordY: 135}
				 , {name: "HelmetTopLeftSocket", x: 355, y: 21, coordX: 1615, coordY: 135}
				 , {name: "HelmetBottomRightSocket", x: 279, y: 97, coordX: 1560, coordY: 185}
				 , {name: "HelmetBottomLeftSocket", x: 355, y: 97, coordX: 1615, coordY: 185}
				 , {name: "HelmetMiddleRightSocket", x: 279, y: 57, coordX: 1560, coordY: 160}
				 , {name: "HelmetMiddleLeftSocket", x: 355, y: 57, coordX: 1615, coordY: 160}
				 , {name: "HelmetMiddleSocket", x: 317, y: 57, coordX: 1690, coordY: 160} ]

leftHandSockets := [ {name: "LeftHandTopSocket", x: 523, y: 50, coordX: 1795, coordY: 170}
				   , {name: "LeftHandMiddleSocket", x: 523, y: 125, coordX: 1795, coordY: 225}
				   , {name: "LeftHandBottomSocket", x: 523, y: 200, coordX: 1795, coordY: 280}
				   , {name: "LeftHandTopCenterSocket", x: 496, y: 88, coordX: 1765, coordY: 200}
				   , {name: "LeftHandTopLeftSocket", x: 550, y: 88, coordX: 1820, coordY: 200}
				   , {name: "LeftHandBottomLeftSocket", x: 550, y: 163, coordX: 1820, coordY: 250}
				   , {name: "LeftHandMiddleCenterSocket", x: 485, y: 125, coordX: 1770, coordY: 225}
				   , {name: "LeftHandMiddleLeftSocket", x: 561, y: 125, coordX: 1820, coordY: 225} ]

glovesSockets := [ {name: "GlovesTopRightSocket", x: 151, y: 257, coordX: 1430, coordY: 370}
				 , {name: "GlovesTopCenterSocket", x: 224, y: 257, coordX: 1485, coordY: 370}
				 , {name: "GlovesBottomRightSocket", x: 151, y: 332, coordX: 1430, coordY: 420}
				 , {name: "GlovesBottomCenterSocket", x: 224, y: 332, coordX: 1485, coordY: 420}
				 , {name: "GlovesMiddleRightSocket", x: 151, y: 294, coordX: 1430, coordY: 395}
				 , {name: "GlovesMiddleCenterSocket", x: 224, y: 294, coordX: 1485, coordY: 395}
				 , {name: "GlovesMiddleSocket", x: 187, y: 294, coordX: 1455, coordY: 395} ]

armorSockets := [ {name: "4SocketArmorTopRightSocket", x: 293, y: 172, coordX: 1560, coordY: 275}
				, {name: "4SocketArmorTopLeftSocket", x: 343, y: 172, coordX: 1615, coordY: 275}
				, {name: "4SocketArmorBottomRightSocket", x: 293, y: 235, coordX: 1560, coordY: 333}
				, {name: "4SocketArmorBottomLeftSocket", x: 343, y: 235, coordX: 1615, coordY: 333}
				, {name: "6SocketArmorTopRightSocket", x: 281, y: 140, coordX: 1560, coordY: 250}
				, {name: "6SocketArmorTopLeftSocket", x: 355, y: 140, coordX: 1615, coordY: 250}
				, {name: "6SocketArmorMiddleRightSocket", x: 281, y: 203, coordX: 1560, coordY: 305}
				, {name: "6SocketArmorMiddleLeftSocket", x: 355, y: 203, coordX: 1615, coordY: 305}
				, {name: "6SocketArmorBottomRightSocket", x: 281, y: 266, coordX: 1560, coordY: 360}
				, {name: "6SocketArmorBottomLeftSocket", x: 355, y: 266, coordX: 1615, coordY: 360}
				, {name: "1SocketArmorMiddleSocket", x: 317, y: 204, coordX: 1585, coordY: 305} ]

bootsSockets := [ {name: "BootsTopCenterSocket", x: 411, y: 257, coordX: 1690, coordY: 370}
				, {name: "BootsTopLeftSocket", x: 484, y: 257, coordX: 1740, coordY: 370}
				, {name: "BootsBottomCenterSocket", x: 411, y: 332, coordX: 1690, coordY: 420}
				, {name: "BootsBottomLeftSocket", x: 484, y: 332, coordX: 1740, coordY: 420}
				, {name: "BootsMiddleCenterSocket", x: 411, y: 294, coordX: 1690, coordY: 395}
				, {name: "BootsMiddleLeftSocket", x: 484, y: 294, coordX: 1740, coordY: 395}
				, {name: "BootsMiddleSocket", x: 447, y: 294, coordX: 1715, coordY: 395} ]

otherSockets := [ {name: "RightFingerSocket", x: 213, y: 202, coordX: 1485, coordY: 305}
				, {name: "LeftFingerSocket", x: 421, y: 202, coordX: 1690, coordY: 305}
				, {name: "AmuletSocket", x: 421, y: 137, coordX: 1690, coordY: 245}
				, {name: "BeltRightSocket", x: 293, y: 320, coordX: 1565, coordY: 420}
				, {name: "BeltCenterSocket", x: 317, y: 320, coordX: 1585, coordY: 420}
				, {name: "BeltLeftSocket", x: 343, y: 320, coordX: 1605, coordY: 420}
				, {name: "Flask1", x: 218, y: 410, coordX: 1487, coordY: 515}
				, {name: "Flask2", x: 270, y: 410, coordX: 1540, coordY: 515}
				, {name: "Flask3", x: 322, y: 410, coordX: 1592, coordY: 515}
				, {name: "Flask4", x: 375, y: 410, coordX: 1645, coordY: 515}
				, {name: "Flask5", x: 427, y: 410, coordX: 1697, coordY: 515} ]

SwapList := [ {swap: "XGemSwap1", condition: true, value: "%Swap%XTypeHotkey%Hk%Iteration%XT%", section: "%Swap%CoordinatesXType", function: "XTypeGemSwap2"}
			, {swap: "XEquipSwap1", condition: true, value: "%Swap%XTypeHotkey%Hk%Iteration%XT%", section: "%Swap%CoordinatesXType", function: "XTypeEquipSwap2"}
			, {swap: "XGemSwap2", condition: (XGemSwapTab_%Hk% = 1), value: "%Swap%XTypeHotkey%Hk%Iteration%XT%", section: "%Swap%CoordinatesXType", function: "Delay"}
			, {swap: "XEquipSwap2", condition: (XEquipSwapTab_%Hk% = 1), value: "%Swap%XTypeHotkey%Hk%Iteration%XT%", section: "%Swap%CoordinatesXType", function: "Delay"}
			, {swap: "XGemSwap2", condition: (XGemSwapTab_%Hk% = 2), value: "%Swap%AltXTypeHotkey%Hk%Iteration%XT%", section: "%Swap%CoordinatesXType", function: "Delay"}
			, {swap: "XEquipSwap2", condition: (XEquipSwapTab_%Hk% = 2), value: "%Swap%AltXTypeHotkey%Hk%Iteration%XT%", section: "%Swap%CoordinatesXType", function: "Delay"} ]

Type7List := [ {section: "XtypeDelay", key: "HKey{Hk}XTypeDelayIteration{XT}"}
             , {section: "XTypeHotkey{Hk}", key: "Hkey{Hk}Iteration{XT}Toggle"}
             , {section: "XTypeHotkey{Hk}", key: "Hkey{Hk}Iteration{XT}"}
             , {section: "XtypeHotkeySpells", key: "HKey{Hk}XTypeSpellIteration{XT}"}
             , {section: "XTypeHotkeyKey", key: "HKey{Hk}XTypeKeyIteration{XT}"}
             , {section: "XtypeSend", key: "HKey{Hk}XTypeSendIteration{XT}"}
             , {section: "XtypeMousePos", key: "HKey{Hk}XTypeMouseXPosIteration{XT}"}
             , {section: "XtypeMousePos", key: "HKey{Hk}XTypeMouseYPosIteration{XT}"}
             , {section: "XtypeMousePos", key: "HKey{Hk}XTypeGoMousePosIteration{XT}"}
             , {section: "XtypeMousePos", key: "HKey{Hk}XTypeGetMousePosToggleIteration{XT}"}
             , {section: "ScanXType", key: "ScanCoordinatesXTypeHotkey{Hk}Iteration{XT}_L"}
             , {section: "ScanXType", key: "ScanCoordinatesXTypeHotkey{Hk}Iteration{XT}_T"}
             , {section: "ScanXType", key: "ScanCoordinatesXTypeHotkey{Hk}Iteration{XT}_R"}
             , {section: "ScanXType", key: "ScanCoordinatesXTypeHotkey{Hk}Iteration{XT}_B"}
             , {section: "ScanXType", key: "ImageNameXTypeHotkey{Hk}Iteration{XT}"}
             , {section: "ScanXType", key: "ShadeVariationXTypeHotkey{Hk}Iteration{XT}"}
             , {section: "GemSwap1CoordinatesXType", key: "GemSwap1XTypeHotkey{Hk}Iteration{XT}_X"}
             , {section: "GemSwap1CoordinatesXType", key: "GemSwap1XTypeHotkey{Hk}Iteration{XT}_Y"}
             , {section: "GemSwap2CoordinatesXType", key: "GemSwap2XTypeHotkey{Hk}Iteration{XT}_X"}
             , {section: "GemSwap2CoordinatesXType", key: "GemSwap2XTypeHotkey{Hk}Iteration{XT}_Y"}
             , {section: "GemSwap2CoordinatesXType", key: "GemSwap2AltXTypeHotkey{Hk}Iteration{XT}_X"}
             , {section: "GemSwap2CoordinatesXType", key: "GemSwap2AltXTypeHotkey{Hk}Iteration{XT}_Y"}
             , {section: "EquipSwap1CoordinatesXType", key: "EquipSwap1XTypeHotkey{Hk}Iteration{XT}_X"}
             , {section: "EquipSwap1CoordinatesXType", key: "EquipSwap1XTypeHotkey{Hk}Iteration{XT}_Y"}
             , {section: "EquipSwap2CoordinatesXType", key: "EquipSwap2XTypeHotkey{Hk}Iteration{XT}_X"}
             , {section: "EquipSwap2CoordinatesXType", key: "EquipSwap2XTypeHotkey{Hk}Iteration{XT}_Y"}
             , {section: "EquipSwap2CoordinatesXType", key: "EquipSwap2AltXTypeHotkey{Hk}Iteration{XT}_X"}
             , {section: "EquipSwap2CoordinatesXType", key: "EquipSwap2AltXTypeHotkey{Hk}Iteration{XT}_Y"}
             , {section: "XTypeKeyCoordinates", key: "KeyX_{Hk}Iteration{XT}"}
             , {section: "XtypeKeyCoordinates", key: "KeyY_{Hk}Iteration{XT}"}]