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

# go 1.12
# https://gophp.io/how-to-install-go-1-12-on-ubuntu-18/

---
golang уже предварительно установлен на машине. Для примера возьмем go version 1.13.3 но можно взять другую

Установить gwm
Инструкция взята отсюда https://github.com/moovweb/gvm

source ~/.gvm/scripts/gvm
source /home/user/.gvm/scripts/gvm
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
Соберем toolchain для crosscompile
cd $(go env GOROOT)/src
export CC="gcc -Wimplicit-fallthrough=0 -Wno-error=shift-negative-value -Wno-shift-negative-value" && CGO_ENABLED=0 gvm install go1.13.4
gvm list
gvm use go1.13.4
sudo GOROOT_BOOTSTRAP=/home/user/.gvm/gos/go1.13.4 GOOS=linux GOARCH=arm CGO_ENABLED=0 ./make.bash --no-clean
Команда для компиляции
GOOS=linux GOARCH=arm go build check_port.go
Добавить сервис:

cp my_ssh_remote.service /etc/systemd/system/my_ssh_remote.service
sudo systemctl daemon-reload
sudo systemctl enable my_ssh_remote
sudo systemctl start my_ssh_remote
Подключится к ubuntu aws
ssh -i id_rsa ubuntu@$host

https://insomnia.rest/

# gdb for golang https://github.com/derekparker/delve


# bug arm
type Payload struct
`/home/user/go/pkg/mod/github.com/googollee/go-engine.io@v1.4.3-0.20200220091802-9b2ab104b298/payload/payload.go`
https://github.com/googollee/go-socket.io/issues/236
https://github.com/googollee/go-engine.io/pull/86/commits/3d906e43a03fd355d6f60c6ce103acf7cafd0159#diff-fff052930dc3dc5b0639def327826223

# logrotate logrus
https://github.com/natefinch/lumberjack

# live download updater terminal
https://github.com/gosuri/uilive

# скрывать окна golang
https://github.com/inconshreveable/go-update/blob/master/hide_windows.go

# go update
https://github.com/inconshreveable/go-update/blob/master/doc.go
# go update from github
github.com/rhysd/go-github-selfupdate/selfupdate

# Установка lint
https://golangci-lint.run/usage/install/
golangci-lint --version
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.27.
# golang lint chech error
https://www.youtube.com/watch?v=VlnxsfSs1ms
go get -u github.com/golangci/golangci-lint
https://golangci-lint.run/
golangci-lint run --fix
golangci-lint run --fix --enable-all
golangci-lint run --fix --enable-all  -new

# change const in golang from build -ldflags
go build -ldflags='-X main.version="$TAG"' -o hello-updater src/hello-updater/main.go

# profile go https://www.youtube.com/watch?v=a8oEETIRpCk
import _ "net/http/pprof"
go tool pprof -seconds 5 http://server/debug/pprof/profile

# уменьшить размер бинарника upx
upx new last
bincmp -no-symtab old new

# sudo: furious: command not found
sudo env "PATH=$PATH" furious

# gogrep
# https://github.com/mvdan/gogrep
 # gogrep -r -x 'if $x != nil { $*_ }' cmd/apiserver/main.go
 find -name '*.go' -exec gogrep -x 'if $x != nil { $*_ }' {} \;
gogrep -x '$b.($x)' ./...
gogrep -x 'if $x := $_.Create($_).Error; $x != nil { $*_ }' ./...

go test -cpuprofile=cpu.out
go tool pprof cpu.out
>>> web

https://flaviocopes.com/golang-profiling/

# go auto test https://github.com/cweill/gotests
go get -u github.com/cweill/gotests/...

# gui golang gio https://gioui.org/

# memory leak
https://unix.stackexchange.com/questions/36450/how-can-i-find-a-memory-leak-of-a-running-process

# memory leak prifle
```go
import(
	"net/http"
	_ "net/http/pprof"
)

func main() {
	go func() {
        runtime.LockOSThread()
		log.Fatal(http.ListenAndServe(":8080", nil))
	}()
}
```
```bash
curl http://localhost:8080/debug/pprof/heap > heap.0.pprof
go tool pprof heap.0.pprof
HEAP=heap.7.pprof && curl http://localhost:8080/debug/pprof/heap > $HEAP && go tool pprof -nodefraction=0 -inuse_objects $HEAP

go tool pprof -nodefraction=0 -inuse_objects http://localhost:8080/debug/pprof/heap 
nodefraction=0

web
list Track
top20

sudo apt-get install bpfcc-tools
sudo memleak-bpfcc -p 25635

go build -gcflags=-m main.go

wget -O trace.out http://localhost:8080/debug/pprof/trace
go tool trace trace.out
```

```go

import "github.com/pkg/profile" // v1.5.0

func main() {
	defer profile.Start(profile.MemProfileRate(2048), profile.ProfilePath("./profiling"), profile.NoShutdownHook).Stop()
}
```

# go robot https://gobot.io/

# https://habr.com/ru/post/337098/
Создатель Node.js: «Для серверов я не могу представить другой язык кроме Go»

# вывести структуру go красиво в консоль
spew.Dump(outRes)

go build -o main main.go && LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libtcmalloc.so.4 HEAPCHECK=normal HEAPPROFILE=gpt-heapprofile.log ./main
https://dashboard.stackimpact.com/#/hotspots/memory
https://www.instana.com/docs/profiling/

# 50 подводных камней
http://devs.cloudimmunity.com/gotchas-and-common-mistakes-in-go-golang/?ref=hackernoon.com

# stack trace info
https://www.ardanlabs.com/blog/2015/01/stack-traces-in-go.html

#
go tool pprof "http://localhost:8081/debug/pprof/profile?seconds=10"
