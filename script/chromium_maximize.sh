#!/bin/bash

#get mac address and set as a viarble to be used in url.
MAC=$(ifconfig eth0 | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}')

#get current resolution from xrandr and save the screen size into the chrome Preferences. If not done chome starts in fullscreen with the size of the last window.
cat ~/.config/google-chrome/Default/Preferences | perl -pe "s/\"bottom.*/\"bottom\": $(xrandr | grep \* | cut -d' ' -f4 | cut -d'x' -f2),/" > ~/.config/google-chrome/Default/Preferences
cat ~/.config/google-chrome/Default/Preferences | perl -pe "s/\"right.*/\"right\": $(xrandr | grep \* | cut -d' ' -f4 | cut -d'x' -f1),/" > ~/.config/google-chrome/Default/Preferences

#Turn off screensaver
xset s off

#turn off power management
xset -dpms

#check if chrome is running and if not start it. This is to prevent loops.
if !(ps -A | grep -w chrome > /dev/null)
then

#sleep for 10 seconds because the web page will not load due to network not fully started at first boot.
sleep 10s
google-chrome --kiosk http://phys31223.physics.gatech.edu?mac=$MAC&

#hide the cursor
unclutter -grab
fi
