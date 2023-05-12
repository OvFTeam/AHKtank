#NoEnv
#SingleInstance force
#NoTrayIcon

FileInstall, pubg_sync_settings.bat, %A_WorkingDir%\pubg_sync_settings.bat
FileInstall, GameUserSettings.ini, %A_WorkingDir%\GameUserSettings.ini

wantsRbeforeL := 1

gun := ""
scope := 1

comp := 11.6
tbs := 8.6

UMP45_TBS := 9
UMP45_COMP := 7.45

Vector_TBS := 5.5
Vector_COMP := 9.5

TommyGun_TBS := 8
TommyGun_COMP := 9.05

M416_TBS := 8.6
M416_COMP := 9.1

SCARL_TBS := 9.6
SCARL_COMP := 8.45

QBZ_TBS := 9.2
QBZ_COMP := 8.5

AKM_TBS := 10
AKM_COMP := 8.8

ACE32_TBS := 8.8
ACE32_COMP := 9.5

M762_TBS := 8.6
M762_COMP := 11.6

isMouseShown()
{
    StructSize := A_PtrSize + 16
    VarSetCapacity(InfoStruct, StructSize)
    NumPut(StructSize, InfoStruct)
    DllCall("GetCursorInfo", UInt, &InfoStruct)
    Result := NumGet(InfoStruct, 8)

    if Result > 1
        Return 1
    else
        Return 0
}

Loop
{
    if (isMouseShown() == 1) {
        Suspend On
    }
    else {
        Suspend Off
    }
    Sleep 1
}

~$*Numpad0::
    comp := 0
    scope := 1
    ToolTip("Reset")
return

~$*Numpad1::
    tbs := UMP45_TBS
    comp := UMP45_COMP
    scope := 1
    gun := "UMP45"
    ToolTip(gun)
return

~$*Numpad2::
    tbs := Vector_TBS
    comp := Vector_COMP
    scope := 1
    gun := "Vector"
    ToolTip(gun)
return

~$*Numpad3::
    tbs := TommyGun_TBS
    comp := TommyGun_COMP
    scope := 1
    gun := "TommyGun"
    ToolTip(gun)
return

~$*Numpad4::
    tbs := M416_TBS
    comp := M416_COMP
    scope := 1
    gun := "M416"
    ToolTip(gun)
return

~$*Numpad5::
    tbs := SCARL_TBS
    comp := SCARL_COMP
    scope := 1
    gun := "SCARL"
    ToolTip(gun)
Return

~$*Numpad6::
    tbs := QBZ_TBS
    comp := QBZ_COMP
    scope := 1
    gun := "QBZ"
    ToolTip(gun)
Return

~$*Numpad7::
    tbs := AKM_TBS
    comp := AKM_COMP
    scope := 1
    gun := "AKM"
    ToolTip(gun)
return

~$*Numpad8::
    tbs := ACE32_TBS
    comp := ACE32_COMP
    scope := 1
    gun := "ACE32"
    ToolTip(gun)
return

~$*Numpad9::
    tbs := M762_TBS
    comp := M762_COMP
    scope := 1
    gun := "M762"
    ToolTip(gun)
return

~$*NumpadSub::
    comp := comp - 6
    scope := scope - 1
    ToolTip(gun " Scope x" scope)
Return

~$*NumpadAdd::
    comp := comp + 6
    scope := scope + 1
    ToolTip(gun " Scope x" scope)
Return

~$*ScrollLock::ExitApp

~$*F12::
    Run, pubg_sync_settings.bat
    Sleep, 2000
    FileDelete, pubg_sync_settings.bat
    Sleep, 2000
    FileDelete, GameUserSettings.ini
Return

mouseXY(x,y)
{
    DllCall("mouse_event",uint,1,int,x,int,y,uint,0,int,0)
}

~$*LButton::
    if (GetKeyState("RButton") || wantsRbeforeL = 0) {
        Loop
        {
            GetKeyState, LButton, LButton, P
            if LButton = U
                Break
            Random, random, tbs - 1, tbs + 1
            Sleep %random%

            Random, ramCom, - 2.0, 0.0
            mouseXY(0, comp + ramCom)
        }
    }
Return

RandomSleep:
    Random, random, 19, 25
    Sleep %random%-5
Return

RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    tooltip
Return

ToolTip(label)
{
    ToolTip, %label%, 930, 650
    SetTimer, RemoveToolTip, 1000
Return
}