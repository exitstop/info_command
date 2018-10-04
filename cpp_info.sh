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
