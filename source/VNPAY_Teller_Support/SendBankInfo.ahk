#NoTrayIcon
#SingleInstance force

SetTitleMatchMode, 2
FileInstall, logo.png, %A_WorkingDir%\logo.png
Menu, Tray, Icon, icon.ico
Gui -Caption

nganhangs := "MBBank|VietcomBank|BIDV|VietinBank|TPBank|TechcomBank|VPBank|VIB|ACB|ANZ|AgriBank|Sacombank|MaritimeBank"
nganhangNames := ["MBBank", "VietcomBank", "BIDV", "VietinBank", "TPBank", "TechcomBank", "VPBank", "VIB", "ACB", "ANZ", "AgriBank", "Sacombank", "MaritimeBank"]

Gui Add, Text, x20 y20 w120 h20, Tên thu ngân:
Gui Add, Edit, x140 y20 w200 h20 vName

Gui Add, Text, x20 y60 w120 h20, Số tài khoản:
Gui Add, Edit, x140 y60 w200 h20 vSTK

Gui Add, Text, x20 y100 w120 h20, Ngân hàng:
Gui Add, ComboBox, x140 y100 w200 h200 vNganHang AltSubmit, %nganhangs%

Gui Add, Button, x20 y150 w100 h30 gSaveInfo, Lưu lại
Gui Add, Button, x140 y150 w100 h30 gShowInfo, Thu ngân hiện tại

Gui Show, w360 h200, Đổi thu ngân

XButton2::
    FileRead, output, %A_ScriptDir%\file.txt
    Send, %output%
Return

SaveInfo:
    Gui Submit
    FileDelete, file.txt
    StringUpper, NameUpper, Name
    selectedNganHang := nganhangNames[NganHang]
    FileAppend, % "Tên thu ngân: " NameUpper "`nSTK: " STK "`nNgân hàng: " selectedNganHang "`n`n", file.txt
Return

ShowInfo() {
    FileRead, output, %A_ScriptDir%\file.txt
    if (output != "") {
        MsgBox, 64, Thu ngân hiện tại, %output%
    }
    else {
        MsgBox, 64, Trống.
    }
}
#Persistent
#If GetKeyState("F1", "P")
    F1::Reload
#If

ShowGui:
    Gui Show
Return