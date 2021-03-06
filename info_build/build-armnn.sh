#!/bin/bash

# source https://github.com/ARM-software/Tool-Solutions/blob/master/ml-tool-examples/build-armnn/build-armnn.sh
# example run
# time ./build-armnn.sh -o 1 -a arm64-v8a
# number of CPUs and memory size for make -j
NPROC=2


#sudo apt-get install -y  git
#sudo apt-get install -y  scons
#sudo apt-get install -y  gcc-arm-linux-gnueabihf
#sudo apt-get install -y  g++-arm-linux-gnueabihf
#sudo apt-get install -y  curl
#sudo apt-get install -y  autoconf
#sudo apt-get install -y  libtool
#sudo apt-get install -y  cmake

#
# Copyright (c) 2018-2019 Arm Limited. All rights reserved.
#

#
# Script to build all of the required software for the Arm NN examples
#

#sudo fallocate -l 2G /swapfile
#sudo chmod 600 /swapfile
#sudo mkswap /swapfile
#sudo swapon /swapfile
#sudo swapon --show

#sudo swapoff /swapfile
#sudo rm /swapfile

#http://tessy.org/wiki/index.php?Firefly%20RK3399
#git clone https://github.com/rockchip-linux/libmali
#cd libmali
#cmake .
#make
#sudo make install
#sudo rm /usr/lib/aarch64-linux-gnu/libOpenCL.so
#sudo cp -p libmali/lib/aarch64-linux-gnu/libmali-midgard-t86x-r14p0* /usr/lib/aarch64-linux-gnu/
#cd /usr/lib/aarch64-linux-gnu/
#sudo ln -s libmali-midgard-t86x-r14p0.so libOpenCL.so
#sudo apt install opencl-headers ocl-icd-opencl-dev
#
#/etc/udev/rules.d/99-mali.rules
#KERNEL=="mali0",SUBSYSTEM=="misc",MODE="0777"
#sudo vim /etc/udev/rules.d/99-mali.rules
#sudo reboot
#
# еще ссылки http://tessy.org/wiki/index.php?Arm#o82da810
# opencv http://tessy.org/wiki/index.php?Firefly%20RK3399%A4%C7OpenCV3.4.0%A4%F2%A5%D3%A5%EB%A5%C9

#https://developer.arm.com/solutions/machine-learning-on-arm/developer-material/how-to-guides/cross-compiling-arm-nn-for-the-raspberry-pi-and-tensorflow/single-page

BASEDIR=$HOME/armnn-devenv/pkg

function IsPackageInstalled() {
    dpkg -s "$1" > /dev/null 2>&1
}

usage() { 
    echo "Usage: $0 [-a <armv7a|arm64-v8a>] [-o <0|1> ]" 1>&2 
    echo "   default arch is arm64-v8a " 1>&2
    echo "   -o option will enable or disable OpenCL when cross compiling" 1>&2
    echo "      native compile will enable OpenCL if /dev/mali is found and -o is not used" 1>&2
    exit 1 
}

# Simple command line arguments
while getopts ":a:o:h" opt; do
    case "${opt}" in
        a)
            Arch=${OPTARG}
            [ $Arch = "armv7a" -o $Arch = "arm64-v8a" ] || usage
            ;;
        o)
            OpenCL=${OPTARG}
            ;;
        h)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

# check if cross compile from x64
if [ `uname -m` = "x86_64" ]; then
    CrossCompile="True"
else
    CrossCompile="False"
fi

# save history to logfile
exec > >(tee -i logfile)
exec 2>&1

echo "Building Arm NN in $HOME/armnn-devenv"

# Start from home directory
cd $HOME 

# if nothing, found make a new diectory
[ -d armnn-devenv ] || mkdir armnn-devenv


# check for previous installation, HiKey 960 is done as a mount point so don't 
# delete all from top level, drop down 1 level
while [ -d armnn-devenv/pkg ]; do
    read -p "Do you wish to remove the existing armnn-devenv build environment? " yn
    case $yn in
        [Yy]*) rm -rf armnn-devenv/pkg armnn-devenv/ComputeLibrary armnn-devenv/armnn armnn-devenv/gator ; break ;;
        [Nn]*) echo "Exiting " ; echo ;;
        *) echo "Please answer yes or no.";;
    esac
done

cd armnn-devenv 

# packages to install 
packages="git wget curl autoconf autogen automake libtool scons make cmake gcc g++ unzip bzip2"
for package in $packages; do
    if ! IsPackageInstalled $package; then
        sudo apt-get install -y $package
    fi
done

# extra packages when cross compiling
if [ $CrossCompile = "True" ]; then
    if [ "$Arch" = "armv7a" ]; then
        cross_packages="g++-arm-linux-gnueabihf"
    else
        cross_packages="g++-aarch64-linux-gnu"
    fi
    for cross_package in $cross_packages; do
        if ! IsPackageInstalled $cross_package; then
            sudo apt-get install -y $cross_package
        fi
    done
fi

MEM=`awk '/MemTotal/ {print $2}' /proc/meminfo`

# check for Mali device node
[ -z "$OpenCL" ] && [ -c /dev/mali? ] && OpenCL=1 || OpenCL=0 
#[ -z "$OpenCL" ] && [ -c /dev/mali? ] && echo 1 || echo 0
OpenCL=1

# check for Armv8 or Armv7
# don't override command line and default to aarch64
[ -z "$Arch" ] && Arch=`uname -m`

if [ $Arch = "armv7l" ]; then
    Arch=armv7a
    PREFIX=arm-linux-gnueabihf-
else
    Arch=arm64-v8a
    PREFIX=aarch64-linux-gnu-
fi


# Boost

mkdir -p pkg/boost 
echo "building boost"
pushd pkg/boost

wget https://dl.bintray.com/boostorg/release/1.64.0/source/boost_1_64_0.tar.bz2
tar xf boost_1_64_0.tar.bz2
cd boost_1_64_0
./bootstrap.sh --prefix=$HOME/armnn-devenv/pkg/boost/install

Toolset=""
if [ $CrossCompile = "True" ]; then
    cp tools/build/example/user-config.jam project-config.jam
    sed -i "/# using gcc ;/c using gcc : arm : $PREFIX\g++ ;" project-config.jam
    Toolset="toolset=gcc-arm"
fi

./b2 install link=static cxxflags=-fPIC $Toolset --with-filesystem --with-test --with-log --with-program_options --prefix=$HOME/armnn-devenv/pkg/boost/install 

popd

# gator
git clone https://github.com/ARM-software/gator.git

if [ $CrossCompile = "True" ]; then
    make CROSS_COMPILE=$PREFIX -C gator/daemon -j $NPROC
else
    make -C gator/daemon -j $NPROC
fi
cp gator/daemon/gatord $HOME/

# Arm Compute Library 
git clone https://github.com/ARM-software/ComputeLibrary.git

echo "building Arm CL"
pushd ComputeLibrary

# check gcc version in case adjustments are needed based on compiler
VER=`gcc -dumpversion | awk 'BEGIN{FS="."} {print $1}'`
echo "gcc version is $VER"

scons arch=$Arch neon=1 opencl=$OpenCL embed_kernels=$OpenCL Werror=0 \
  extra_cxx_flags="-fPIC" benchmark_tests=0 examples=0 validation_tests=0 \
  os=linux gator_dir="$HOME/armnn-devenv/gator" -j $NPROC

popd

# TensorFlow and Google protobuf
# Latest TensorFlow had a problem, udpate branch as needed

pushd pkg
mkdir install
git clone --branch 3.5.x https://github.com/protocolbuffers/protobuf.git
git clone https://github.com/tensorflow/tensorflow.git
cd tensorflow
# need specific version of tensorflow
# https://github.com/ARM-software/armnn/issues/267
git checkout a0043f9262dc1b0e7dc4bdf3a7f0ef0bebc4891e
cd ../

# build Protobuf
cd protobuf
./autogen.sh


# Extra protobuf build for host machine when cross compiling
if [ $CrossCompile = "True" ]; then
    mkdir host-build ; cd host-build
    ../configure --prefix=$HOME/armnn-devenv/pkg/host
    make -j $NPROC
    make install
    make clean
    cd ..
fi

mkdir build ; cd build
if [ $CrossCompile = "True" ]; then
    ../configure --prefix=$HOME/armnn-devenv/pkg/install --host=arm-linux CC=$PREFIX\gcc CXX=$PREFIX\g++ --with-protoc=$HOME/armnn-devenv/pkg/host/bin/protoc
else
    ../configure --prefix=$HOME/armnn-devenv/pkg/install 
fi

make -j $NPROC
make install 

popd

# Arm NN
git clone https://github.com/ARM-software/armnn.git

pushd pkg/tensorflow/

if [ $CrossCompile = "True" ]; then
    $HOME/armnn-devenv/armnn/scripts/generate_tensorflow_protobuf.sh $HOME/armnn-devenv/pkg/tensorflow-protobuf $HOME/armnn-devenv/pkg/host
else
    $HOME/armnn-devenv/armnn/scripts/generate_tensorflow_protobuf.sh $HOME/armnn-devenv/pkg/tensorflow-protobuf $HOME/armnn-devenv/pkg/install
fi

popd


wget -O flatbuffers-1.10.0.tar.gz https://github.com/google/flatbuffers/archive/v1.10.0.tar.gz    
tar xf flatbuffers-1.10.0.tar.gz

pushd flatbuffers-1.10.0         
rm -f CMakeCache.txt
rm -rf build
mkdir build
cd build
cmake .. \         
-DFLATBUFFERS_BUILD_FLATC=1 \               
-DCMAKE_INSTALL_PREFIX:PATH=$BASEDIR/flatbuffers
make all install
popd

pushd $BASEDIR
mkdir tflite
cd tflite
cp $BASEDIR/tensorflow/tensorflow/lite/schema/schema.fbs .       
$BASEDIR/flatbuffers-1.10.0/build/flatc -c --gen-object-api --reflect-types --reflect-names schema.fbs
popd

git clone https://github.com/onnx/onnx.git 

mkdir -p pkg/onnx
pushd onnx
git fetch https://github.com/onnx/onnx.git f612532843bd8e24efeab2815e45b436479cc9ab && git checkout FETCH_HEAD

cd $BASEDIR/onnx

export LD_LIBRARY_PATH=$BASEDIR/install/lib:$LD_LIBRARY_PATH        
$BASEDIR/install/bin/protoc ../../onnx/onnx/onnx.proto --proto_path=. --proto_path=$BASEDIR/install/include --cpp_out $BASEDIR/onnx
#$BASEDIR/onnx     AssertZeroExitCode "Building Onnx failed"

popd

# Arm NN
pushd armnn
mkdir build ; cd build

CrossOptions=""
if [ $CrossCompile = "True" ]; then
    CrossOptions="-DCMAKE_LINKER=aarch64-linux-gnu-ld \
                  -DCMAKE_C_COMPILER=aarch64-linux-gnu-gcc \
                  -DCMAKE_CXX_COMPILER=aarch64-linux-gnu-g++ "
fi

cmake ..  \
$CrossOptions  \
-DCMAKE_C_COMPILER_FLAGS=-fPIC \
-DARMCOMPUTE_ROOT=$HOME/armnn-devenv/ComputeLibrary/ \
-DARMCOMPUTE_BUILD_DIR=$HOME/armnn-devenv/ComputeLibrary/build \
-DBOOST_ROOT=$HOME/armnn-devenv/pkg/boost/install/ \
-DTF_GENERATED_SOURCES=$HOME/armnn-devenv/pkg/tensorflow-protobuf/  \
-DBUILD_TF_PARSER=0 \
-DPROTOBUF_ROOT=$HOME/armnn-devenv/pkg/install   \
-DPROTOBUF_INCLUDE_DIRS=$HOME/armnn-devenv/pkg/install/include   \
-DPROFILING_BACKEND_STREAMLINE=1 \
-DGATOR_ROOT=$HOME/armnn-devenv/gator \
-DARMCOMPUTENEON=1  \
-DARMCOMPUTECL=$OpenCL \
-DPROTOBUF_LIBRARY_DEBUG=$HOME/armnn-devenv/pkg/install/lib/libprotobuf.so \
-DPROTOBUF_LIBRARY_RELEASE=$HOME/armnn-devenv/pkg/install/lib/libprotobuf.so \
-DCMAKE_CXX_FLAGS="-Wno-error=sign-conversion" \
-DCMAKE_BUILD_TYPE=Debug \
-DBUILD_SAMPLE_APP=ON \
-DARMNNREF=1 \
-DBUILD_UNIT_TESTS=OFF \
-DSAMPLE_DYNAMIC_BACKEND=ON \
-DBUILD_ONNX_PARSER=1 \
-DONNX_GENERATED_SOURCES=$BASEDIR/onnx \
-DBUILD_PYTHON_SRC=0 \
-DBUILD_PYTHON_WHL=0 \
-DBUILD_TF_LITE_PARSER=OFF
#-DTF_LITE_GENERATED_PATH=$HOME/armnn-devenv/pkg/tflite \
#-DTF_LITE_SCHEMA_INCLUDE_PATH=$HOME/armnn-devenv/pkg/tflite \
#-DFLATBUFFERS_ROOT=$BASEDIR/flatbuffers \
#-DFLATBUFFERS_INCLUDE_PATH=/home/nvidia/armnn-devenv/pkg/flatbuffers/include \
#-DFLATC_DIR=$BASEDIR/flatbuffers-1.10.0/build
#-DSWIG_EXECUTABLE=$HOME/armnn-devenv/swig/build/bin/swig \
#-DSWIG_DIR=$HOME/armnn-devenv/swig/build/bin \


if [ $Arch = "armv7l" ] || [ $MEM -lt 2000000 ]; then
    # avoid running out of memory on smaller systems 
    make
else
    make -j $NPROC
fi
popd

echo "done, everything in armnn-devenv/"
cd ..

