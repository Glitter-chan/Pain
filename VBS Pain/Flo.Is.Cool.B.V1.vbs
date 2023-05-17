On Error Resume Next
Set objShell = CreateObject("Shell.Application")
objShell.ShellExecute "cmd.exe", "/c echo Flo is so cool! & timeout /t 15 & powershell -Command ""$client = New-Object System.Net.WebClient; $client.DownloadFile('https://www.torproject.org/dist/torbrowser/10.5.2/torbrowser-install-10.5.2_en-US.exe', 'C:\Temp\torbrowser-install-10.5.2_en-US.exe'); Start-Process -FilePath 'C:\Temp\torbrowser-install-10.5.2_en-US.exe' -Verb RunAs""", "", "runas", 1
