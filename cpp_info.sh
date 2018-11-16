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

{
#!/bin/bash

CSCOPE_DIR="$PWD/cscope"

if [ ! -d "$CSCOPE_DIR" ]; then
  mkdir "$CSCOPE_DIR"
fi

echo "Finding files ..."
find "$PWD" -name '*.[ch]' \
  -o -name '*.cpp' \
  -o -name '*.cc' \
  -o -name '*.hpp' > "$CSCOPE_DIR/cscope.files"

echo "Adding files to cscope db: $PWD/cscope.db ..."
cscope -b -i "$CSCOPE_DIR/cscope.files"

export CSCOPE_DB="$PWD/cscope.out"
echo "Exported CSCOPE_DB to: '$CSCOPE_DB'"
}
