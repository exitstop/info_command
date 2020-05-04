# rk3399
gst-launch-1.0 v4l2src device=/dev/video0 io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=640,height=480 ! kmssink
sudo v4l2-ctl --list-devices
