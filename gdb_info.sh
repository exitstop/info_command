#открыть исходник при отладке
ctrl+x a
#запусть программу с параметрами
gdb -args ./prog param1 param2
#перенаправляем dashboard в другой терминал по tty - его можно узнать с помощью команды tty
dashboard -output /dev/pts/2
#меняем размер окна source 
dashboard source -style context 17
#оставляем включенным только некоторые окна
dashboard -layout source stack threads
# то что с восклицательныйм знаком будет отключено
dashboard -layout source stack !assembly !expressions !history !memory !registers !threads
#посмотреть динамические библиотеки приложения
i shared
# изменить приглашение promt
dashboard -style prompt '(gdb)'
#чтобы изменения были постоянными
mkdir -p ~/.gdbinit.d
dashboard -configuration ~/.gdbinit.d/auto

r # run или рестарт
c # continue продолжить выполнение
s # шаг внутрь функции
n # шаг через функцию
l # показать листинг
finish # выйти из функции
l +50 # показать +50 строчек от текущей
i b # показать break point list
del 1 # удалить break point number 1
b ./source/main.cpp:58 # поставить break point на строке 58 в файле, файл может не находится если выполнилась до этого файла

p/x *(uint8_t *)input@13 # вывести 13 байт из переменной input
p/x (uint8_t[5])input # вывести 5 байт

x/224b var # вывести 224 байта
x/224h var # вывести 224 half 
x/224w var # вывести 224 word 

set environment LimitMEMLOCK = 256M # установить переменную окружения через gdb
set ctx0->hash[0] = 0 # установить значение переменной
show environment LimitMEMLOCK # посмотреть переменную окружения через gdb
unset environment LimitMEMLOCK # без комментарием
path directory # добавить directory в path
show paths
