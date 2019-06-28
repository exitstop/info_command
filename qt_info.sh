# cross compile qt4
https://stackoverflow.com/questions/10934683/how-do-i-configure-qt-for-cross-compilation-from-linux-to-windows-target

# cross compile qt5
https://stackoverflow.com/questions/14170590/building-qt-5-on-linux-for-windows/14170591#14170591

# dependencies
sudo apt-get install \
    autoconf \
    automake \
    autopoint \
    bash \
    bison \
    bzip2 \
    flex \
    g++ \
    g++-multilib \
    gettext \
    git \
    gperf \
    intltool \
    libc6-dev-i386 \
    libgdk-pixbuf2.0-dev \
    libltdl-dev \
    libssl-dev \
    libtool-bin \
    libxml-parser-perl \
    lzip \
    make \
    openssl \
    p7zip-full \
    patch \
    perl \
    pkg-config \
    python \
    ruby \
    sed \
    unzip \
    wget \
    xz-utils

git clone https://github.com/mxe/mxe.git
# qt4
cd mxe && make qt
# qt5
cd mxe && make qtbase
# добавить в ~/.zshrc
export PATH=<mxe root>/usr/bin:$PATH
<mxe root>/usr/i686-pc-mingw32/qt/bin/qmake && make
wine release/foo.exe
