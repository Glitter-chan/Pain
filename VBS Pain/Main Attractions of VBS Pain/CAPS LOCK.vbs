Set WSHShell = WScript.CreateObject("WScript.Shell")
Do
    WSHShell.SendKeys "You've been hacked! "
    WScript.Sleep 1000
    WSHShell.SendKeys "{CAPSLOCK}"
    WScript.Sleep 1000
    WSHShell.SendKeys "{CAPSLOCK}"
    WScript.Sleep 1000
    WSHShell.SendKeys "{CAPSLOCK}"
    WScript.Sleep 1000
    WSHShell.SendKeys "{BACKSPACE 15}"
Loop
