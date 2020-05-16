#!/bin/bash

# arm
sudo apt update
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.6
wget https://bootstrap.pypa.io/get-pip.py
sudo python3.6 get-pip.py

sudo apt install build-essential cmake unzip
sudo apt-get install python3-dev
sudo apt-get install -y gfortran libatlas-base-dev
sudo apt install libgtk2.0-dev libgtk-3-dev ffmpeg
sudo apt install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt install git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev
sudo apt install libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libavresample-dev
sudo 

# Иснтрукция по настройкe Cmake
# https://docs.opencv.org/3.4/d7/d9f/tutorial_linux_install.html

ARCH_BIN=4.3.0
INSTALL_DIR=/usr/local
#OPENCV_SOURCE_DIR=${HOME}
OPENCV_SOURCE_DIR=`pwd`
WHEREAMI=$PWD
CMAKE_INSTALL_PREFIX=$INSTALL_DIR
OPECV_VERSION=4.3.0
CPACK_PACKAGE_VERSION=$OPECV_VERSION

sudo -H pip3 install --upgrade --force-reinstall numpy==1.16.0

cd $OPENCV_SOURCE_DIR
git clone --recursive https://github.com/pytorch/pytorch
cd pytorch
git checkout v1.4.0
git submodule sync
git submodule update --init --recursive

wget https://github.com/Archiconda/build-tools/releases/download/0.2.3/Archiconda3-0.2.3-Linux-aarch64.sh
sudo chmod +x Archiconda3-0.2.3-Linux-aarch64.sh
./Archiconda3-0.2.3-Linux-aarch64.sh
conda install numpy ninja pyyaml setuptools cmake cffi
source ~/.bashrc

export CMAKE_PREFIX_PATH=${CONDA_PREFIX:-"$(dirname $(which conda))/../"}
USE_CUDA=0 USE_NUMPY=ON python3.6 setup.py install --user
USE_CUDA=0 USE_NUMPY=ON python3.6 setup.py bdist_wheel
