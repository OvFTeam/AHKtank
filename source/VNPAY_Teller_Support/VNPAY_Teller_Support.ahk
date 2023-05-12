#NoTrayIcon
#SingleInstance force
FileInstall, ITSupportReminder.ahk, %A_WorkingDir%\ITSupportReminder.ahk
FileInstall, SendBankInfo.ahk, %A_WorkingDir%\SendBankInfo.ahk
FileInstall, icon.ico, %A_WorkingDir%\icon.ico
FileInstall, logo.png, %A_WorkingDir%\logo.png
Menu, Tray, Icon, icon.ico

SetTitleMatchMode, 2
Run SendBankInfo.ahk

XButton1::
    IfWinExist, ahk_exe chrome.exe
    {
        WinGet, State, MinMax, ahk_exe chrome.exe

        If (State = -1)
        {
            BlockInput, On
            WinRestore, ahk_exe chrome.exe
            WinActivate ahk_exe chrome.exe
            Send ^1
            WinGetTitle, title, ahk_exe chrome.exe
            foundVNPAY := false
            tabIndex := 1
            while (tabIndex <= 5)
            {
                If (InStr(title, "VNPAY") > 0)
                {
                    foundVNPAY := true
                    Send, {F5}
                    break
                }
                else
                {
                    Sleep 200
                    Send ^{Tab}
                    WinGetTitle, title, ahk_exe chrome.exe
                    tabIndex++
                }
            }
            if (!foundVNPAY)
            {
                Run, https://doitac.vnpay.vn/
                Run ITSupportReminder.ahk
            }
            BlockInput, Off
        }
        Else
        {
            WinMinimize, ahk_exe chrome.exe
        }
    }
Return