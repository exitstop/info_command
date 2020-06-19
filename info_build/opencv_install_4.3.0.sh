#!/bin/bash

# arm
#sudo add-apt-repository ppa:deadsnakes/ppa
#sudo apt update
#sudo apt install python3.5
#wget https://bootstrap.pypa.io/get-pip.py
#sudo python3.5 get-pip.py
#sudo -H pip3.5 install numpy

#echo $(pkg-config --cflags --libs opencv)
# /usr/local/lib/pkgconfig/opencv4.pc
# sudo apt-get purge '*opencv*'
# sudo find / -name "*opencv*" -exec rm -rf {} \;

# rk3399
# git clone https://github.com/rockchip-linux/rk-rootfs-build
# rk-rootfs-build/packages/arm64/rga
# sudo cp include/* /usr/local/include
# sudo cp lib/* /usr/local/lib


sudo apt install -y build-essential
sudo apt install -y libgtk2.0-dev libgtk-3-dev ffmpeg libxv-dev libxv1
sudo apt install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev \
    libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
sudo apt install -y libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libavresample-dev
sudo apt install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev

# Иснтрукция по настройкe Cmake
# https://docs.opencv.org/3.4/d7/d9f/tutorial_linux_install.html

sudo apt install build-essential cmake unzip

ARCH_BIN=4.3.0
INSTALL_DIR=/usr/local
#OPENCV_SOURCE_DIR=${HOME}
OPENCV_SOURCE_DIR=`pwd`
WHEREAMI=$PWD
CMAKE_INSTALL_PREFIX=$INSTALL_DIR
OPECV_VERSION=$ARCH_BIN
CPACK_PACKAGE_VERSION=$OPECV_VERSION

cd $OPENCV_SOURCE_DIR
echo "[INFO] cloning opencv $OPECV_VERSION"
wget -O opencv.zip https://github.com/opencv/opencv/archive/$OPECV_VERSION.zip
unzip opencv.zip
rm opencv.zip
echo "[INFO] cloning opencv_contrib $OPECV_VERSION"
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/$OPECV_VERSION.zip
unzip opencv_contrib.zip
rm opencv_contrib.zip

cd $OPENCV_SOURCE_DIR/opencv-$OPECV_VERSION
mkdir build
cd build

#-D OPENCV_EXTRA_MODULES_PATH=$(TMP_DIR)opencv/opencv_contrib-$(OPENCV_VERSION)/modules
#-D OPENCV_GENERATE_PKGCONFIG=ON ..

time cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D OPENCV_EXTRA_MODULES_PATH=$OPENCV_SOURCE_DIR/opencv_contrib-$OPECV_VERSION/modules \
    -D BUILD_EXAMPLES=OFF \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D BUILD_SHARED_LIBS=ON \
    -D BUILD_DOCS=OFF \
    -D BUILD_EXAMPLES=OFF \
    -D BUILD_TESTS=OFF \
    -D BUILD_PERF_TESTS=OFF \
    -D BUILD_opencv_java=OFF \
    -D BUILD_opencv_python=NO \
    -D BUILD_opencv_python2=NO \
    -D BUILD_opencv_python3=NO \
    -D ENABLE_VFPV2=ON \
    -D WITH_JASPER=OFF \
    -D BUILD_TESTS=OFF \
    -D WITH_OPENCL=ON \
    -D CPACK_BINARY_DEB=ON \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
    -D BUILD_PERF_TESTS=OFF \
    -D WITH_V4L=ON  \
    -D WITH_LIBV4L=ON \
    -D WITH_GSTREAMER=ON \
    -D WITH_FFMPEG=1 \
    -D WITH_GTK=ON \
    -D CPACK_PACKAGE_VERSION=$OPECV_VERSION \
    -D BUILD_opencv_saliency=OFF \
    -D ENABLE_PRECOMPILED_HEADERS= OFF \
    ..

    #-D PYTHON3_EXECUTABLE=/usr/bin/python3.6 \
    #-D PYTHON_INCLUDE_DIR=/usr/include/python3.6 \
    #-D PYTHON_INCLUDE_DIR2=/usr/include/aarch64-linux-gnu/python3.6m/ \
    #-D PYTHON_LIBRARY=/usr/lib/aarch64-linux-gnu/libpython3.6m.so \
    #-D PYTHON2_NUMPY_INCLUDE_DIRS=/usr/lib/python2.7/dist-packages/numpy/core/include/numpy \
    #-D PYTHON3_NUMPY_INCLUDE_DIRS=/usr/lib/python3/dist-packages/numpy/core/include/ \
    #-D BUILD_opencv_python2=0 \
    #-D BUILD_opencv_python3=1 \
    #-D BUILD_LIST=features2d \

if [ $? -eq 0 ] ; then
    echo "CMake configuration make successful"
else
    # Try to make again
    echo "CMake issues " >&2
    echo "Please check the configuration being used"
    exit 1
fi

# Consider $ sudo nvpmodel -m 2 or $ sudo nvpmodel -m 0
echo "[INFO] BUILDING OpenCV"
NUM_CPU=$(nproc)
time make -j$(($NUM_CPU - 1))
if [ $? -eq 0 ] ; then
    echo "[INFO] OpenCV make successful"
else
    # Try to make again; Sometimes there are issues with the build
    # because of lack of resources or concurrency issues
    echo "Make did not build " >&2
    echo "Retrying ... "
    # Single thread this time
    make
    if [ $? -eq 0 ] ; then
        echo "OpenCV make successful"
    else
        # Try to make again
        echo "Make did not successfully build" >&2
        echo "Please fix issues and retry build"
        exit 1
    fi
fi

echo "[INFO] Installing OpenCV... "
sudo make install
if [ $? -eq 0 ] ; then
    echo "OpenCV installed in: $CMAKE_INSTALL_PREFIX"
else
    echo "There was an issue with the final installation"
    exit 1
fi

echo "[INFO] Starting Packaging"
sudo ldconfig
#NUM_CPU=$(nproc)
NUM_CPU=2
time sudo make package -j$(($NUM_CPU - 1))
if [ $? -eq 0 ] ; then
    echo "OpenCV make package successful"
else
    # Try to make again; Sometimes there are issues with the build
    # because of lack of resources or concurrency issues
    echo "Make package did not build " >&2
    echo "Retrying ... "
    # Single thread this time
    sudo make package
    if [ $? -eq 0 ] ; then
        echo "OpenCV make package successful"
    else
        # Try to make again
        echo "Make package did not successfully build" >&2
        echo "Please fix issues and retry build"
        exit 1
    fi
fi

echo "[INFO] Removing sources"
cd ${OPENCV_SOURCE_DIR}
#sudo rm -r opencv
