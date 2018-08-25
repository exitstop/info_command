c++filt _ZN5Abase3getEv # convert to -> Abase::get()

#profile c++
# build the program (no special flags are needed)
g++ -std=c++11 cpuload.cpp -o cpuload
# run the program with callgrind; generates a file callgrind.out.12345 that can be viewed with kcachegrind
valgrind --tool=callgrind ./cpuload
# open profile.callgrind with kcachegrind
kcachegrind profile.callgrind
