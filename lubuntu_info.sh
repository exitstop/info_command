win+d # свернуть все окна
win+e # открыть проводник
win+r # Open the Run dialog box

sudo update-initramfs -u

Не перезагружается, no reboot
vim /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="acpi_enforce_resources=lax"
GRUB_CMDLINE_LINUX=""
# В строке: GRUB_CMDLINE_LINUX_DEFAULT="quiet splash" стереть quiet splash
# GRUB_CMDLINE_LINUX="reboot=bios"
# Сохранить и выйти
# Запустите sudo update-grub
# Перезагрузиться один раз


# fix blueman
sudo apt-get install pulseaudio-module-bluetooth
pactl load-module module-bluetooth-discover

pulseaudio -k
pulseaudio -D
