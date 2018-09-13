# переключение видеокарт
prime-select query
sudo prime-select nvidia
sudo prime-select intel
# чтобы профилировать на одном gpu при возникновении ошибки:
#fatal:  All CUDA devices are used for display and cannot be used while debugging. (error code = CUDBG_ERROR_ALL_DEVICES_WATCHDOGGED(0x18)
set cuda software_preemption on
# чтобы можно было отлаживать нужно сделать в CMakeLists.txt. Возможно -keep не обязателен
set(CUDA_NVCC_FLAGS ${CUDA_NVCC_FLAGS}; --device-debug; -keep)

