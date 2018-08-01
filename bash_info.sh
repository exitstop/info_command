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
