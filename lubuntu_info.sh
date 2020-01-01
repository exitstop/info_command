win+d # свернуть все окна
win+e # открыть проводник
win+r # Open the Run dialog box

sudo update-initramfs -u

Не перезагружается, no reboot
# Введите sudo vim /etc/default/grub
# В строке: GRUB_CMDLINE_LINUX_DEFAULT="quiet splash" стереть quiet splash
# Сохранить и выйти
# Запустите sudo update-grub
# Перезагрузиться один раз
