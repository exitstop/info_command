# CUDA hello world

- https://developer.nvidia.com/blog/easy-introduction-cuda-c-and-c/?ncid=afm-chs-44270&ranMID=44270&ranEAID=a1LgFw09t88&ranSiteID=a1LgFw09t88-41apaPgITmNiA5SCk4UzEA

# memory

- https://docs.nvidia.com/cuda/cuda-c-best-practices-guide/index.html#memory-optimizations
- Pinned Memory cudaHostAlloc https://docs.nvidia.com/cuda/cuda-c-best-practices-guide/index.html#pinned-memory
- https://developer.nvidia.com/blog/how-optimize-data-transfers-cuda-cc/?ncid=afm-chs-44270&ranMID=44270&ranEAID=a1LgFw09t88&ranSiteID=a1LgFw09t88-2N5oVPo_t0OkB1P3JLS9jg

# Блоки треды

- https://stackoverflow.com/questions/9985912/how-do-i-choose-grid-and-block-dimensions-for-cuda-kernels

# Блоки

- https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#programming-model

Сетка(Блоки (Потоки))

- global, транзакции 32-, 64-, or 128-byte (32 потока могут параллельно писать по 4-байт = 128-byte)
- local,
- shared, 100x lower than global memory latency.
- constant, or texture memory

- http://developer.download.nvidia.com/GTC/PDF/1083_Wang.pdhttp://developer.download.nvidia.com/GTC/PDF/1083_Wang.pdff
- https://docs.nvidia.com/cuda/cuda-c-best-practices-guide/graphics/memory-spaces-on-cuda-device.png
#### Basic arithmetic 6 cycles
#### Register
- Spills to local memory
#### Caches
- Shared memory 10 cycle(if not conflict)
- local memory (это таже самая глобальная память)
- L1 cache
- L2 cache
- Constant cache ()
- Texture cache
#### Global memory - 400-800 cycles
- Нужно объединять доступ по 128byte в одну транзакцию для максимальной эффективности

# Конфликты банков

- Наглядно, вдухмерной проекции https://on-demand.gputechconf.com/gtc/2018/presentation/s81006-volta-architecture-and-performance-optimization.pdf
- https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#global-memory-5-x
- https://stackoverflow.com/questions/3841877/what-is-a-bank-conflict-doing-cuda-opencl-programming
- https://www.youtube.com/watch?v=qOCUQoF_-MM

# pycuda nvprof профилирование

##### test.py
```bash
import pycuda.gpuarray as gpuarray
import pycuda.driver as cuda
import pycuda.autoinit
import numpy
import pycuda.driver as drv

drv.start_profiler()
a_gpu = gpuarray.to_gpu(numpy.random.randn(4,4).astype(numpy.float32))
a_doubled = (2*a_gpu).get()
print (a_doubled)
print (a_gpu)
drv.stop_profiler()
```

- sudo nvprof python3 test.p
