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
g+] # позволяет выбрать на какое определение перейти

sudo apt install exuberant-ctags
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ .
