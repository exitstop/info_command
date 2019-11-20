# Предварительно установить CUDA 10.1
Самое простое с помощью deb пакета
Если не устанавливается из за уже установленной версии можно удалить стару командами из этого форума
https://devtalk.nvidia.com/default/topic/1056325/linux/problems-installing-cuda-10-1-on-my-computer/

-`sudo apt-get --purge remove "*cublas*" "cuda*" "nvidia-cuda*"`
-`sudo apt-get --purge remove "*nvidia*"`

И установить по новой

# Инструкция для tar
`https://docs.nvidia.com/deeplearning/sdk/tensorrt-install-guide/index.html#installing-tar`
- `tar xzvf TensorRT-5.1.5.0.Ubuntu-18.04.2.x86_64-gnu.cuda-10.1.cudnn7.5.tar.gz`
- `export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/user/Documents/save/sources/cpp/tensorrt_test/TensorRT-5.1.5.0`

cd TensorRT-5.1.5.0/python
sudo pip2 install tensorrt-5.1.5.0-cp27-none-linux_x86_64.whl

# Следующая инструкция 
https://github.com/NVIDIA/TensorRT
Выполнить пункты:
- Downloading The TensorRT Components
- Building The TensorRT OSS Components

# Перед компиляцией
добавить в `~/.bashrc` или `~/.zshrc` или свой конфиг shell
И не забудьте поменять пути на свои
- `export TRT_SOURCE=/home/user/Documents/save/sources/cpp/tensorrt_test/TensorRT`
- `export TRT_RELEASE=/home/user/Documents/save/sources/cpp/tensorrt_test/TensorRT-5.1.5.0`
- `export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$TRT_RELEASE/lib`
