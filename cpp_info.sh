c++filt _ZN5Abase3getEv # convert to -> Abase::get()

#profile c++
# build the program (no special flags are needed)
g++ -std=c++11 cpuload.cpp -o cpuload
# run the program with callgrind; generates a file callgrind.out.12345 that can be viewed with kcachegrind
valgrind --tool=callgrind ./cpuload
# open profile.callgrind with kcachegrind
kcachegrind profile.callgrind

# разбор argc
man 3
#inlucde <getopt.h>
int getopt_long
int getopt_long_only

# ставим выравнивае 1 байт, вы потом восстанавлием настроку обязательно
#pragma pack(push,1)
stuct MyBitStruct
{
    uint16_t a:4;
    uint16_t b:4;
    uint16_t c;
};
#pragma pack(pop)

gcc -E main.cpp -o main_def.cpp # выполнить препроцессор

# узнать путь до самого себя под линуксом
ll /proc/self/exe

# генерация графа вызова gen call graph
https://github.com/onlyuser/gen-callgraph

#http://tldp.org/HOWTO/Program-Library-HOWTO/miscellaneous.html
# сработает при игициализации библиотеки
void __attribute__ ((constructor)) my_init(void);
# сработает при отключении библиотеки
void __attribute__ ((destructor)) my_fini(void);

# на старых системах
void _init(void);
void _fini(void);

# источник https://proglib.io/p/cpp-tricks/
# https://en.wikibooks.org/wiki/C%2B%2B_Programming/Templates/Template_Meta-Programming
# макрос для быстрого сброса контейнера
gcc -std=gnu++14 main.cpp -o main
#include <iostream>
#include <iterator>
#include <typeinfo>
#define DBG(v) copy((v).begin(), (v).end(), ostream_iterator<typeof(*(v).begin())>(cout, " "))

# замер времени выполнения участка кода
#include <chrono>
auto start = chrono:high_resolution_clock::now();
auto end = chrono:high_resolution_clock::now();
chrono::duration<double> duration = end - start;

# или так
double getMonotonicTime()
{
    using namespace std::chrono;

    steady_clock::time_point currTime = steady_clock::now();
    steady_clock::duration dur = currTime.time_since_epoch();

    double ticksPerSecond = static_cast<double>(system_clock::period::num) / steady_clock::period::den;

    return ticksPerSecond * dur.count();
}


# аналог defer в golang
# 1
std::unique_ptr<std::ofstream,
                std::function<void(std::ofstream*)>> 
        fp(new std::ofstream("demo.txt"), [](std::ofstream * fs) {
         fp->close();
        } );
# 2
void close_file(std::ofstream *fp) { fp->close(); }
std::unique_ptr<std::ofstream, decltype(&close_file)> fp(new std::ofstream("demo.txt"), &close_file);
