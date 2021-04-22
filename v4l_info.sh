sudo  apt-get install  v4l-utils

v4l2-ctl --all
#Lists much information about the available sensors.
v4l2-ctl --list-devices
#Shows a list of device accessors at /dev/, for example /dev/video0.
v4l2-ctl -d /dev/video0 --list-formats
v4l2-ctl -d /dev/video0 --list-formats-ext

v4l2-ctl  -d /dev/video10  --set-ctrl gain=24
v4l2-ctl  -d /dev/video10  -L


v4l2-ctl  -d /dev/video10  --set-ctrl brightness=0
v4l2-ctl  -d /dev/video10  --set-ctrl contrast=48
v4l2-ctl  -d /dev/video10  --set-ctrl saturation=64
v4l2-ctl  -d /dev/video10  --set-ctrl power_line_frequency=0

v4l2-ctl -d /dev/video10 --set-ctrl exposure=2000
v4l2-ctl -d /dev/video10 -c exposure=2000

v4l2-ctl -d /dev/video2 --set-ctrl exposure_auto=1
v4l2-ctl -d /dev/video2 --set-ctrl exposure_absolute=500
v4l2-ctl -d /dev/video2 --set-ctrl sharpness=50

#low cpu usage
https://www.youtube.com/watch?v=7EwTMQ3nyNY
