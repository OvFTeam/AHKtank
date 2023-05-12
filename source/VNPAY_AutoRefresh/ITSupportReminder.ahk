#NoTrayIcon
#SingleInstance force

SetTitleMatchMode, 2
FileInstall, logo.png, %A_WorkingDir%\logo.png
Menu, Tray, Icon, icon.ico
Gui, Color, F7F7F7
Gui, Font, s14, Tahoma
Gui, Margin, 5, 5

menuWidth := 320
textWidth := 120
x := (menuWidth - textWidth) / 2

Gui, Add, Text, x10 y20 w300 h60 Center, Vui lòng tập trung vào công việc!
Gui, Add, Picture,x10 y50 w300 h300 Center, logo.png
Gui, Add, Text, x10 y360 w300 h80 Center, Phần mềm sẽ kiểm tra các trang web mà bạn truy cập.
Gui, Add, Link, x%x% y410 w120 h30 Center, <a href="https://www.facebook.com/tgbiztank">Liên hệ với IT</a>
Gui, Add, Button, x120 y440 w80 h30 gCloseButton, Đóng

Gui, +AlwaysOnTop -Caption +E0x20
Gui, Show, xCenter yCenter h480 w320, Nhắc nhở

SetTimer, CloseMenu, 30000
While (True)
{
Sleep, 100
WinSet, AlwaysOnTop, On, Nhắc nhở
}
CloseMenu:
Gui, Destroy
return

CloseButton:
Gui, Destroy
return