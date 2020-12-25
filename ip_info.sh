# разрешить програаме работать через определенный интерфейс
https://unix.stackexchange.com/questions/210982/bind-unix-program-to-specific-network-interface

# metric приоритет
nmcli connection
sudo nmcli connection modify "Wired connection 1" ipv4.route-metric 102
nmcli connection up "Wired connection 1"

nmcli -t -f NAME,DEVICE con
route -n
sudo systemctl restart NetworkManager

# Отключить eth0 навсегда
# https://askubuntu.com/questions/427922/disable-network-permanently
sudo vim /etc/network/interfaces
iface eth0 inet manual

# ping через интерфейс
ping -c1 -I enp0s8 8.8.8.8

ip link | awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2;getline}'

iw dev | awk '$1=="Interface"{print $2}'
