#!/bin/bash

dpkg-deb -R OpenCV-unknown-aarch64-dev.deb OpenCV-unknown-aarch64-dev
dpkg-deb -R OpenCV-unknown-aarch64-libs.deb OpenCV-unknown-aarch64-libs
dpkg-deb -R OpenCV-unknown-aarch64-licenses.deb OpenCV-unknown-aarch64-licenses
dpkg-deb -R OpenCV-unknown-aarch64-main.deb OpenCV-unknown-aarch64-main
dpkg-deb -R OpenCV-unknown-aarch64-python.deb OpenCV-unknown-aarch64-python
dpkg-deb -R OpenCV-unknown-aarch64-scripts.deb OpenCV-unknown-aarch64-scripts

a="Version: unknown"&&b="4.3.0"&& \
                grep -l "$a" `find -name "control"` | xargs sed -i "s#"$a"#"$b"#g"

dpkg-deb -b OpenCV-unknown-aarch64-dev OpenCV-unknown-aarch64-dev.deb
dpkg-deb -b OpenCV-unknown-aarch64-libs OpenCV-unknown-aarch64-libs.deb
dpkg-deb -b OpenCV-unknown-aarch64-licenses OpenCV-unknown-aarch64-licenses.deb
dpkg-deb -b OpenCV-unknown-aarch64-main OpenCV-unknown-aarch64-main.deb
dpkg-deb -b OpenCV-unknown-aarch64-python  OpenCV-unknown-aarch64-python.deb
dpkg-deb -b OpenCV-unknown-aarch64-scripts OpenCV-unknown-aarch64-scripts.deb

