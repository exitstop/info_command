#запускаем программу в radare2
r2 -d ./main
#проводим анализ программы
aaa
#чтобы найти строку в программе
/ hello world
#прыгаем в entry0
s entry0
#прыгаем в функцию main
s sys.main
#чтобы найти где вызываетя искомая строка
ax~str.hello_world
