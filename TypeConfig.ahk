
HkTypeConfigLoop:
	Loop {
			If (Hk > HotKeyLimit) {
				Reload
				Break
			}
			If (Hkey%Hk%Toggle = 1 AND Hkey%Hk%Type1 = 1) {
				Gosub ConfigType1
				Break
			}
			If (Hkey%Hk%Toggle = 1 AND Hkey%Hk%Type2 = 1) {
				Gosub ConfigType2
				Break
			}
			If (Hkey%Hk%Toggle = 1 AND Hkey%Hk%Type3 = 1) {
				Gosub ConfigType3
				Break
			}
			If (Hkey%Hk%Toggle = 1 AND Hkey%Hk%Type4 = 1) {
				Gosub ConfigType4
				Break
			}
			If (Hkey%Hk%Toggle = 1 AND Hkey%Hk%Type5 = 1) {
				Gosub GemSwap1
				Break
			}
			If (Hkey%Hk%Toggle = 1 AND Hkey%Hk%Type6 = 1) {
				Gosub EquipSwap1
				Break
			}
			If (Hkey%Hk%Toggle = 1 AND Hkey%Hk%Type7 = 1) {
				Gosub Type7Config
				Break
			}
			If (Hkey%Hk%Toggle = 0) {
				Gosub HkLoopAdd
				Break
			}
	}
Return
