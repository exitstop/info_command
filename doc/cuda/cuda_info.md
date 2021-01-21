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


```bash
./deviceQuery Starting...

 CUDA Device Query (Runtime API) version (CUDART static linking)

Detected 1 CUDA Capable device(s)

Device 0: "GeForce RTX 2060 SUPER"
  CUDA Driver Version / Runtime Version          11.2 / 11.2
  CUDA Capability Major/Minor version number:    7.5
  Total amount of global memory:                 7974 MBytes (8361672704 bytes)
  (34) Multiprocessors, ( 64) CUDA Cores/MP:     2176 CUDA Cores
  GPU Max Clock rate:                            1710 MHz (1.71 GHz)
  Memory Clock rate:                             7001 Mhz
  Memory Bus Width:                              256-bit
  L2 Cache Size:                                 4194304 bytes
  Maximum Texture Dimension Size (x,y,z)         1D=(131072), 2D=(131072, 65536), 3D=(16384, 16384, 16384)
  Maximum Layered 1D Texture Size, (num) layers  1D=(32768), 2048 layers
  Maximum Layered 2D Texture Size, (num) layers  2D=(32768, 32768), 2048 layers
  Total amount of constant memory:               65536 bytes
  Total amount of shared memory per block:       49152 bytes
  Total shared memory per multiprocessor:        65536 bytes
  Total number of registers available per block: 65536
  Warp size:                                     32
  Maximum number of threads per multiprocessor:  1024
  Maximum number of threads per block:           1024
  Max dimension size of a thread block (x,y,z): (1024, 1024, 64)
  Max dimension size of a grid size    (x,y,z): (2147483647, 65535, 65535)
  Maximum memory pitch:                          2147483647 bytes
  Texture alignment:                             512 bytes
  Concurrent copy and kernel execution:          Yes with 3 copy engine(s)
  Run time limit on kernels:                     Yes
  Integrated GPU sharing Host Memory:            No
  Support host page-locked memory mapping:       Yes
  Alignment requirement for Surfaces:            Yes
  Device has ECC support:                        Disabled
  Device supports Unified Addressing (UVA):      Yes
  Device supports Managed Memory:                Yes
  Device supports Compute Preemption:            Yes
  Supports Cooperative Kernel Launch:            Yes
  Supports MultiDevice Co-op Kernel Launch:      Yes
  Device PCI Domain ID / Bus ID / location ID:   0 / 9 / 0
  Compute Mode:
     < Default (multiple host threads can use ::cudaSetDevice() with device simultaneously) >

deviceQuery, CUDA Driver = CUDART, CUDA Driver Version = 11.2, CUDA Runtime Version = 11.2, NumDevs = 1
Result = PASS
```


# Ссылки

- https://developer.nvidia.com/blog/optimizing-gpu-performance-tensor-cores/
- https://docs.nvidia.com/deeplearning/performance/index.html#quant-effects
- https://docs.nvidia.com/deeplearning/performance/dl-performance-recurrent/index.html
- https://docs.nvidia.com/deeplearning/performance/dl-performance-convolutional/index.html
- `torch.backends.cudnn.benchmark = True`
- https://docs.nvidia.com/deeplearning/performance/dl-performance-gpu-background/index.html
- nvprof чтобы узнать используете ли вы тензорные ядра
- fp16 масштабирование чтобы не потерять данные https://docs.nvidia.com/deeplearning/performance/mixed-precision-training/index.html

```
As was shown in the previous section, successfully training some networks requires gradient value scaling to keep them from becoming zeros in FP16.
This can be efficiently achieved with a single multiplication by scaling the loss values computed in the forward pass, prior to starting backpropagation.
By the chain rule, backpropagation ensures that all the gradient values are scaled by the same amount.
This requires no extra operations during backpropagation and keeps the relevant gradient values from becoming zeros and losing that gradient information.
```

- https://ngc.nvidia.com/catalog/containers/nvidia:pytorch
- https://developer.nvidia.com/automatic-mixed-precision

```bash
scaler = GradScaler()

with autocast():
    output = model(input)
    loss = loss_fn(output, target)

scaler.scale(loss).backward()

scaler.step(optimizer)

scaler.update()
```
