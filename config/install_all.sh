#!/bin/bash

wget https://raw.githubusercontent.com/exitstop/info_command/master/config/install_nvim_and_configure.sh
wget https://raw.githubusercontent.com/exitstop/info_command/master/config/install_tmux.sh
wget https://raw.githubusercontent.com/exitstop/info_command/master/config/install_zsh.sh

sudo chmod +x install_nvim_and_configure.sh
sudo chmod +x install_tmux.sh
sudo chmod +x install_zsh.sh

./install_nvim_and_configure.sh
./install_tmux.sh
./install_zsh.sh
