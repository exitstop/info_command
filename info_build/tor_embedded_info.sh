# https://github.com/cretz/tor-static
# Установить http://www.msys2.org/ x64
# Запустить столько раз сколько понадобится, пока все не обновится, и перезапустить терминал если понадобится
pacman -Syuu

pacman -Sy --needed base-devel mingw-w64-i686-toolchain mingw-w64-x86_64-toolchain \
                    git subversion mercurial \
                    mingw-w64-i686-cmake mingw-w64-x86_64-cmake

pacman -S mingw-w64-x86_64-go

export GOROOT=/mingw64/lib/go
export GOPATH=/mingw64

go get github.com/cretz/tor-static
