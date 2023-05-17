@echo off

REM Download the GIF file
powershell -Command "& { Invoke-WebRequest -Uri 'https://64.media.tumblr.com/acda81d74755683b00252baddbc9efb9/c94dfc5c1b3959c9-d3/s540x810/928b2b8c517da84965873e7a17bff6400102f897.gifv' -OutFile 'boot.gif' }"

REM Modify the Boot Configuration Data (BCD) to boot into the GIF
bcdedit /set {bootmgr} displaybootmenu yes
bcdedit /set {current} kernel C:\boot.gif

REM Reboot the computer
shutdown /r /t 0
