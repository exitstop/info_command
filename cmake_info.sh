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

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pg")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pg")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -pg")

# GCC Profile-guided optimization
--fprofile-generate
--fprofile-use
