прочитать файл по 1 байту(bs=1), 5 байт подряд(count=5),
#one(if=one) начиная со смещения 0(skip=0) 
#и записать в файл two(of=two) начиная со смещения 1(seek=1) 
#и не затирать конец файла two (conv=notrunc)
dd bs=1 count=5 if=one of=two skip=0 seek=1 conv=notrunc
#conver webm to mpr
FILE="the-file-you-want-to-process.webm";
ffmpeg -i "${FILE}" -vn -ab 128k -ar 44100 -y "${FILE%.webm}.mp3";
#тоже самое но в цикле
for FILE in *.webm; do
    echo -e "Processing video '\e[32m$FILE\e[0m'";
    ffmpeg -i "${FILE}" -vn -ab 128k -ar 44100 -y "${FILE%.webm}.mp3";
done;
#посмотреть динамические библиотеки забущенного процесса
lsof -p <pid>
#удалить имена функций из программы 
strip program
#посмотреть имена функций которые есть в программе
nm program
#установить ssh и включить
sudo apt install ssh
sudo systemctl enable ssh
#рекурсиваня замена во всех файлах
a=hello&&b=hello2&& grep -rl "$a" | xargs sed -i "s/$a/$b/g"
#рекурсиваня замена в файлах *.h 
a=hello&&b=hello2&& grep -l "$a" `find -name "*.h"` | xargs sed -i "s/$a/$b/g"

# Замена с raw string
a="http:\/\/site.com\/beta\/"&&b="/"&& \
    grep -l "$a" `find -name "*.gohtml"` | xargs sed -i "s#"$a"#"$b"#g"
a="http:\/\/site.com\/beta\/"&&b="/"&& \
    grep -l "$a" `find -name "*.gohtml"` | xargs sed -i "s/"$a"/"$b"/g"

#посмотреть сколько места в системе
df -h
#посмотерть сколько весят папки и файлы в текущей дериктории и отсортировать
du -hs * | sort -h
#включить чтобы дампился segfault в файл core для отладки в gdb
unlimit -c unlimited
#Утилита для мониторинга и диагностики системы
dstat -tldnpms 10

#горячие клавиши
ctrl+h #удалить один символ назад
ctrl+d #удалить один символ вперед

ctrl+u #удалить символы до курсора
ctrl+k #удалить символы после курсора 

ctrl+p #вставить удаленное

#конфертирование line end recursive
find . -type f -print0 | xargs -0 dos2unix

#поиск по исходному коду grep аналог grep; grep для програмистов
ack functionName

# монтирование флешки
sudo fdisk -l
sudo mount
sudo mount /dev/sdb3/ /mnt/my_dir

# tab to space recursive
find . -type f -exec sed -i.orig 's/\t/    /g' {} +
# tab to space one file
sed -i.orig 's/\t/    /g' file.cpp 
# рекурсивно удалить файлы с расширением txt
find -name "*.txt" -exec rm -rf {} +

# gdb core dump
ulimit -c unlimited

# ld чтобы библиотека нашлась в текущем каталоге
export LD_LIBRARY_PATH=.
export LD_PRELOAD=. # или это

# графическая настройка мониторов
arandr

# создать ярлык для приложения
/usr/share/applications # здесь лежат другие ярлыки, нужно скопировать и переделать для своего приложения

# получить полный путь к файлу
readlink -f k1-tmp

# compare, сравнение
# офлай диффер offline differ
sudo apt install meld

# ssh ipv6 подключаемся к удаленному ssh по ipv6 с опцией -X x-сервера чтобы не было проблем с буфером обмена
# StrictHostKeyChecking=no - чтобы ssh не проверяло ключ если мы еще не подключались к данному хосту
sshpass -p "password" ssh -X -6 -o "StrictHostKeyChecking=no" user@2001:0:11a1:61c:3171:8611:410c:f112

# Передача файлов
sshpass -p "password" scp -6 user@\[2001:0:00aa:04c:0f3:e000:0300:f312\]:/home/user/project/test/libethash/main.go .

scp -i id_rsa -P1026 -o "StrictHostKeyChecking=no" Terminal.tar.gz nvidia@localhost:/home/nvidia

# вывести только строки от 1 до 18
sed -n 1,18p file.cpp

# кракозябры 
iconv -f WINDOWS-1251 -t UTF-8 -o converted.txt original.txt

# Загрузка youtube видео через консоль 
# 1. Смотрим возможное разрешение и качество звука.
youtube-dl -F "https://www.youtube.com/watch?v=2Mi3MRKtg2M"
# 2. Скачиваем видео и звук 
youtube-dl -f 160+250 "https://www.youtube.com/watch?v=2Mi3MRKtg2M"
youtube-dl -F "https://www.youtube.com/watch?v=2Mi3MRKtg2M"

sudo ldconfig
# обновить db locate
sudo updatedb

# kill x11 x-server; убить иксы
sudo service lightdm stop
# включить иксы
sudo service lightdm start

# to switch to terminal
ctrl+alt+F1
# which is your current xorg session
ctrl+alt+F7

# переустановка пакета через pip
sudo pip install --ignore-installed dlib

# profile c++ cpu
valgrind --tool=callgrind ./myprog
kcachegrind

# diff hex
dhex one.bin two.bin

# diff каталогово рекурсивно
diff -r folder1 folder2
# игнорируя изменения, связанные с добавлением пустых строк, пробелов, табуляции, а также используем шаблоны имен файлов в excludeFiles, чтобы исключить из сравнения ненужные файлы
diff -rwBd -X excludeFiles mydir1 mydir2

# поиск измененных файлов за последние 2 дня
find / -type f -mtime -2 -depth -3 | sort -r
find / -type f -mmin -60 | sort -r
find / -type f -printf '%TY-%Tm-%Td %TT %p\n' -mmin -60 | sort -r

# узнать путь до самого себя под линуксом
ll /proc/self/exe

# просмотр системного лога; хвост
tail -f /var/log/syslog

# версия usbasp
avrdude -c usbasp -p attiny84 -vvvv

strace -tt -ff -D -o /tmp/log.txt programm

# Artmoney for linux scanmem artmoney
sudo apt install scanmem

# HIEW под linux и windows тоже
sudo apt install biew

# просто подсветить с помощью grep
ldd * | grep --color=auto -B100000 -A100000 "utils"

# поиск хексов в бинарных файлах
grep -Pcr "\x0f\x84\x5d\x01\x00\x00" 

# авто отключени мышки фикс
echo 2 | sudo tee /sys/bus/usb/devices/*/power/autosuspend >/dev/null
echo on | sudo tee /sys/bus/usb/devices/*/power/level >/dev/null

# hex редактор хексредактор
bless

# трассировка lib ; See LD_DEBUG=help for more options or man ld.so
# http://www.bnikolic.co.uk/blog/linux-ld-debug.html
LD_DEBUG=libs ./main
LD_DEBUG=all ./main

# следим за процессам, смотрим какие программы запускаись trace
https://github.com/brendangregg/perf-tools


# включить адресс барк address bar строку path в selcet file
Ctrl + L

# редактор binary бираный elf
hte prog

для VR nvc
# запускаем и подключаемся к своему рабочему столу 192.168.0.102:5900
x11vnc -display :0 -rfbport 5901
# чтобы не выключался
x11vnc -usepw -display :0 -q -forever -rfbport 5901

vncviewer -PreferredEncoding=ZRLE 192.168.88.143:5901

# qemu
qemu-system-x86_64 -m 1024 -cdrom lubuntu-16.04.5-desktop-amd64.iso
# Загрузиться с флешки в эмуляторе
# Способ 1:
qemu-system-x86_64 -m 512 -hda /dev/sdx
# Способ 2:
lsusb
#Вывод (пример):
#Bus 002 Device 007: ID 8564:1000 Transcend Information, Inc. JetFlash
sudo qemu-system-x86_64 -usb -usbdevice host:8564:1000

# Создание виртульаного обрза жесткого диска
qemu-img create lubuntu.img 20G
# Запуск с этим вирутальным жестким диском
qemu-system-x86_64 -hda lubuntu.img -boot d -cdrom lubuntu-16.04.5-desktop-amd64.iso -m 1024 -smp 2 -machine type=pc,accel=kvm
# После того как все будет установлено систему можно запустить так
qemu-system-x86_64 -hda lubuntu.img -m 1024 -smp 2 -machine type=pc,accel=kvm

# power pc
qemu-ppc -cpu e500v2 hello

# посмотерть информацию о файле, и времени модификации, и создания
stat file.sh 

# с какими атрибутами будет создаваться файл
umask
# смотреть атрибуты
lsattr

# Мониторим поступление новых данных в файл, мониторим дозапись, следим за файлом, непрерывно читаем
tail -f file

# информация о пароле пользователя
sudo passwd -S user
sudo chage -l user

# не дать менять пароль 30 дней
sudo passw  -n 30 user
sudo chage -m 30 user

# изменить срок действия пароля пользователя
sudo passw  -x 40 user
sudo chage -M 40 user

# предупредить об истекании срока действия пароля
sudo passw  -W 5 user
sudo chage -w 5 user

# в какой день заблокировать пользователя
sudo chage -E 2019-03-18 user

# удалить пользователя но оставить доманюю дерикторию
sudo userdel user
# удалить пользователя с домашней дерикторией
sudo userdel -r user

# как сменить пароль суперпользователя ubuntu без флешки
# чтобы попасть в gpub жмем esc и держим
# нажать e во время загрузки дописать в linux сделать rw init=/bin/sh и удалить все что было до ro
# перемонтировать раздел на чтение запись 
mount -o remount,rw /
# поменяем пароль
passwd user
# заставим систему загрузить
exec /sbin/init

# serial port
sudo screen /dev/ttyUSB0 115200

# генерация листа перебора паролей
# от 3 символов до 9 с символами qwertyuiopasdfghjklzxcvbnm
crunch 3 9 qwertyuiopasdfghjklzxcvbnm

# перегрузить интренет
/etc/init.d/networking restart

# смотреть кто какие порты использует
lsof
# Перехват и модификация трафика аналог charles
# Может подменить обновление приложения на свой код
burpsuite

# программа для создания обратных соедениений, можно сделать чат
ncat

# serial port
dmesg | grep tty
dmesg | egrep --color 'serial|ttyS'
picocom -b 115200 /dev/ttyUSB0 --imap lfcrlf
#setserial -g /dev/ttyUSB0
#stty -F /dev/ttyUSB0 inlcr
#stty -F /dev/ttyUSB0 onlcr
#cu -l /dev/ttyUSB0 -s 115200
#screen /dev/ttyUSB0 115200
#screen /dev/ttyUSB0 115200,cs8
#minicom
#putty
#tip -115200 ttyUSB0 

# ип калькулятор subnet
ipcalc 192.168.0.102
ipcalc 192.168.0.102/24

nmap -F 192.168.0.0/24
sudo nmap -sS 192.168.0.102
# определить версию
sudo nmap -sV 192.168.0.100
# Высветить имена hostname
sudo nmap -sn 192.168.88.0/24

sshpass -p "password" sudo sshfs -o allow_other -o "StrictHostKeyChecking=no" root@192.168.0.100:/home/user/ /mnt/sshmount2

# проверка монтирования удаленной файловой системы
df -hT
# размонтировать
sudo umount /mnt/folder

echo "password" | sudo sshfs -o password_stdin -o allow_other -o "StrictHostKeyChecking=no" root@192.168.0.150:/home/user/ /mnt/sshmount

# vim ssh sshfs
mkdir ~/remoteserv
sshfs -o idmap=user <username>@<ipaddress>:/remotepath ~/remoteserv

systemctl list-units --type=service
systemctl list-units --type=target


# превратить пробелы в табы
unexpand
# превратить табы в пробелы
expand

# управление процессами
sleep 60&
# показать фоновые и активные процессы текущей консоли
jobs
# вернуть в активный режим
fg 1
# вернуть в фоновый режим
bg 1

# застопорить процесс
ctrl+z

# чтобы процесс остался после выхода из системы
nohup sleep 60&

# полное удалие файла, затирание
shred -u -n 35 /path/to/file

# должен удалять катологи
wipe -rf /path/to/catalog

# восстановление удаленных файлов
debugfs

# здесь монтируются диски
cat /etc/fstab
# монтируется командой
echo "/dev/sdb1 /mnt/hard_drive auto rw,user,auto,noexec 0 2" >> /etc/fstab
# или UUID монтирование
echo "UUID=bbbf3ffd-bca1-1235-1231-141321acb221 /mnt/hard_drive auto rw,user,auto,noexec 0 2" >> /etc/fstab

# узнать версию дистрибутива
cat /etc/issue

# создать папку в виртуальной памяти
# супер быстрая память
mkdir -p /mnt/ram
mount -t tmpfs tmpfs /mnt/ram -o size=8192M

# редактировать предыдущую команду в редакторе
fc
ctrl+x+e

# создать кучу папок с подпапками с нумерацией
mkdir -p folder/{sub1,sub2}/{sub1,sub2,sbu3}
mkdir -p folder/{1..100}/{1..100}

# взять аргумент предыдущией команды
!$

# слуашет tcp и upd
nc -lp 1337

# ncat из пакета nmap, ждет соединения
ncat -l 5555

# вывести uuid
sudo blkid

# speed test
# проверить скорость между узлами локальной сети
# на сервере
iperf -s -i 1
watch -n 12 iperf3 -s -i 1
speedtest-cli

# на клиенте
iperf -c 192.168.0.102
iperf3 -c 192.168.0.102

# ixondif
ip addr
ip maddr

# Пробрасываем удаленный порт к локальному
ssh -R 1234:localhost:5555 192.168.0.102

# Проброс порта на aws чтобы через aws можно было подключится к локальноый машине по ssh на порт 22
# на aws можно будет подключатся по порту 5555
sudo ssh -i "ssh_device.pem" -R 5555:localhost:22 ubuntu@12.12.12.12

# посмотреть открытые порты
netstat -ntulp
lsof -i

sudo sysctl -w net.ipv4.ip_forward=1
# редирект порта с удаленного 1234 на наш локальный
sudo iptables -t nat -A PREROUTING -p udp --dport 1234 -j REDIRECT --to-port 5555
# Удалить редирект
sudo iptables -t nat -D PREROUTING -p udp --dport 1234 -j REDIRECT --to-port 5555

iptables -t nat -A PREROUTING -p udp -d 192.168.0.102 --dport 1234 -j DNAT --to-destination 192.168.0.102:5555

# смотреть конфиг iptable
sudo iptables -t nat -L
sudo iptables -L -v -n --line-numbers

# Удалить все правила
sudo iptables -t nat -F

sshpass -p "password" ssh root@192.168.0.102 -p5555 -L 1234:localhost:1234 -N -C -o "CompressionLevel=9"

# Перенаправить на собого себя
ssh -i id_rsa -L 0.0.0.0:9223:localhost:9222 nvidia@localhost -N

# сработало
sshpass -p "passowrd" ssh user@192.168.0.102 -L 5555:localhost:1234 -N -C&
# слушать
nc -l -t 1234
# послать
echo hellow | ncat -v -t localhost 5555

# перенаправить с udp на другой udp
socat -T15 udp4-recvfrom:1234,reuseaddr,fork udp:127.0.0.1:5555
socat -T15 udp4-recvfrom:1234,reuseaddr,fork udp:192.168.0.150:5555

# 11ac wifi improve ускоряем wifi 5g
# в файл /etc/modprobe.d/iwlwifi.conf
options iwlwifi 11n_disable=1
options iwlwifi swcrypto=1
options iwlwifi 11n_disable=8
options iwlwifi bt_coex_active=0

# Jetson TX2
# в файл /etc/modprobe.d/iwlmvm.conf
options iwlmvm 11n_disable=1
options iwlmvm swcrypto=1
options iwlmvm 11n_disable=8
options iwlmvm bt_coex_active=0

# временные изменения до перезагрузки
sudo modprobe -r iwlwifi
sudo modprobe iwlwifi 11n_disable=8

# Jetson TX2
sudo modprobe -r iwlmvm
sudo modprobe iwlmvm 11n_disable=8

# trouble volume sound
pulseaudio --check
# If any instance is running:
pulseaudio -k
# Finally, start pulseaudio again as a daemon:
pulseaudio -D

# Сборка deb пакета
sudo apt-get install autoconf automake libtool autotools-dev dpkg-dev fakeroot

# fonts шрифты
xlsfonts

# микрофон подавление шума
sudo vim /etc/pulse/default.pa
# Добавить в конец файла
load-module module-echo-cancel source_name=baresip aec_method=webrtc format=s16le rate=8000 channels=1
set-default-source baresip
set-default-sink 2

# температура sensors psensors
sudo apt install psensor

# очистка журналов
# https://shpargalki.org.ua/199/journalctl-where-are-logs-and-how-much-they-take
sudo journalctl --vacuum-size=100M

# Список wifi сетей
nmcli device wifi 

# посмотреть mac
ifconfig -a | grep ether | gawk '{print $2}'
ip link show
# парсинг mac address
ifconfig | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'

# change mac

# get temp температура sensors
sudo add-apt-repository ppa:fossfreedom/indicator-sysmonitor
sudo apt-get update
sudo apt-get install indicator-sysmonitor

sensors | grep "Core 0" | grep -o -E '([[:digit:]]{1,3}\.[[:digit:]])' | head -n 1

# exiftool метаданные
sudo apt-get install libimage-exiftool-perl
exiftool file

# узнать внешний ip
curl ifconfig.me

# создать торрент torrent
sudo apt-get install ctorrent
ctorrent -t -u "http://tracker.example.com:6969/announce" -s example.torrent file_or_dir_to_upload

crontab -e
# прописать примерно вот это
#SHELL=/bin/bash
#HOME=~/
#MAILTO=”user@andreyex.ru”
##This is a comment
##* * * * * sudo -u user vboxmanage list vms > /home/user/Documents/local/source/virtualbox/time
## Каждые пять минуть выполнять это
#*/5 * * * * sudo -u user VBoxManage controlvm "Windows 7" pause > /home/user/Documents/local/source/virtualbox/err

# clang-format
find . -regex '.*\.\(cpp\|hpp\|cc\|cxx\|c\|h\)' -exec clang-format-6 -style=file -i {} \;

# запись звука 10 секунд
arecord -vv -fdat -d 10 stackoverflow.wav

# internet monitor монитор трафика bandwidth
sudo iftop -i wlo1 -P -f "dst port 1234"
sudo iftop -i wlo1 -P -f "src host 192.168.0.168"

$1, $2, $3, ... are the positional parameters.
"$@" is an array-like construct of all positional parameters, {$1, $2, $3 ...}.
"$*" is the IFS expansion of all positional parameters, $1 $2 $3 ....
$# is the number of positional parameters.
$- current options set for the shell.
$$ pid of the current shell (not subshell).
$_ most recent parameter (or the abs path of the command to start the current shell immediately after startup).
$IFS is the (input) field separator.
$? is the most recent foreground pipeline exit status.
$! # pid last process ; pid последнего процесса; is the PID of the most recent background command.
$0 is the name of the shell or shell script.

# sound bluetooth android to pc
pulseaudio --check
pulseaudio -k
pulseaudio -D
sudo apt-get install pulseaudio pulseaudio-module-bluetooth
sudo apt-get install blueman

# windows usb create
sudo woeusb --device /home/user/Downloads/ru-en_win7_sp1_ie11+_x86-x64_8in1_KMS-activation_v5.iso /dev/sdb

# mmv mvq rename
rename -n -v 's/4_(\d+)/"6_".($1 + 1)/e' 3_*
#rename(3_0.png, 6_1.png)
#rename(3_1.png, 6_2.png)
#rename(3_2.png, 6_3.png)

# аунтификация по паролю
curl -X POST -F 'username="hello"' -F 'password="itsme"' localhost:8080/login
# сохранить coockie
curl -X POST -F 'username="hello"' -F 'password="itsme"' -c cookie.txt localhost:8080/login
# использовать сохраненные куки
curl -b cookie.txt http://localhost:8081/private/status

#ack поиск 
# найти точное совпадение слова profile чтобы в строке не было слова github
ack '^(?!.*github).(\bprofile\b)'

# wifi через консоль
nmcli dev wifi connect $ACCESS_POINT password $PASSWORD

# get chmod получить разрешения файла в виде цифр 755 777 666 600
stat --format '%a' /etc/default/

# поиск java
grep -l "TODO" *.java
find . -name "*.java" -exec grep -il "TODO" {} \;
find . -name "*.java" | xargs -I {} grep -l "TODO" {}

# поиск всех jpg и архивирование их в tar
tar -cvf images.tar $(find / -type f -name *.jpg)
tar -rvf images.tar $(find / -type f -name *.jpg)
find / -type f -name "*.jpg" -exec tar -cvf images.tar {} \;

# найти ip в подсети
nmap -sn 192.168.1.0/24

# Создать deb
sudo make package

# watch max speed interface
ethtool enp3s0

# Настройка wifi 
nmtui

# bin hex byte search
sudo apt install binwalk

# get hostname localhost
nbtscan 192.168.31.0/24
#mdns-scan
#mzclient

# Добавить локальный репозиторий
sudo add-apt-repository 'deb file:///var/nv-tensorrt-repo-cuda10.1-trt5.1.5.0-ga-20190427 /'

# индефицировать hash what is hash
hashid -m ''

# scan local netwrok host name
sudo nmap -sn 192.168.88.0/24

#Auto login ubuntu command line
#Add the following line to /etc/pam.d/lightdm
auth        sufficient  pam_succeed_if.so user ingroup nopasswdlogin

sudo groupadd -r nopasswdlogin
sudo gpasswd -a <username> nopasswdlogin
sudo systemctl restart lightdm

# Смотировать
sudo mount -o loop backup.secure.img.raw /mnt/loop

# Включить интернет на кабель
sudo ip link set dev eth0 down
sudo dhclient eth0

# display
export DISPLAY=:0.0
ssh -Y username@remote_hostname_or_ip_address

touch -d "1 hours ago" two

# web camera
sudo apt-get install cheese

# ssh guard protect
sudo iptables --list sshguard --line-numbers --numeric
sudo iptables --delete sshguard

sudo vi /etc/lightdm/lightdm.conf.d/20-lubuntu.conf
```bash
[SeatDefaults] 
user-session=LXDE
autologin-user-timeout=0
#allow-guest=true
autologin-guest=true
autologin-user=nvidia
```

# build deb from make install
https://wiki.debian.org/ru/HowToPackageForDebian

# распаковать deb пакет
dpkg-deb -R linuxqq_v1.0.2-beta1_i386.deb linuxqq
# запаковать deb пакет
dpkg-deb -b linuxqq/ linuxqq.deb

# удалить dpkg
sudo dpkg -r $(dpkg-deb -f foo.deb Package)

# загрузить cpu на 100%
sudo apt-get install stress-ng
stress-ng --cpu 6 --cpu-method matrixprod  --metrics-brief --perf -t 60O
sudo apt-get install stress-ng

# binary diff path бинарый дифф
http://www.daemonology.net/bsdiff/
sudo apt install bsdiff

# scrot скриншон screenshot
scrot MyScreenshot.png

# uname -m x86_64 aarch64
uname -m

# найти файлы по типу и показать их размер и суммировать
find . -type f -name '*.json' -exec du -ch {} +

# Сделать дистрибутив из своей системы
# Не работает
#https://gitlab.com/remastersys/respin
#sudo apt-add-repository ppa:sergiomejia666/respin
#sudo apt-get update
#sudo apt-get install respin
#sudo respin
#sudo respin backup|clean|dist [cdfs|iso] [filename.iso]
#sudo respin dist filename.iso

# Сделать дистрибутив из своей системы НЕ РАБОТАЕТ
https://sourceforge.net/projects/pinguy-os/files/ISO_Builder/
wget https://vorboss.dl.sourceforge.net/project/pinguy-os/ISO_Builder/pinguybuilder-menu-based_5.2-1_all.deb
# В пуске появится меню pinguybuilder
# Нужно жмякнуть backup

# fix grub
sudo add-apt-repository ppa:yannubuntu/boot-repair
sudo apt-get update
sudo apt-get install -y boot-repair
boot-repairl

grub> ls
grub> ls (hdX, Y)
grub> set root=(hdX, Y)
grub> set prefix=(hdX, Y)/boot/grub
grub> insmod normal
grub> normal

# systemback НЕ РАБОТАЕТ
https://www.linuxbabe.com/ubuntu/install-systemback-ubuntu-18-04-bionic-18-10

# iso 18.04 НЕ РАБОТАЕТ
https://sourceforge.net/projects/bodhibuilder/

# Рабочий вариант создать iso для 18.04
git clone https://github.com/Distroshare/distroshare-ubuntu-imager

cd distroshare-ubuntu-imager
sudo chmod +x distroshare-ubuntu-imager.sh
./distroshare-ubuntu-imager.sh

xrandr --output DSI-0 --primary --rotate left --mode 720x1280 --output HDMI-0 --off

# E: Could not get lock /var/lib/dpkg/lock-frontend - open (11: Resource temporarily unavailable)
# E: Unable to acquire the dpkg frontend lock (/var/lib/dpkg/lock-frontend), is
another process using it?
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock*
sudo dpkg --configure -a
sudo apt update
