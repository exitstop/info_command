# rk3399 mali nnvm tvm
# Это запустить на rk3399
# cmake .. -DOpenCL_LIBRARY=/usr/lib/aarch64-linux-gnu/libOpenCL.so.1

sudo apt-get update

#sudo apt-get autoremove --purge "llvm-8*"

sudo apt install -y llvm-4.0
sudo apt install -y scons
sudo apt install -y libopenblas-dev
sudo apt install -y ocl-icd-opencl-dev
# не уверен что это обязательно
sudo apt install -y liblapack* libblas* libopencv*
sudo apt-get -y install git cmake build-essential g++-4.8 c++-4.8 
sudo apt install -y g++-4.8 gcc-4.8
sudo update-alternatives --config g++
sudo update-alternatives --config gcc
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 30
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 40
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 20

sudo apt-get install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
#sudo apt-get update
sudo apt-get install python3.6
sudo apt-get install python3-distutils
sudo apt-get install python3-dev

wget https://bootstrap.pypa.io/get-pip.py
sudo python3.6 get-pip.py
sudo -H pip3.6 install setuptools Cython

sudo ln -s /usr/bin/llvm-config-4.0 /usr/bin/llvm-config

git clone --recursive https://github.com/dmlc/nnvm.git
git clone https://github.com/ARM-software/ComputeLibrary.git --branch v17.12
git clone --recursive https://github.com/apache/incubator-mxnet.git 

#cd nnvm/tvm
#mkdir build
#cd build
#cmake ..
#make

# build nnvm/tvm
cd nnvm/tvm
mkdir build
cd build
#cmake .. -DUSE_OPENCL=ON -DUSE_LLVM=ON
# Проблемки с LLVM не получилось решить поэтому отключил
cmake .. -DUSE_OPENCL=ON -DUSE_LLVM=OFF
make -j$(nproc)
#make USE_OPENCL=1  LLVM_CONFIG=llvm-config-4.0 -j$(nproc)
if [ $? -eq 0 ]; then echo -e "[\e[32mOK\e[0m] make tvm"; \
else echo -e "[\e[31mERROR\e[0m] make tvm" >&2; exit 1; fi

cd ../python
python3.6 setup.py install --user
cd ../topi/python
python3.6 setup.py install --user

cd ../../nnvm
make -j$(nproc)
if [ $? -eq 0 ]; then echo -e "[\e[32mOK\e[0m] make nnvm"; \
else echo -e "[\e[31mERROR\e[0m] make nnvm" >&2; exit 1; fi
cd python/
python3.6 setup.py install --user
cd ../..


# build arm compute library
cd ../../../ComputeLibrary/
scons Werror=0 neon=1 opencl=1 examples=1 os=linux arch=arm64-v8a embed_kernels=1 build=native -j4
cp ../acl_test.cc .

g++ acl_test.cc build/utils/*.o -O2 -std=c++11 -I. -Iinclude -Lbuild -larm_compute -larm_compute_graph -larm_compute_core -lOpenCL -o acl_test
cp acl_test ..
cd ..

# build mxnet
cd incubator-mxnet
make -j$(nproc) USE_OPENCV=0 USE_BLAS=openblas
cd ..

export NNVM_PATH=/home/nvidia/nnvim_test/nnvm/tvm/python
export PYTHONPATH=$NNVM_PATH/tvm/nnvm/python:$NNVM_PATH/tvm/python:$NNVM_PATH/nnvm/tvm/topi/python:${PYTHONPATH}
export LD_LIBRARY_PATH=$NNVM_PATH/tvm/build:$NNVM_PATH/tvm/nnvm/lib:${LD_LIBRARY_PATH}
