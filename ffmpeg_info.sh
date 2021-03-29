ffmpeg -y -f alsa -i default -f v4l2 -i /dev/video0 -acodec aac -strict -2 -ac 1 -b:a 64k -vcodec libx264 -b:v 300k -r 30 -g 30 prueba1.mp4
ffmpeg -y -f alsa -i default -f v4l2 -i /dev/video0 -acodec aac -strict -2 -ac 1 -b:a 64k -vcodec libx264 prueba2.mp4

ffplay -f v4l2  -i /dev/video2
ffplay -f v4l2 -input_format mjpeg -i /dev/video2

v4l2-ctl --list-formats
v4l2-ctl -d /dev/video2 --list-formats-ext

ffmpeg -i *.gif -vsync 0 temp%d.png
