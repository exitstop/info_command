# переключение видеокарт
prime-select query
sudo prime-select nvidia
sudo prime-select intel
# oveclocking active
sudo nvidia-xconfig -a --cool-bits=28
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
set CUDA_VISIBLE_DEVICES=-1

`kernel <\<<40, 32>>> # gridDim.x = 40 blockDim.x = 32  ( blockIdx.x = "текущий блок" threadIdx.x =  "текущий тред" )`

# табличка соответствия драйверов и версии CUDA
# https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html

# https://docs.nvidia.com/deploy/driver-persistence/
nvidia-smi -i 0 -q | grep -i "Persistence Mode"
sudo nvidia-smi -i 0 -pm ENABLED
sudo nvidia-smi -i 0 -pm DISABLED

nvidia-persistenced --user user

# автоматически поставить точку останова на вызов cuda ядра
set cuda break_on_launch

# Посмотреть gpu
sudo lshw -C display

# nvvp не запускается

- error

```bash
!ENTRY com.nvidia.cuda.ide.editor 4 0 2021-01-20 02:57:49.713
!MESSAGE FrameworkEvent ERROR
!STACK 0
org.osgi.framework.BundleException: Could not resolve module: com.nvidia.cuda.ide.editor [6]
  Unresolved requirement: Require-Bundle: org.eclipse.cdt.ui; bundle-version="[5.8.0.nvidia,5.8.1)"
    -> Bundle-SymbolicName: org.eclipse.cdt.ui; bundle-version="5.8.0.nvidia-qualifier"; singleton:="true"
       org.eclipse.cdt.ui [71]
         Unresolved requirement: Require-Bundle: org.eclipse.cdt.core; bundle-version="[5.2.0,6.0.0)"
           -> Bundle-SymbolicName: org.eclipse.cdt.core; bundle-version="5.7.0.nvidia-qualifier"; singleton:="true"
              org.eclipse.cdt.core [69]
                Unresolved requirement: Require-Capability: osgi.ee; filter:="(&(osgi.ee=JavaSE)(version=1.7))"

	at org.eclipse.osgi.container.Module.start(Module.java:434)
	at org.eclipse.osgi.container.ModuleContainer$ContainerStartLevel.incStartLevel(ModuleContainer.java:1582)
	at org.eclipse.osgi.container.ModuleContainer$ContainerStartLevel.incStartLevel(ModuleContainer.java:1561)
	at org.eclipse.osgi.container.ModuleContainer$ContainerStartLevel.doContainerStartLevel(ModuleContainer.java:1533)
	at org.eclipse.osgi.container.ModuleContainer$ContainerStartLevel.dispatchEvent(ModuleContainer.java:1476)
	at org.eclipse.osgi.container.ModuleContainer$ContainerStartLevel.dispatchEvent(ModuleContainer.java:1)
	at org.eclipse.osgi.framework.eventmgr.EventManager.dispatchEvent(EventManager.java:230)
	at org.eclipse.osgi.framework.eventmgr.EventManager$EventThread.run(EventManager.java:340)
```

```
sudo apt-get install libcanberra-gtk-module
```
