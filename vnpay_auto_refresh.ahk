#NoTrayIcon
#SingleInstance force

SetTitleMatchMode, 2

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
                Run, https://github.com/tgbiztank/AHKtank/blob/master/vnpay_auto_refresh.ahk
                Sleep 500
                Send ^!{Tab}
            }
            BlockInput, Off
        }
        Else
        {
            WinMinimize, ahk_exe chrome.exe
        }
    }
Return