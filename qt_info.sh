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


# pipe qt эмитируем команную строку ниже
# cat wav.wav | ffmpeg -hide_banner -loglevel quiet -i - -f wav - | ffplay -i - -nodisp -autoexit -loglevel quiet
{
    QProcess *P = new QProcess();
    QProcess *P2 = new QProcess();
    P->setReadChannelMode(QProcess::MergedChannels);
    P->setStandardOutputProcess(P2);
    // cat wav.wav | ffmpeg -hide_banner -loglevel quiet -i - -f wav - | ffplay -i - -nodisp -autoexit -loglevel quiet
    // QString path_extern_player = "/mnt/hard_drive/home/user/Documents/save/sources/qt/build-player-Desktop-Release/extern-player";
    P->start("ffmpeg", QStringList() << "-hide_banner" <<  "-loglevel" << "quiet" << "-i" << "-" << "-f" << "wav"  << "-" , QProcess::ReadWrite);
    P->start("mplayer", QStringList() << "-af" <<  "scaletempo" << "-speed" << "2.1" << "-" , QProcess::ReadWrite);
    P->write(dataForPlay);
    P2->start("ffplay", QStringList() << "-i" << "-" << "-nodisp" << "-autoexit" << "-loglevel" << "quiet"  , QProcess::ReadWrite);

    P->closeWriteChannel();
    P->waitForFinished();
    qDebug() << "Stop1";
    P2->waitForFinished();
    //QTextCodec *Cp866 = QTextCodec::codecForName("IBM 866");
    //qDebug() << Cp866->toUnicode(P->readAllStandardOutput());
}

# qt static
https://dimitris.apeiro.gr/2015/06/24/build-a-static-qt5-for-windows-by-compiling/

windeployqt --quick .

cmd /c "configure.bat -static -debug-and-release -platform win32-g++ -prefix C:\Qt\Qt5_static -qt-zlib -qt-pcre -qt-libpng -qt-libjpeg -qt-freetype  -qtquickcontrols -qtquickcontrols2 -opengl desktop  -no-openssl -opensource -confirm-license -make libs -nomake tools -nomake examples -nomake tests"

cd C:\Qt\Qt5.14.1\5.14.1\Src\qtdeclarative

C:\Qt\Qt5.7.0n\bin\qmake.exe -r qtdeclarative.pro
C:\mingw32-make.exe
C:\mingw32-make.exe install

# Построить проект статичестки
C:\Qt\Qt5_static\bin\qmake.exe gallery.pro -spec win32-g++ "CONFIG+=qtquickcompiler"
mingw32-make.exe -j6
# C:\Qt\Qt5_static\bin\qmake.exe Z:\Qt\Examples\Qt-5.14.1\quickcontrols\extras\gallery\gallery.pro -spec win32-g++ "CONFIG+=qtquickcompiler" && C:/Qt/Qt5.14.1/Tools/mingw730_64/bin/mingw32-make.exe qmake_all
# C:\Qt\Qt5_static\bin\qmake.exe Z:\Qt\Examples\Qt-5.14.1\quickcontrols\extras\gallery\gallery.pro -spec win32-g++ "CONFIG+=qtquickcompiler" && C:\Qt\Qt5_static\bin\qmake.exe qmake_all

################################################################################
############################# QT STATIC ########################################
################################################################################
# QT STATIC !!!!
# Видео как билдить qt static windows
https://www.youtube.com/watch?v=lwX_urJJOf8
https://www.riuson.com/blog/post/qt-static-build-on-windows-with-mingw
https://wohlsoft.ru/pgewiki/Building_static_Qt_5#Windows
https://habr.com/ru/sandbox/95171/

# docker
https://github.com/therecipe/qt/wiki/Deploying-Linux-to-Windows-64-bit-Static
https://github.com/therecipe/qt/wiki/Getting-Started

http://www.tripleboot.org/?p=138
https://wiki.qt.io/Build_Standalone_Qt_Application_for_Windows
https://github.com/fffaraz/docker-qt


# qt static QT STATIC cross compile
https://github.com/therecipe/qt/wiki/Deploying-Linux-to-Windows-64-bit-Static

/usr/lib/mxe/usr/x86_64-w64-mingw32.static/qt5/bin/qmake ..
make -j$(nproc)

/usr/lib/mxe/usr/x86_64-w64-mingw32.static/qt5/bin/qmake ../gallery.pro -spec win32-g++ "CONFIG+=qtquickcompiler"

C:\Qt\Qt5.14.1\5.14.1\mingw73_64\bin\windeployqt.exe --dir Z:\Qt\Examples\Qt-5.14.1\quickcontrols\extras\build-gallery-Desktop_Qt_5_14_1_MinGW_64_bit-Release --no-translations gallery.exe
C:\Qt\Qt5.14.1\5.14.1\mingw73_64\bin\windeployqt.exe --no-translations gallery.exe
