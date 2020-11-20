#/bin/bash
TZ=Europe/Moscow
sudo ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
sudo apt update
sudo apt -y install sudo rsync wget git md5deep ssh
sudo apt -y install libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good \
gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc \
gstreamer1.0-tools gstreamer1.0-x libgstreamer-plugins-base1.0-dev \
libgtk2.0-dev libgtk-3-dev ffmpeg pkg-config libavcodec-dev libavformat-dev libswscale-dev \
libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libavutil-dev  libavresample-dev
sudo apt -y install python3.8 build-essential cmake unzip python3.8-dev gfortran libatlas-base-dev
mkdir -p ~/facechain/install
cd ~/facechain/install
git clone --recursive https://github.com/pytorch/pytorch
cd pytorch
git checkout v1.4.0
cd ..
wget https://bootstrap.pypa.io/get-pip.py
python3.8 get-pip.py
#wget https://golang.org/dl/go1.15.3.linux-amd64.tar.gz
#tar -C /usr/local -xzf go1.15.3.linux-amd64.tar.gz
#export PATH=$PATH:/usr/local/go/bin
#export GOPATH=~/go
#echo "export GOPATH=~/go" >> ~/.bashrc
#echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
#export PATH=$PATH:/usr/local/go/bin
#export GOPATH=/root/go
#export PATH=$PATH:/usr/local/go/bin
#export GOPATH=/root/go
pip3.8 install numpy ninja pyyaml setuptools cmake cffi
go get -u -d gocv.io/x/gocv
cd $GOPATH/src/gocv.io/x/gocv
git checkout v0.23.0
cp /file/gocv/Makefile.20.04.arm64 $GOPATH/src/gocv.io/x/gocv/Makefile
cd $GOPATH/src/gocv.io/x/gocv
make clean
make deps
make download
make build
sudo make sudo_install
cd ~/facechain/install/pytorch
git submodule sync
git submodule update --init --recursive
cd ~/facechain/install/pytorch
USE_CUDA=0 USE_NUMPY=ON python3.8 setup.py install
cd ~/facechain/install/pytorch
USE_CUDA=0 USE_NUMPY=ON python3.8 setup.py bdist_wheel
cd ~/facechain/
#rm -rf rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
#rm -rf ~/facechain
#apt-get clean
