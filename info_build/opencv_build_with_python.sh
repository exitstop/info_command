#!/bin/bash

cmake \
-D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D WITH_V4L=ON \
-D WITH_LIBV4L=ON \
-D WITH_GSTREAMER=ON \
-D BUILD_SHARED_LIBS=${BUILD_SHARED_LIBS} \
-D OPENCV_EXTRA_MODULES_PATH=$(TMP_DIR)opencv/opencv_contrib-$(OPENCV_VERSION)/modules \
-D BUILD_DOCS=OFF \
-D BUILD_EXAMPLES=OFF \
-D BUILD_TESTS=OFF \
-D BUILD_PERF_TESTS=OFF \
-D BUILD_opencv_java=OFF \
-D BUILD_OPENCV_PYTHON3=ON \
-D PYTHON3_EXECUTABLE=`which python3.8` \
-D PYTHON3_INCLUDE_DIR=`python3.8 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())"` \
-D PYTHON3_PACKAGES_PATH=`python3.8 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"` \
-D PYTHON3_NUMPY_INCLUDE_DIRS=/usr/local/lib/python3.8/dist-packages/numpy/core/include \
-D PYTHON3_LIBRARY=/usr/lib/aarch64-linux-gnu/libpython3.8.so.1.0 \
-D ENABLE_NEON=ON \
-D BUILD_opencv_python=ON \
-D BUILD_opencv_python2=OFF \
-D BUILD_opencv_python3=ON \
-D WITH_JASPER=OFF \
-D OPENCV_GENERATE_PKGCONFIG=ON \
..


#-D ENABLE_VFPV3=ON \
#-D OPENCV_SKIP_PYTHON_LOADER=ON \

cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_V4L=ON -D WITH_LIBV4L=ON -D WITH_GSTREAMER=ON -D BUILD_SHARED_LIBS=${BUILD_SHARED_LIBS} -D OPENCV_EXTRA_MODULES_PATH=$(TMP_DIR)opencv/opencv_contrib-$(OPENCV_VERSION)/modules -D BUILD_DOCS=OFF -D BUILD_EXAMPLES=OFF -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_opencv_java=OFF -D BUILD_OPENCV_PYTHON3=ON -D PYTHON3_EXECUTABLE=$(which python3.8) -D PYTHON3_INCLUDE_DIR=$(python3.8 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") -D PYTHON3_PACKAGES_PATH=$(python3.8 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") -D PYTHON3_NUMPY_INCLUDE_DIRS=/usr/local/lib/python3.8/dist-packages/numpy/core/include -D PYTHON3_LIBRARY=/usr/lib/aarch64-linux-gnu/libpython3.8.so.1.0 -D ENABLE_NEON=ON -D BUILD_opencv_python=ON -D BUILD_opencv_python2=OFF -D BUILD_opencv_python3=ON -D WITH_JASPER=OFF -D OPENCV_GENERATE_PKGCONFIG=ON ..
