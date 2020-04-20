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

