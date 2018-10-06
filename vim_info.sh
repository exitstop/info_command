help youcompleteme
ctrl-w z # close window scratch

ctrl+v # Блочное выделение + клавиши o или Shift+o можно менять углы перемещения
ctrl+V # построчное выделение

gv # если вы хотите снова выделить то что уже выдяляли раньше

# folding - складка строчек :help folding
# входим в режим выделения V, выделяем строки которые хотим свернуть и жмем 
zf # чтобы свернуть
h или l # чтобы развернуть нужно навести на вкладку
zR # развернуть все
zM # свернуть все
zm
zr

# vim tags https://github.com/szw/vim-tags
:TagsGenerate! # генерим таги и после этого можно ctrl+] -> прыгнуть на определение функции ctrl+[ -> декларация функции
:TagsGenerate
:tags
ctrl+] # перейти ко определению функции 
ctrl+[ # забиндино мной вручную под команду YcmCompleter GoToDefinition
ctrl+t # вернутся обратно
g+] # позволяет выбрать на какое определение перейти
Ctrl-w   # стрелочки :) — переместиться на окно влево/вправо/вверх/вниз
Сtrl-w o # развернуть окно
Ctrl-w c # закрыть
Ctrl-w s # разделить окно по горизонтали
Ctrl-w v # тоже, только по вертикали
Ctrl-w ] # разделить и перейти на определение чего-то, что под курсором
Ctrl-w f # разделить и в новом окне открыть файл путь к которому находится под курсором, очень 
]p # вставка с отступами
!sort # в визуальном режиме
:bn # следующий буфер
:bp # предыдущий
:ls # просмотреть открытые буферы
:b # имя_буфера переключиться на буфер, очень удобно комбинируется с табом, к примеру пишем :b domain, жмём таб и нам подставляется открытый iis_domain.cpp
:bd # удалить текущий буфер, правда стоит заметить, что если этот буфер единственное окно то vim закроется
:bd # имя_буфера удалить буфер по имени

sudo apt install exuberant-ctags
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ .

# двикатся по буферам которые находятся в air-line
:bnext
:bprevious
:bfirst
:blast
:b10
:b <buffer-name>

# в режиме вставки
ctrl+r=5+5+5 # вставится число 15

# cscope https://habr.com/post/54470/ 
sudo apt install cscope
#find ./ -type f \( -iname \*.cpp -o -iname \*.hpp -o -iname \*.h -o -iname \*.cl -o -iname \*.c \)
find /home/user/project -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.hpp' -o -name '*.cl' -o -name '*.asm' -o -name '*.s' > ./cscope.files
cscope -b
rm ./cscope.files
:cs add cscope.out

# делаем скрипт исполняемым если он начинается на #!
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x | endif | endif

# перемещение по вкладкам
nmap <Left> gT
nmap <Right> gt

# code_complete.vim 
# скачиваем в папку ~/,vim/plugin и с помошью таба дополняем C/C++
# https://www.vim.org/scripts/script.php?script_id=1764

ctrl+e # переместить страницу на 1 вниз
ctrl+y # переместить страницу на 1 вверх 

set syntax=cpp

# замена только в выделенном тексте
:'<,'>s/red/green/g

# цвет заливки выделения которое видно после перехода в режим выделения
highlight Visual cterm=bold ctermbg=Blue ctermfg=NONE
