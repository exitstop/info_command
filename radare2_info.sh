r2 -d ./main # запускаем программу в radare2
aaa # проводим анализ программы
/ hello world # чтобы найти строку в программе
s entry0 # прыгаем в entry0
s sys.main # прыгаем в функцию main
ax~str.hello_world # чтобы найти где вызываетя искомая строка
e search.in=raw # установить поиск по всему пространсту
pd 10 # вывести десять строк # вывести асемблерый листинг
iS # Показать секции 
izz | grep mySting # искать строку по всему файлу
afl | grep myFinction # list function
iS # show sections: 
afl # list functions: 
ii # list imports: 
ie # list entrypoints: 
axt @ sym.bufio.__Reader_.ReadString # xref function
pxw @ local_4h # print variable
pc @ rsp+0x8 # print local_8h

https://radare.gitbooks.io/radare2book/content/basic_commands/print_modes.html
pc # C
pc* # print 'wx' r2 commands
pch # C half-words (2 byte)
pcw # C words (4 byte)
pcd # C dwords (8 byte)
pca # GAS .byte blob
pcA # .bytes with instructions in comments
pcs # string
pcS # shellscript that reconstructs the bin
pcj # json
pcJ # javascript
pcp # python

https://blog.dutchcoders.io/getting-started-with-radare2
afv # показать переменные в текущей функции 'var int local_8h @ rsp+0x8'
drr # Display in colors and words all the refs from registers or memory
dbt # Display backtrace based on dbg.btdepth and dbg.btalgo
dm= # List memory maps of target process (ascii-art bars)
afvn local_8h unknowvariable_0 # rename variable

# shortcut
F2 or b toggle breakpoint
F4 run to cursor
F7 single step
F8 step over
F9 continue
