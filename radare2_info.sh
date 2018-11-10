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

# графический режим
VV # открыть граф
V # перейти в графическйи режим кнопками p или n можно перключатся

# diff
radiff2 genuine cracked

# дизасемблировать hex
rasm2 -d 85c00f94c0

# info
? #  подсказка;
aaa #  выполнить анализ файла;
i #  информация о файле;
ie #  узнать, где находится entry point;
ii #  список импортов;
iz #  список строк в секции даннях;
izz #  список вообще всех строк в файле;
is #  список символов;
is~FUNC #  то же самое, но с grep по строке «FUNC»;
is~[6] #  выводить только шестую колонку, то есть, имена символов;
is~main[6] #  можно совмещать фильтрацию с выбором колонки;
b 0x40 #  изменить размер блока по умолчанию;
pd #  дизассемблировать блок по текущему смещению;
pdf #  дизассемблировать текущую процедуру;
pxf #  hexdump текущей процедуры;
pdc #  вывод процедуры в виде псевдокода;
px @ <addr> #  hexdump по определенному адресу или символу;
s <addr> #  перейти к адресу или символу;
sf #  перейти к следующей функции;
s- #  отменить последний переход;
s+1 #  перейти на один байт вперед;
s++ #  перейти на размер блока вперед;
s-- #  перейти на размер блока назад;
V #  визуальный режим (далее hjkl или :команда);
VV @ main #  отображение процедуры в виде графа;
ag main > 1.dot #  экспорт графа процедуры в формате Graphviz;
afl #  список процедур;
afn <name> #  переименовать процедуру;
afvn <from> <to> #  переименовать переменную;
CC <comment> #  добавить комментарий;
CC- <addr> #  удалить комментарий;
CC #  список комментариев;
wx 4142434445 #  записать данные в hex;
wz str #  записать ASCII-строку;
"wa nop;nop;nop" #  записать ассемблерный код;
Ps <file> #  сохранить проект;
Po <file> #  открыть проект;
q #  выйти из Radare2;
