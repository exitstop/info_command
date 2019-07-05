c++filt _ZN5Abase3getEv # convert to -> Abase::get()

#profile c++
# build the program (no special flags are needed)
g++ -std=c++11 cpuload.cpp -o cpuload
# run the program with callgrind; generates a file callgrind.out.12345 that can be viewed with kcachegrind
valgrind --tool=callgrind ./cpuload
valgrind --dump-instr=yes --collect-jumps=yes --tool=callgrind ./cpuload
# open profile.callgrind with kcachegrind
kcachegrind profile.callgrind

# кэш кеш cache
valgrind --tool=cachegrind ./prog

# Профейлер intell Linux and Windows Intel® VTune™ Amplifier

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

# Выровнять структуру под 64byte
struct alignas(64) At {
    char a;
    int i;
}

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

# алгоритмы и всякое
http://rosettacode.org/wiki/Rosetta_Code
https://github.com/tayllan/awesome-algorithms

# определить откуда была взывана функция gcc
# https://www.ibm.com/developerworks/ru/library/l-gcc-hacks/index.html
int addr = __builtin_return_address(0); # получим текущее значение из вершины стека

# define __inline__     __inline__      __attribute__((always_inline))
# define __deprecated           __attribute__((deprecated))
# define __attribute_used__     __attribute__((__used__))
# define __attribute_const__     __attribute__((__const__))
# define __must_check            __attribute__((warn_unused_result))

# оптимизация ветвлений в ручную gcc
# https://www.youtube.com/watch?v=nXaxk27zwlk  # CppCon 2015: Chandler Carruth "Tuning C++: Benchmarks, and CPUs, and Compilers! Oh My!"
#define likely(x)   __builtin_expect(!!(x), 1)
#define unlikely(x) __builtin_expect(!!(x), 0)

# Предварительная выборка кэша
void __builtin_prefetch( const void *addr, int rw, int locality );
#define prefetch(x) __builtin_prefetch(x)

# Выравнивани gcc
char __nosavedata swsusp_pg_dir[PAGE_SIZE] __attribute__ ((aligned (PAGE_SIZE)));

# perf профилируем
sudo -i
echo -1 >/proc/sys/kernel/perf_event_paranoid
echo 0 > /proc/sys/kernel/kptr_restrict

# Или
sudo sh -c "echo 0 > /proc/sys/kernel/kptr_restrict"
sudo sh -c "echo -1 >/proc/sys/kernel/perf_event_paranoid"

perf record -g ./main
perf report -g "graph,0.5,caller"
# буква 'a' открое ассемблерный код

pref list # показать список дополнительных команд
perf stat -e L1-icache-load-misses ./map_test

# cache hierarchy; иерархия кеша
# https://www.youtube.com/watch?v=ugBE79lcuP8
# Оперативка 100ns 4G-1Tb
# L3         30ns  10-30Mb
# L2         10ns  256kb-1Mb
# L1         3ns   32kb
# CPU        0.5ns
# Узнать сколько кеша на твоей системе
lscpu | grep cache

# размер строки кеш памяти к примеру cpu 64byte; используйте нечетные реквесты
# Никогда не пишите разными тредами в один cache line; Читать можно, писать нельзя

# рекомендумемая литература по cache cpu
# intel architectures optimization reference manual
quick-bench.com
godbolt.org


# Модель памяти С++ https://www.youtube.com/watch?v=SIZmLPtcZiE
# Не пропускающие барьеры 
std::atomic_thread_fence(std::memory_order_acquire);
std::atomic_thread_fence(std::memory_order_release);

# гунерация гарфика вызовов
https://github.com/namhyung/uftrace

#Конвертировать русский текст полученный из golang
#include <locale>  
#include <codecvt> 

std::wstring utf8_to_utf16(std::string utf8_string)
{
    return std::wstring_convert<std::codecvt_utf8_utf16<wchar_t>, wchar_t>{}.from_bytes(utf8_string);
}

const size_t SIZE_STRING = strlen(strChar);
string u8(strChar, strChar + SIZE_STRING);
wstring wstr = utf8_to_utf16(u8);
