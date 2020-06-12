# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/user/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  web-search
  extract
  #pcmanfm
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


#touch ~/.cache/zsh
DIRSTACKFILE="$HOME/.dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=90
setopt autopushd pushdsilent pushdtohome
## Remove duplicate entries
setopt pushdignoredups
## This reverts the +/- operators.
setopt pushdminus

alias clip="head -c -1|xclip -i -selection clipboard"




# emcc

#export PATH="/home/user/Documents/save/sources/cpp/emsdk/fastcomp/emscripten:$PATH"
#export PATH="/home/user/Documents/save/sources/cpp/emsdk/node/12.9.1_64bit/bin:$PATH"

#export EMSDK="/home/user/Documents/save/sources/cpp/emsdk"
#export EM_CONFIG="/home/user/.emscripten"
#export EMSDK_NODE="/home/user/Documents/save/sources/cpp/emsdk/node/12.9.1_64bit/bin/node"
alias clip='xclip -selection clipboard' 
alias clr='colout -t cmake | colout -t g++'
alias rd='readlink -f'
alias cdinfo="cd /home/user/Documents/save/sources/info_command"
alias cdremote="cd /home/user/Documents/save/sources/golang/src/github.com/remote_ssh_v2/client_daemon_port_master"
alias cdtx2="cd /home/user/Documents/save/sources/ovision/jetson_tx2/secureboot-tegra/orbitty/Linux_for_Tegra"



# conda
#export PATH=~/anaconda3/bin:$PATH

#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


##setopt +o nomatch
#setopt nonomatch

## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/user/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
    #eval "$__conda_setup"
#else
    #if [ -f "/home/user/anaconda3/etc/profile.d/conda.sh" ]; then
        #. "/home/user/anaconda3/etc/profile.d/conda.sh"
    #else
        #export PATH="/home/user/anaconda3/bin:$PATH"
    #fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

#export GO111MODULE=on
#export TRT_RELEASE=/home/user/Documents/save/sources/cpp/tensorrt_test/TensorRT-5.0.2.6
#export TRT_SOURCE=/home/user/Documents/save/sources/cpp/tensorrt_test/TensorRT
export TRT_SOURCE=/home/user/Documents/save/sources/cpp/tensorrt_test/TensorRT_OSS_5.1.5.0
export TRT_RELEASE=/home/user/Documents/save/sources/cpp/tensorrt_test/TensorRT-5.1.5.0
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$TRT_RELEASE/lib
export CPATH=$CPATH:/usr/local/cuda/include
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/cuda/lib64

export CROSS_COMPILE_ARM=/home/user/Documents/save/sources/ovision/jetson_tx2/cross_compiler/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
export CROSS_COMPILE_AARCH64=/home/user/Documents/save/sources/ovision/jetson_tx2/cross_compiler/gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-

QT_DIR=~/Qt/5.13.0/gcc_64/bin
QT_VERSION=5.13.0
QT_API=5.13.0

source ~/.gvm/scripts/gvm

[[ -s "/home/user/.gvm/scripts/gvm" ]] && source "/home/user/.gvm/scripts/gvm"

## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/user/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
    #eval "$__conda_setup"
#else
    #if [ -f "/home/user/anaconda3/etc/profile.d/conda.sh" ]; then
        #. "/home/user/anaconda3/etc/profile.d/conda.sh"
    #else
        #export PATH="/home/user/anaconda3/bin:$PATH"
    #fi
#fi
#unset __conda_setup
## <<< conda initialize <<<
#
export CUDA_HOME="/usr/local/cuda"
export CUDA_NVCC_EXECUTABLE="$CUDA_HOME/bin/nvcc"
export CUDA_TOOLKIT_ROOT_DIR="$CUDA_HOME"
export CUDA_INCLUDE_DIRS="$CUDA_HOME/include"
export LD_LIBRARY_PATH="$CUDA_HOME/lib64:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
export PATH="$CUDA_HOME/bin:$CUDA_HOME/include:$PATH:"
export PATH="/home/user/Documents/local/soft/mxe/usr/bin:$PATH"
export CUDA_PATH=/usr/local/cuda
#CUDA_INCLUDE_DIRS 
#CUDA_CUDART_LIBRARY
#CUDA_TOOLKIT_ROOT_DIR
#export PATH="$PATH:/usr/lib/go-1.12/bin"

export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools

export GOPATH=$HOME/Documents/save/sources/golang
export GOBIN=$GOPATH/bin
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

export GO111MODULE=on
export GOPROXY=direct
export GOSUMDB=off
export GOPRIVATE="gitlab.com/FaceChainTeam"

#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
#[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
