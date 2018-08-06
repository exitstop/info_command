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
