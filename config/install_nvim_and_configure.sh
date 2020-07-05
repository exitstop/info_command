#!/bin/bash

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update
sudo apt install -y python-neovim curl git
sudo apt install -y python3-neovim
sudo apt-get install -y yarn
sudo apt install -y build-essential

CUSTOM_NVIM_PATH=/usr/bin/nvim

curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
sudo chmod u+x nvim.appimage
sudo mv nvim.appimage $CUSTOM_NVIM_PATH
mkdir -p ~/.config/nvim
wget https://raw.githubusercontent.com/exitstop/info_command/master/config/init.vim -O ~/.config/nvim/init.vim
wget https://raw.githubusercontent.com/exitstop/info_command/master/config/.ycm_extra_conf.py -O ~/.config/nvim/.ycm_extra_conf.py
mkdir -p ~/.config/nvim/UltiSnips/
wget https://raw.githubusercontent.com/exitstop/info_command/master/config/cpp.snippets -O ~/.config/nvim/UltiSnips/cpp.snippets
 
sudo apt-get install -y build-essential libssl-dev
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh -o install_nvm.sh
sudo chmod +x install_nvm.sh
./install_nvm.sh
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install v12.18.0

set -u
#sudo update-alternatives --install /usr/bin/ex ex "${CUSTOM_NVIM_PATH}" 110
#sudo update-alternatives --install /usr/bin/vi vi "${CUSTOM_NVIM_PATH}" 110
#sudo update-alternatives --install /usr/bin/view view "${CUSTOM_NVIM_PATH}" 110
#sudo update-alternatives --install /usr/bin/vim vim "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vimdiff vimdiff "${CUSTOM_NVIM_PATH}" 110

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim \
    --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim -c ':PlugInstall' -c ":UpdateRemotePlugins" -c ':q!' -c ':q!'
