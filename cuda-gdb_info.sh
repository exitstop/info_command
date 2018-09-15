# переключение видеокарт
prime-select query
sudo prime-select nvidia
sudo prime-select intel
# чтобы профилировать на одном gpu при возникновении ошибки:
#fatal:  All CUDA devices are used for display and cannot be used while debugging. (error code = CUDBG_ERROR_ALL_DEVICES_WATCHDOGGED(0x18)
set cuda software_preemption on
# чтобы можно было отлаживать нужно сделать в CMakeLists.txt. Возможно -keep не обязателен
# опции для nvcc https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html#options-for-altering-compiler-linker-behavior
set(CUDA_NVCC_FLAGS ${CUDA_NVCC_FLAGS}; --device-debug; -keep)

# иструкция для cuda-gdb http://developer.download.nvidia.com/GTC/PDF/1062_Satoor.pdf
# http://www.cs.cmu.edu/afs/cs/academic/class/15668-s11/www/cuda-doc/cuda-gdb.pdf
info cuda +<tab> # выдает подсказку
info cuda devices
info cuda kernels
info cuda threads kernel 2
set cuda memcheck on
where
CUDA_VISIBLE_DEVICES=0,1
