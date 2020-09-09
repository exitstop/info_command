#/bin/bash

sudo apt install -y cmake libopenblas-dev libopenblas-base libopenmpi-dev libjpeg-dev zlib1g-dev
sudo apt-get install python3-dev

git clone --recursive https://github.com/pytorch/pytorch
pushd pytorch
git checkout v1.4.0
git submodule sync
git submodule update --init --recursive

wget https://github.com/Archiconda/build-tools/releases/download/0.2.3/Archiconda3-0.2.3-Linux-aarch64.sh
sudo chmod +x Archiconda3-0.2.3-Linux-aarch64.sh
./Archiconda3-0.2.3-Linux-aarch64.sh
conda install numpy ninja pyyaml setuptools cmake cffi

sudo apt-get install -y gfortran libatlas-base-dev
wget https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py
conda install pyyaml
sudo -H pip3 install pyyaml
sudo -H pip3 install --upgrade cython
sudo -H pip3 install -U setuptools

export CMAKE_PREFIX_PATH=${CONDA_PREFIX:-"$(dirname $(which conda))/../"}
#BUILD_CAFFE2_OPS=0 USE_CUDA=0 python3.15 setup.py install --user
#USE_CUDA=0 USE_NUMPY=ON python3 setup.py install --user
#USE_CUDA=0 USE_NUMPY=ON python3 setup.py bdist_wheel
python3 setup.py clean

# https://gist.github.com/mhubii/1c1049fb5043b8be262259efac4b89d5

sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapon --show

# link libtorch.so
#-DCMAKE_PREFIX_PATH="${HOME}/anaconda3/envs/py37_torch/lib/python3.7/site-packages/torch" .. 
#set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} "~/.local/lib/python3/site-packages/torch/share/cmake/Torch/")
#-DCMAKE_PREFIX_PATH="${HOME}.local/lib/python3/site-packages/torch/lib" .. \


MAX_JOBS=2 \
USE_NCCL=0 \
USE_DISTRIBUTED=0 \
USE_QNNPACK=0 \
USE_PYTORCH_QNNPACK=0 \
USE_MKLDNN=0 \
BUILD_TEST=0 \
BUILD_CAFFE2_OPS=0 \
USE_OPENMP=0 \
USE_MPI=OFF \
USE_FBGEMM=OFF \
USE_NUMA=OFF \
USE_CUDA=0 \
python3 setup.py install --user

MAX_JOBS=2 \
USE_NCCL=0 \
USE_DISTRIBUTED=0 \
USE_QNNPACK=0 \
USE_PYTORCH_QNNPACK=0 \
USE_MKLDNN=0 \
BUILD_TEST=0 \
BUILD_CAFFE2_OPS=0 \
USE_OPENMP=0 \
USE_MPI=OFF \
USE_FBGEMM=OFF \
USE_NUMA=OFF \
USE_CUDA=0 \
python3 setup.py bdist_wheel

popd
git clone https://github.com/pytorch/vision && cd vision
git checkout v0.5.0
git submodule update --init --recursive
python3 setup.py bdist_wheel
