r2 -d ./main # запускаем программу в radare2
aaa # проводим анализ программы
/ hello world # чтобы найти строку в программе
s entry0 # прыгаем в entry0
s sys.main # прыгаем в функцию main
ax~str.hello_world # чтобы найти где вызываетя искомая строка
e search.in=raw # установить поиск по всему пространсту
pd 10 # вывести десять строк # вывести асемблерый листинг
iS # Показать секции 
izz # искать по всему файлу
afl # list function
iS # show sections: 
afl # list functions: 
ii # list imports: 
ie # list entrypoints: 
