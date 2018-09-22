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
dashboard -style prompt '(gdb)' # изменить приглашение promt

i shared # посмотреть динамические библиотеки приложения

#чтобы изменения были постоянными
mkdir -p ~/.gdbinit.d
dashboard -configuration ~/.gdbinit.d/auto

r/run [args] # run или рестарт
c/continue # continue продолжить выполнение
s/step # шаг внутрь функции
si/stepi # ходить по асемблерным иструкциям
ni/nexti # ходить по асемблерным иструкциям
n/next # шаг через функцию
l/list # показать листинг
fin/finish # дойти до конца функции 
ret # выйти из функции
kill # убить
q # выйти из gdb
l +50 # показать +50 строчек от текущей
i b # показать break point list
i proc m # memory maping
i locals # вывести локальные перменные
del 1 # удалить break point number 1
disable 2 # отключить break point 2 но не удалять
where # показать стек и где мы сейчас находимся
b ./source/main.cpp:58 # поставить break point на строке 58 в файле ./source/main.cpp
b ./source/main.cpp:60 if a == 5 # условная точка останова
cond 1 $rdi==0x0 # изменить брейкпоинт 1 на условный
bt/backtrace
f/frame
backtrace full
up/down number # перемещение по стеку
i/info
info frame
display var0 # будет показывать перменную var0 всегда

set  print array on # выводить массив построчно
set  print array-indexes off # чтобы не печатались индексы в массиве
set environment LD_BIND_NOW=1 # если будет ошибка dl-trampoline.h при записи
record full # чтобы записать пошаговое выполнение а потом перематывать
record stop # остановить запись
info record
record save filename
record goto start
record goto end
reverse-step # шаг назад
reverse-stepi # шаг назад на одну asm иструкцию


#p/print
#p/(x,o,d,f,c,t)
p/x *(uint8_t *)input@13 # вывести 13 байт из переменной input
p/x (uint8_t[5])input # вывести 5 байт
p/t input # bin 01010010110101010

x/224b var # вывести 224 байта
x/224h var # вывести 224 half 
x/224w var # вывести 224 word 

set environment LimitMEMLOCK = 256M # установить переменную окружения через gdb
set ctx0->hash[0] = 0 # установить значение переменной
show environment LimitMEMLOCK # посмотреть переменную окружения через gdb
unset environment LimitMEMLOCK # без комментарием
path directory # добавить directory в path
show paths
ulimit -c unlimited # gdb core dump
