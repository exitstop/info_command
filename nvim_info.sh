# neovim nvim cpp ide config
https://github.com/optimizacija/neovim-config

# clang 8
https://solarianprogrammer.com/2017/12/13/linux-wsl-install-clang-libcpp-compile-cpp-17-programs/

# добавить в CMake для ycm youcompleteme появится файл .clang_complete
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

# рефакторинг :args :argsdo
# Найти все файлы в которых слово profile не находится на одной строке с github
args `ack -l '^(?!.*github).(\bprofile\b)'`
# Посмотреть какие файлы находятся в args
args
# Заменить во всех файлах находящихся в args
argdo %s/\%(github.*\)\@<!\<profile\>\>/profile0000/g
# Сохранить все изменения в файлах args
argdo update
