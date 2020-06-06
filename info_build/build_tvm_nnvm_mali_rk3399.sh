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
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20

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
cmake .. -DUSE_OPENCL=ON -DUSE_LLVM=ON
make -j$(nproc)
#make USE_OPENCL=1  LLVM_CONFIG=llvm-config-4.0 -j$(nproc)
if [ $? -eq 0 ]; then echo -e "[\e[32mOK\e[0m] make tvm"; \
else echo -e "[\e[31mERROR\e[0m] make tvm" >&2; exit 1; fi

cd ../python
sudo python setup.py install
cd ../topi/python
sudo python setup.py install

cd nnvm
make -j$(nproc)
if [ $? -eq 0 ]; then echo -e "[\e[32mOK\e[0m] make nnvm"; \
else echo -e "[\e[31mERROR\e[0m] make nnvm" >&2; exit 1; fi
cd ..


# build arm compute library
cd ComputeLibrary
scons Werror=1 neon=1 opencl=1 examples=1 os=linux arch=arm64-v8a embed_kernels=1 build=native -j4
cp ../acl_test.cc .

g++ acl_test.cc build/utils/*.o -O2 -std=c++11 -I. -Iinclude -Lbuild -larm_compute -larm_compute_graph -larm_compute_core -lOpenCL -o acl_test
cp acl_test ..
cd ..

# build mxnet
cd incubator-mxnet
make -j$(nproc) USE_OPENCV=0 USE_BLAS=openblas
cd ..

export PYTHONPATH=/home/user/Downloads/tvm-mali/nnvm/tvm/nnvm/python:/home/user/Downloads/tvm-mali/nnvm/tvm/python:/home/user/Downloads/tvm-mali/nnvm/tvm/topi/python:${PYTHONPATH}
export LD_LIBRARY_PATH=/home/user/Downloads/tvm-mali/nnvm/tvm/build:/home/user/Downloads/tvm-mali/nnvm/tvm/nnvm/lib:${LD_LIBRARY_PATH}
