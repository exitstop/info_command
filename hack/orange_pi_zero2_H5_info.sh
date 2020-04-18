# при помощи gparted создал раздел fat32 4gb на флешке samsun64gb class u3 и с флагом boot

# записываем образ на флешку предварительно отмонтировав флешку 
sudo dd if=Armbian_5.75_Orangepizeroplus2-h5_Ubuntu_bionic_next_4.19.20.img of=/dev/sda bs=32M
sync
# или так
xzcat ~/Downloads/Armbian_5.75_Orangepizeroplus2-h5_Ubuntu_bionic_next_4.19.20.img.xz | sudo dd of=/dev/sda bs=32M
sync

# Насстройка подключения к wifi роутеру

cp /etc/network/interfaces /etc/network/interfacesorig
vim /etc/network/interfaces

[
auto wlan0

iface lo inet loopback
iface eth0 inet dhcp
allow-hotplug wlan0

iface wlan0 inet static
address 192.168.0.150
netmask 255.255.255.0
gateway 192.168.0.1
wpa-ssid wf-df-24
wpa-psk Unz7ipd*
dns-nameservers 8.8.8.8 192.168.0.1
]

linux
    user: user
    password: rhbdjqGfktw # кривойПалец
 sshpass -p "rhbdjqGfktw" ssh -o "StrictHostKeyChecking=no" user@192.168.0.150

# перегрузисть интеренет
/etc/init.d/networking restart

sudo ifdown wlan0
sudo ifup wlan0

# смотреть частоту процессора и температуру
armbianmonitor -m

# записываем образ на emmc
sudo nand-sata-install
# выбрать пункт Boot from eMMC - 


# checkwifi
ping -c4 192.168.0.1 > /dev/null
 
if [ $? != 0 ] 
then
  sudo ifconfig wlan0 down
  sleep 5
  sudo ifconfig wlan0 up
fi

sudo chmod 775 /usr/local/bin/checkwifi.sh

*/5 * * * * /usr/bin/sudo -H /usr/local/bin/checkwifi.sh >> /dev/null 2>&1

# консольная настройка сети
sudo nmtui

# отрубить wifi
nmcli radio wifi off
#/sbin/iwconfig wlan0 power off

# wifi монитор
wavemon

# hange траблы с ssh
# добавить в /etc/ssh/sshd_config
IPQoS 0x00
# и перезагрузить ssh service
sudo service ssh restart
