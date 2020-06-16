#!/bin/bash

sudo add-apt-repository ppa:csaba-kertesz/random
sudo apt update
sudo apt install -y zsh xclip colout

ARG_1=$1
if [ -z "$ARG_1" ]; then
    echo "ARG_1 = empty; no install tmux"
else
    chsh -s $(which zsh)
fi

mv ~/.zshrc ~/.zshrc.bk
wget https://raw.githubusercontent.com/exitstop/info_command/master/config/.zshrc -O ~/.zshrc

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

