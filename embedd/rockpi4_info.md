# Чтобы заработал дисплей 
- enable raspberry pi official 7 inch LCD support   
- https://wiki.radxa.com/Rockpi4/Raspberry_Pi_official_LCD
- Ubuntu server 18.04

- Раскоментить в файле:

##### /boot/hw_intfc.conf

bash                  
intfc:dtoverlay=raspberrypi-7-inch-lcd

# Еще ссылки

- https://wiki.radxa.com/Rockpi4/hardware/display
- https://wiki.radxa.com/Rockpi4/Ubuntu opencv 4.0

# chromium-browser install

bash
sudo apt-get install software-properties-common
sudo apt-get install chromium-browser

# Прошивки

- https://wiki.radxa.com/Rockpi4/downloads

# Распиновка

- https://www.instructables.com/id/Raspberry-Pi-Touchscreen-Setup/

# autologin ubuntu server

- https://askubuntu.com/questions/819117/how-can-i-get-autologin-at-startup-working-on-ubuntu-server-16-04-1

bash
sudo apt install xinit xorg x-window-system gnome-core
sudo adduser user
sudo usermod -aG sudo user
sudo systemctl edit getty@tty1.service

bash
[Service]
ExecStart=
ExecStart=-/sbin/agetty --noissue --autologin user %I $TERM
Type=idle

- Добавить в конце файла /home/user/.bashrc

bash
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx # && chromium-browser google.com

##### /etc/X11/Xwrapper.config

bash
allowed_users = anybody
