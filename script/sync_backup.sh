#!/bin/bash

#sudo rsync --write-batch=foo -avpogP --max-size=500m --exclude=save/sources/ovision/jetson_tx2/ \
sudo rsync -avpogP --max-size=500m --exclude=save/sources/ovision/jetson_tx2/ \
    --exclude=save/sources/ovision/jetson_tx2/ \
    --exclude=save/soft/r2retdec \
    --exclude=save/soft \
    --exclude=save/sources/cpp/emsdk \
    --exclude=save/sources/cpp/pindrop \
    --exclude=save/sources/cpp/tensorrt* \
    --exclude=save/sources/golang/pkg/ \
    --exclude=save/sources/angular \
    --exclude=save/sources/ovision/github.com/python/codenames \
    --exclude=*node_modules* \
    --exclude=*vendor* \
    --exclude=save/sources/qt/build-player-Desktop-Release/chrome_config* \
    ~/.ssh \
    save \
    /media/user/1tb_opacity
    #/media/user/segate_1tb

#foo.sh /media/user/1tb_wd
#sudo foo.sh /media/user/1tb_opacity
