# каталог библиотек для golang
https://github.com/avelino/awesome-go#audio-and-music

#компилировать библиотеку для линковки с С/C++
go build -o lib.so -buildmode=c-archive lib.go
#скомпилировать либу для Visual studio
cd C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\amd64
lib.exe /def:lib.def /OUT:lib.lib /MACHINE:x64

[lib.def]
EXPORTS
MyFunction

# cross compile ubuntu for windows
CC=i686-w64-mingw32-gcc GOOS=windows GOARCH=386 CGO_ENABLED=1 go build -o golib.lib -buildmode=c-shared golib.go

switch item {
    case 1:
        fallthrough // Позволяет провалиться в следующий case
    case 2:
        ...
    default:
        ...
}

dep init
# применить все зависимости
dep ensure
# обновить одну зависимость
dep ensure -update github.com/user/project
# обвноть все зависимости
dep ensure -update
# фик go dep
# Удаляем закешированый репозиторий
rm -rf $GOPATH/pkg/dep/sources/https---github.com-mediocregopher-radix


# Передать русский текст в C++
cStr = C.CString("Привет")
ret, _, _ = Speak.Call(uintptr(unsafe.Pointer(cStr)))
C.free(unsafe.Pointer(cStr))

# golang arm compile
# Установить из бинарника
#gvm install go1.13.3 -B
cd $(go env GOROOT)/src
export CC="gcc -Wimplicit-fallthrough=0 -Wno-error=shift-negative-value -Wno-shift-negative-value" && CGO_ENABLED=0 gvm install go1.13.3
gvm list
gvm use go1.13.3
sudo GOROOT_BOOTSTRAP=/home/user/.gvm/gos/go1.13.3 GOOS=linux GOARCH=arm CGO_ENABLED=0 ./make.bash --no-clean

# Компиляци приложения приложение под arm
GOOS=linux GOARCH=arm go build check_port.go

go mod init
go mod edit -replace github.com/exitstop/helloworld=../helloworld
