#компилировать библиотеку для линковки с С/C++
go build -o lib.so -buildmode=c-archive lib.go
#скомпилировать либу для Visual studio
cd C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\amd64
lib.exe /def:lib.def /OUT:lib.lib /MACHINE:x64

[lib.def]
EXPORTS
MyFunction

