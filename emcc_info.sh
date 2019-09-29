emcc -O1 fib.cpp -o fib.html -s USE_PTHREADS=1 -fno-rtti -g

#cmake
set(CMAKE_C_COMPILER "emcc")
set(CMAKE_CXX_COMPILER "em++")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -s USE_PTHREADS=1 -s PTHREAD_POOL_SIZE=2")

#compile
emconfigure cmake ..
emmake make VERBOSE=1
#
EMCC_DEBUG=1
cmake --build .

# Чтобы генерился html
set(CMAKE_EXECUTABLE_SUFFIX ".html")
