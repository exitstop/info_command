# rk3399
gst-launch-1.0 v4l2src device=/dev/video0 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=640,height=480 ! kmssink
sudo v4l2-ctl --list-devices
v4l2-ctl --list-formats
v4l2-ctl -d /dev/video2 --list-formats-ext


# вывести дерево
lsusb -t
# посмотреть подробно
lsusb -s 01:5 -v

# для проверки вебкамер webcam - webcamoid
webcamoid-8.8.0-x86_64.AppImage
