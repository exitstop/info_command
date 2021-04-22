ffmpeg -y -f alsa -i default -f v4l2 -i /dev/video0 -acodec aac -strict -2 -ac 1 -b:a 64k -vcodec libx264 -b:v 300k -r 30 -g 30 prueba1.mp4
ffmpeg -y -f alsa -i default -f v4l2 -i /dev/video0 -acodec aac -strict -2 -ac 1 -b:a 64k -vcodec libx264 prueba2.mp4

ffplay -f v4l2  -i /dev/video10
#ffplay -f v4l2 -framerate 30 -video_size 1280x720  -input_format mjpeg -i /dev/video10
#ffplay -f v4l2 -framerate 30 -video_size 1280x720  -input_format mjpeg -i /dev/video10
ffplay -f v4l2 -framerate 30 -video_size 1920x1080  -input_format mjpeg -i /dev/video2
ffplay -f v4l2 -framerate 30 -video_size 1920x1080  -i /dev/video2
ffplay -f v4l2 -framerate 10 -video_size 1280x720  -i /dev/video2
ffplay -f v4l2 -framerate 10 -video_size 1280x720  -input_format mjpeg -i /dev/video2
ffplay -f v4l2 -framerate 20 -video_size 960x540 -i /dev/video2
ffplay -f v4l2 -framerate 20 -video_size 800x600 -i /dev/video2

ffplay -f v4l2 -framerate 30 -video_size 1920x1080  -fflags nobuffer -input_format mjpeg -i /dev/video2
ffplay -f v4l2 -framerate 30 -video_size 1920x1080   -input_format mjpeg -i /dev/video2

ffplay -f v4l2 -framerate 25 -video_size 1280x720  -input_format mjpeg -i /dev/video2

v4l2-ctl -d /dev/video2 --all
v4l2-ctl --list-formats
v4l2-ctl -L
v4l2-ctl -d /dev/video2 --list-formats-ext

ffmpeg -i *.gif -vsync 0 temp%d.png

#low cpu usage
https://www.youtube.com/watch?v=7EwTMQ3nyNY
