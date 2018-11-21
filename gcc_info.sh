gcc -O3 -masm=intel main.cpp -S # компиляция получить asm листинг, с диалектом intel
gcc -S -masm=intel -O2 libAsm.cpp -I. # превратить *.cpp в Asm листинг -I. нужен чтобы подключить текующую деррикторию  

# ld чтобы библиотека нашлась в текущем каталоге
export LD_LIBRARY_PATH=.
export LD_PRELOAD=. # или это

# соглашение об именах
extern "C" void hello(const int a);

gcc -march=native -mtune=native -Q --help=target
