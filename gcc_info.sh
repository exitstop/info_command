gcc -O3 -masm=intel main.cpp -S # компиляция получить asm листинг, с диалектом intel
gcc -S -masm=intel -O2 libAsm.cpp -I. # превратить *.cpp в Asm листинг -I. нужен чтобы подключить текующую деррикторию  

# ld чтобы библиотека нашлась в текущем каталоге
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
export LD_PRELOAD=.:$LD_PRELOAD # или это

# соглашение об именах
extern "C" void hello(const int a);

gcc -march=native -mtune=native -Q --help=target


sudo apt-get install gcc-4.5 gcc-4.5-multilib g++-4.5 g++-4.5-multilib

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.4 50
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.4 50
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.5 40
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.5 40

# посмотреть какие gcc есть в системе
sudo update-alternatives --config gcc
sudo update-alternatives --config g++

sudo update-alternatives --remove gcc /usr/bin/gcc-4.5

sudo apt-get install manpages-dev

# man page для C++ 98/11/14/17/20
https://github.com/Aitjcize/cppman
sudo apt-get install cppman

# компялятор для windows tdm-gcc
https://jmeubank.github.io/tdm-gcc/
