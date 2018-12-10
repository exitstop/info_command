# https://r2wiki.readthedocs.io
# https://radare.gitbooks.io

r2 -d ./main # запускаем программу в radare2
aaa # проводим анализ программы
/ hello world # чтобы найти строку в программе
s entry0 # прыгаем в entry0
s sys.main # прыгаем в функцию main
ax~str.hello_world # чтобы найти где вызываетя искомая строка
axt @ 0x55e281369784 # xref например на андресс строки
/c 41218c # Lets search for xrefs to the virtual address
/c jmp # поиск ROP search assebmle
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
afvn local_8h unknowvariable_0 # переименовать переменную
afn funtionName # переименовать функцию

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

/x ff..300 # бинарный поиск
f- hit* # удалить все что найдено
f- * # удалить все что найдено
f # показать найденое hit

# анализ hit
af @@ hit* # если hit дал сбой можно переанализировать

# в визуальном режим V
df # чтобы проанализировать функцию от текущего семещния
du # undef this
shfit+o # можно менять jz на c-style if(!var) goto 0x1232;
o # можно прыгнуть на адресс goto
u/U # undo redo

# hash
rahash2 -amd5 hash1
rahash2 -asha256 hash1
rahash2 -L # hash list

# convert type
int   ->  hex    rax2 10
hex   ->  int    rax2 0xa
-int  ->  hex    rax2 -77
-hex  ->  int    rax2 0xffffffb3
int   ->  bin    rax2 b30
bin   ->  int    rax2 1010d
float ->  hex    rax2 3.33f
hex   ->  float  rax2 Fx40551ed8
oct   ->  hex    rax2 35o
hex   ->  oct    rax2 Ox12 (O is a letter)
bin   ->  hex    rax2 1100011b
hex   ->  bin    rax2 Bx63

# распаковать строку
rax2 -s 41 42 43

# декомпилирование
$dec # способ 1
pdda # показывает в два столбца в первом asm во втором C++

dcf # продолжить процесс пока не случилась вилка fork
dcs ptrace # продолжить до системного выхова ptrace

# гоярчик кавиши и команды
https://radare.gitbooks.io/radare2book/debugger/migration.html

# print info section
iS=
# 01  0x00000238 |-#--------------------------------------------------| 0x00000254    28 r--  .interp
# 02  0x00000254 |-##-------------------------------------------------| 0x00000274    32 r--  .note.ABI_tag

# показать библиотеки текущего процесса
il # только имена
dmm # адреса и имена
dm= # в графическом виде имена и адреса lib

dmS libmylib.so # показать секции либы из этого процесса
dmi libmylib.so # показать сиволы выбранной либы

p=e # энтропия не в режиме дебага

/R [expr] # search for ROP gadgets #
/r sym.imp.printf # find references to this address #
/m # search for magic headers #
Yara # identify crypto algorithms #
/a [asm] # assemble code and search bytes #
/A [type] # find instructions of this type #
/c [code] # find strstr matching instructions #
/v4 1234 # search for this number in memory #
pxa # disasm all possible instructions #
# https://monosource.gitbooks.io/radare2-explorations/content/tut3/tut3_-_esil.html
e asm.emustr=true pD $SS @ $S~Hello #
e asm.emu=true

e??dbg # 

Ps projectName # сохранить проект

shift+( # вызвать снег

m[k] # устанавлиаем метку жмем m + любая клавина затем 'k чтобы перейти к этой метке. Символ ' <- одинарная кавычка

dts+ # запись трассировки
dsb # сделаь шаг назад

drx 0 0x080480b5 1 x # hardware brakpoint на исполнение

# ассемблерный diff
radiff2 -D main main_old

# дизассемблировать в перменную
$dis='af;pdf'

# показать какие функция различаются
radiff2 -AC main main_old

# call stack
pxr @ rsp

pxa @ rsp # to show annotated hexdump
pxw @ rsp # to show hexadecimal words dump (32bit)
pxq @ rsp # to show hexadecimal quad-words dump (64bit)
ad@r:SP   # to analyze the stack data

# поиск хексов в бинарных файлах
# -c = count
grep -Pcr "\x0f\x84\x5d\x01\x00\x00" 

# трассировка trace
#https://r2wiki.readthedocs.io/en/latest/options/e/values-that-e-can-modify/dbg/
e asm.trace=true
e dbg.trace=true
e asm.tracespace=true
# трассировка call , ret
# https://r2wiki.readthedocs.io/en/latest/options/d/dt/dtc/

# get physical addres; virtual, физический адрес, виртуальный адресс
# https://monosource.gitbooks.io/radare2-explorations/content/intro/basics.html
?p addr

# print opcode
pi~mov eax
pd~mov eax
