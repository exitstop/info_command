# компилим с использованием всех возможностей нашей системы, но вероятно мы потеряем совместимость с другими процессорами.
# но при этом может сильно вырасти производительность
set_target_properties(project PROPERTIES COMPILE_FLAGS "-O3 -march=native")

# чтобы сделать verbose output при компиляции. 
set_target_properties(project PROPERTIES COMPILE_FLAGS "-save-temps")

# чтобы cuda можно было отлаживать и хранить промежуточный результат компиляуии
set(CUDA_NVCC_FLAGS ${CUDA_NVCC_FLAGS}; --device-debug; -keep)

