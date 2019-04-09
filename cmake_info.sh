# компилим с использованием всех возможностей нашей системы, но вероятно мы потеряем совместимость с другими процессорами.
# но при этом может сильно вырасти производительность
set_target_properties(project PROPERTIES COMPILE_FLAGS "-O3 -march=native")

# чтобы сделать verbose output при компиляции. 
set_target_properties(project PROPERTIES COMPILE_FLAGS "-save-temps")

# чтобы cuda можно было отлаживать и хранить промежуточный результат компиляуии
set(CUDA_NVCC_FLAGS ${CUDA_NVCC_FLAGS}; --device-debug; -keep)

cmake .. -DCMAKE_VERBOSE_MAKEFILE=ON

cmake .. -DCMAKE_BUILD_TYPE=Release
cmake .. -DCMAKE_BUILD_TYPE=Debug
cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo
cmake .. -DCMAKE_BUILD_TYPE=MinSizeRel

# curses-интерфейс
# Посмотреть с какими опция можно собрать проект
ccmake .

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pg")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pg")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -pg")

# GCC Profile-guided optimization
--fprofile-generate
--fprofile-use

# скомпилить только один таргет
cmake --build . --target main

# multi line comments
#[==[
#]==]

# для проведения статического анализа
# sudo apt install clang-tools-6.0
/usr/bin/scan-build-6.0 cmake -DCMAKE_CXX_STANDARD=14 -DCMAKE_CXX_COMPILER=clang++-6.0 .
/usr/bin/scan-build-6.0 ninja

# cross compile from linux to Windows x64n
set(CMAKE_C_COMPILER "/usr/bin/x86_64-w64-mingw32-gcc")
set(CMAKE_CXX_COMPILER "/usr/bin/x86_64-w64-mingw32-g++")
