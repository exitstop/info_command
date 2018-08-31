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
#посмотреть динамические библиотеки приложения
i shared
# изменить приглашение promt
ard -style prompt '(gdb)'
#чтобы изменения были постоянными
mkdir -p ~/.gdbinit.d
dashboard -configuration ~/.gdbinit.d/auto

s # шаг внутрь функции
n # шаг через функцию
l # показать листинг
l +50 # показать +50 строчек от текущей
i b # показать break point list
del 1 # удалить break point number 1
b ./source/main.cpp:58 # поставить break point на строке 58 в файле, файл может не находится если выполнилась до этого файла
