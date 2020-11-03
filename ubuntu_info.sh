# atl+shit 
sudo apt install gnome-tweaks
sudo apt install gnome-startup-applications

отключить Wayland

/etc/gdm3/custom.conf

WaylandEnable=false
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

sudo gdm3 -reset # ???

#fn not work?
https://www.youtube.com/watch?v=gFvwL0hzEFg
esc + fn

# always on bottom
# https://askubuntu.com/questions/351720/how-to-start-an-application-with-bottom-most-property
sudo apt-get install devilspie4
vim ~/.config/devilspie2/chromium.lua
```bash
debug_print("Window Name: " .. get_window_name())
debug_print("Application name: " .. get_application_name())
debug_print("WM_CLASS: " .. get_class_instance_name())
debug_print("Window Class: " .. get_window_class())
if (string.match(get_application_name(),"Chrome$")) then
   set_window_below();
end
```

devilspie2 --debug

sudo systemctl restart gdm

sudo vim /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nomodeset"
update-grub
sudo reboot


