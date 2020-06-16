#!/bin/bash

sudo apt update
sudo apt install -y python-neovim curl git yes
sudo apt install -y python3-neovim
sudo apt-get install -y nodejs

CUSTOM_NVIM_PATH=/usr/bin/nvim

curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
sudo chmod u+x nvim.appimage
sudo mv nvim.appimage $CUSTOM_NVIM_PATH
mkdir -p ~/.config/nvim
wget https://raw.githubusercontent.com/exitstop/info_command/master/config/init.vim -O ~/.config/nvim/init.vim

# node install
#curl -sL install-node.now.sh/lts | bash

set -u
sudo update-alternatives --install /usr/bin/ex ex "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vi vi "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/view view "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vim vim "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vimdiff vimdiff "${CUSTOM_NVIM_PATH}" 110

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim \
    --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim -c ':PlugInstall' -c ':q!' -c ':q!'
