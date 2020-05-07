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

:'<,'>s/red/green/g # замена только в выделенном тексте
:%s/^#.*// # удалить все строки начинающиеся с #
:%s/\n/\r/g # заменить сиомвол переноса строки на символ переноса строкий

# цвет заливки выделения которое видно после перехода в режим выделения
highlight Visual cterm=bold ctermbg=Blue ctermfg=NONE

# Иструкция где скачать словари http://ashep.org/2010/proverka-pravopisaniya-v-vim/#.W8jyF-EzZFQ
:set spell spelllang=ru # включить проверкy орфографии
# При помощи следующих команд Vim вы можете быстро перемещаться по словам, написанным с ошибками:
]s — # перемещает курсор на следующее слово с ошибкой;
[s - # перемещает курсор на предыдущее слово с ошибкой;
]S — # то же, что и ]s, только курсор не будет останавливаться на словах, которые считаются неправильным для определённого региона выбранного языка;
[S - # то же, что и ]S, но в обратном направлении.
# Для добавления ошибочно написанных слов в ваш собственный список слов можно использовать следующие команды:

zg — # добавляет слово, находящееся под курсором в spellfile;
zG — # то же, что и zg, однако слово будет добавлено в internal-wordlist;
zw — # то же, что и zg, однако слово будет помечено как ошибочно-написанное;
zW — # то же, что и zw, только слово будет добавлено в internal-wordlist;
# Чтобы отменить действие добавления слова, используйте команды:

zug и zuw # — отменяет действие zg и zw соответственно;
zuG и zuW # — отменяет действие zG и zW соответственно;

# изменить цветовую схему
:colorscheme [space] [ctrl+di]
:colorscheme [space] [tab]

# написать наглядный макрос
# сначало выделяем строки которые хотим изменить с помошью кномки v или V
# затем жмет двоеточие :
# и пишем макрос
:'<,'>norm I<a href="
:'<,'>norm A"></a>

# в режиме вставки
Ctrl-R + # вставить из буфера обмена
'Ctrl-R "' # вставить из буфера обмена
Ctrl-R * # вставить Удаленное 

# Копируем в буфер обмена дважды
Ctrl-R 1 # вставить последнее копирование
Ctrl-R 2 # вставить второе копирование

# help по Ctrl-R
:h i_ctrl-r

# узнать путь и имя файла
ctrl+g

# CCTree plugin info
CCTreeLoadDB cscope.out # загружаем базу данных cscope.out
CCTreeTraceForward main # трассируем функуию мейн

# установить символы space вместо тубуляции
set tabstop=2       # The width of a TAB is set to 4.
set shiftwidth=2    # Indents will have a width of 4
set softtabstop=2   # Sets the number of columns for a TAB
set expandtab       # Expand TABs to spaces

# открывать файл с расширением как cpp c++
autocmd BufRead, BufNewFile *.cl set filetype=cpp

set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab

# plugin
nerdtree
nerdcommenter
vim-surround
vim-easymotion
gundo.vim # Undo redo like a boss
ultisnips
vimwiki
bufexplorer
vim-glsl # подсветка для openCL
complcache
ctrlp.vim
vim-easy-align

# vim realod
source ~/.vimrc

#for format html
!tidy -mi -html -wrap 0 %

# copy to rigister a or b
"ay
"by
# past from register a or b
"ap
"bp

# vim delete spaces at end of line
```bash
%s/\s\+$//e
```
