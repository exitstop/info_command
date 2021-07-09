# neovim nvim cpp ide config
https://github.com/optimizacija/neovim-config

# clang 8
https://solarianprogrammer.com/2017/12/13/linux-wsl-install-clang-libcpp-compile-cpp-17-programs/

# добавить в CMake для ycm youcompleteme появится файл .clang_complete
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

# рефакторинг :args :argsdo
# Найти все файлы в которых слово profile не находится на одной строке с github
args `ack -l '^(?!.*github).(\bprofile\b)' *`
# Посмотреть какие файлы находятся в args
args
# Заменить во всех файлах находящихся в args
# argdo %s/\%(github.*\)\@<!\<profile\>\>/profile0000/g

# Сохранить все изменения в файлах args
argdo update

sudo apt clean
sudo apt update
sudo apt purge cuda
sudo apt purge nvidia-*
sudo apt autoremove

sudo apt-get --purge remove "*cublas*" "cuda*" "nvidia-cuda*"
sudo apt-get --purge remove "*nvidia*"

# работа с git
https://github.com/airblade/vim-gitgutter
#stage the hunk with 
<Leader>hs or
#undo it with 
<Leader>hu.

# python3 Autocomplete
#https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/
sudo -H pip3 install pynvim jedi
Plug 'zchee/deoplete-jedi'

# Neovim config for frontend development
# https://www.bha.ee/neovim-config-for-frontend-development/

# Прыгать по коду python
#<leader>d: go to definition
#K: check documentation of class or method
#<leader>n: show the usage of a name in current file
#<leader>r: rename a name


# рефакторинг
# https://jdhao.github.io/2020/03/14/nvim_search_replace_multiple_file/

# ищем
:vimgrep /Neovim/gj **/*
# потом открываем
:copen
:cn -- Go to the next location in the list
:cp -- Go to the previous location
:ccl -- Close the quickfix window

# меняем grep на ripgrep
#set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
#set grepformat=%f:%l:%c:%m

# Ищем
grep Neovim
# Меняем
cfdo %s/Neovim/Nvim/ge | update

# :Git vim-fugitive
# g? help
- # stage unstage this fiel
X # Отменить изменения в этом файле
= # Открыть diff файла под курсором
I # добавлять в stage изменения построчно

# http://vimcasts.org/episodes/fugitive-vim-exploring-the-history-of-a-git-repository/
# Загрузить все фиксации в quickfix list
Glog -- %
[q	:cprev	jump to previous quickfix item
]q	:cnext	jump to next quickfix item
[Q	:cfirst	jump to first quickfix item
]Q	:clast	jump to last quickfix item

# http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/

# складывание вкладок http://vimcasts.org/episodes/how-to-fold/

# скопировать строку быстрее http://vimcasts.org/episodes/long-range-line-duplication/
-7t. # (отслюда)t(скопировать сюда в текущую строку)

# как пользоваться Gdiff http://vimcasts.org/episodes/fugitive-vim-working-with-the-git-index/
:Gdiff
:diffget
# :Gwrite
# :Gread
# :diffupdate

# history branch g+ g- undo redo (F5 GundoToggle)

# Таблицы выравнивание
# '<,'>Tabularize /|
# '<,'>Tabularize /=

# Перемещение по изменениям http://vimcasts.org/episodes/using-the-changelist-and-jumplist/
g;
g,
:changes
ctrl-O
ctrl-I
:jumps

# vim documentation jumps
ctrl-]

# вставить vim :0put +
:0put +

# самые качественные
asus strix quiet 3090

# syslog set filetype=messages
set filetype=messages

# golangci-lint-langserver nvim
https://github.com/nametake/golangci-lint-langserver
:CocConfig

```
{
  "languageserver": {
    "golangci-lint-languageserver": {
      "command": "golangci-lint-langserver",
      "filetypes": ["go"],
      "initializationOptions": {
        "command": ["golangci-lint", "run", "--out-format", "json"]
      }
    }
  }
}
```
