#прочитать файл по 1 байту(bs=1), 5 байт подряд(count=5),
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

#поиск по исходному коду
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

# офлай диффер offline differ
sudo apt install meld

# ssh ipv6 подключаемся к удаленному ssh по ipv6 с опцией -X x-сервера чтобы не было проблем с буфером обмена
# StrictHostKeyChecking=no - чтобы ssh не проверяло ключ если мы еще не подключались к данному хосту
sshpass -p "password" ssh -X -6 -o "StrictHostKeyChecking=no" user@2001:0:11a1:61c:3171:8611:410c:f112

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

# просмотр системного лога
tail -f /var/log/syslog

# версия usbasp
avrdude -c usbasp -p attiny84 -vvvv

strace --tt -ff -D -o /tmp/log.txt programm

# Armoney for linux scanmem
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
