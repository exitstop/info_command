#### error

- Ошибка:

```bash
/home/kk/opencv-3.4.1/modules/python/src2/cv2.cpp:22:10: fatal error: pyopencv_generated_include.h: No such file or directory
 #include "pyopencv_generated_include.h"
 ```
- Решение:

 ```bash
python ./modules/python/src2/gen2.py ./build/modules/python_bindings_generator ./build/modules/python_bindings_generator/headers.txt
cd build
sudo make install
 ```
