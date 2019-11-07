How to install OpenCV 3.4.1 with CUDA on Ubuntu distro
https://gist.github.com/raulqf/a3caa97db3f8760af33266a1475d0e5e

#fix cuda error build. Просто добавить к cmake
cmake -DENABLE_PRECOMPILED_HEADERS=OFF ..
# чтобы стало вот так
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_CUDA=ON -D WITH_TBB=ON -D ENABLE_FAST_MATH=1 -D CUDA_FAST_MATH=1 -D WITH_CUBLAS=1 -D WITH_QT=OFF -D BUILD_SHARED_LIBS=OFF -DENABLE_PRECOMPILED_HEADERS=OFF ..
