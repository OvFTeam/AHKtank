@echo off
set "dest=%LOCALAPPDATA%\TslGame\Saved\Config\WindowsNoEditor\"
set "filename=GameUserSettings.ini"
xcopy "%filename%" "%dest%" /y
taskkill /IM TslGame.exe /F