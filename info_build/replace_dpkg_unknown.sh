#!/bin/bash

# CPackConfig.cmake
# CPackSourceConfig.cmake
# SET(CPACK_PACKAGE_VERSION "4.3.0")

NAME=OpenCV-unknown-aarch64
VERSION=4.3.0
NAME_NEW=OpenCV-$VERSION-aarch64

rm -rf $NAME-dev
rm -rf $NAME-libs
rm -rf $NAME-licenses
rm -rf $NAME-main
rm -rf $NAME-python
rm -rf $NAME-scripts

dpkg-deb -R $NAME-dev.deb $NAME-dev
dpkg-deb -R $NAME-libs.deb $NAME-libs
dpkg-deb -R $NAME-licenses.deb $NAME-licenses
dpkg-deb -R $NAME-main.deb $NAME-main
dpkg-deb -R $NAME-scripts.deb $NAME-scripts
dpkg-deb -R $NAME-python.deb $NAME-python


a="Version: unknown"&&b="Version: $VERSION"&& \
                grep -l "$a" `find -name "control"` | xargs sed -i "s#$a#$b#g"


dpkg-deb -b $NAME-dev $NAME_NEW-dev.deb
dpkg-deb -b $NAME-libs $NAME_NEW-libs.deb
dpkg-deb -b $NAME-licenses $NAME_NEW-licenses.deb
dpkg-deb -b $NAME-main $NAME_NEW-main.deb
dpkg-deb -b $NAME-scripts $NAME_NEW-scripts.deb
dpkg-deb -b $NAME-python  $NAME_NEW-python.deb

rm -rf $NAME-dev
rm -rf $NAME-libs
rm -rf $NAME-licenses
rm -rf $NAME-main
rm -rf $NAME-python
rm -rf $NAME-scripts

rm $NAME-dev.deb
rm $NAME-libs.deb
rm $NAME-licenses.deb
rm $NAME-main.deb
rm $NAME-python.deb
rm $NAME-scripts.deb
