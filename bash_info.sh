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
