#прочитать файл по 1 байту(bs=1), 5 байт подряд(count=5),
#one(if=one) начиная со смещения 0(skip=0) 
#и записать в файл two(of=two) начиная со смещения 1(seek=1) 
#и не затирать конец файла two (conv=notrunc)

dd bs=1 count=5 if=one of=two skip=0 seek=1 conv=notrunc
