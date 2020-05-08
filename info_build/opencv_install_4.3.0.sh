#!/bin/bash

# arm
#sudo add-apt-repository ppa:deadsnakes/ppa
#sudo apt-get update
#sudo apt-get install python3.5

sudo apt install build-essential cmake unzip

ARCH_BIN=6.2
INSTALL_DIR=/usr/local
#OPENCV_SOURCE_DIR=${HOME}
OPENCV_SOURCE_DIR=`pwd`
WHEREAMI=$PWD
CMAKE_INSTALL_PREFIX=$INSTALL_DIR
OPECV_VERSION=4.3.0
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

time cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D OPENCV_EXTRA_MODULES_PATH=$OPENCV_SOURCE_DIR/opencv_contrib-$OPECV_VERSION/modules \
    -D BUILD_EXAMPLES=OFF \
    -D BUILD_TESTS=OFF \
    -D WITH_OPENCL=ON \
    -D CPACK_BINARY_DEB=ON \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
    -D BUILD_PERF_TESTS=OFF \
    -D BUILD_opencv_python2=0 \
    -D BUILD_opencv_python3=1 \
    -D WITH_V4L=ON  \
    -D WITH_LIBV4L=ON \
    -D WITH_GSTREAMER=ON \
    -D WITH_FFMPEG=1 \
    -D WITH_GTK=ON \
    -D BUILD_DOCS=OFF \
    -D CPACK_PACKAGE_VERSION=$OPECV_VERSION \
    -D BUILD_opencv_saliency=OFF \
    -D ENABLE_PRECOMPILED_HEADERS= OFF \
    ..

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
NUM_CPU=$(nproc)
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
