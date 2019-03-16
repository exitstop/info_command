# Установка
sudo apt-get install libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa  gstreamer1.0-pulseaudio

# hello world
gst-launch-1.0 videotestsrc ! ximagesink
gst-launch-1.0 v4l2src ! xvimagesink

# ffmpeg stream example
# https://trac.ffmpeg.org/wiki/StreamingGuide
ffmpeg -re -f lavfi -i aevalsrc="sin(400*2*PI*t)" -ar 8000 -f mulaw -f rtp rtp://127.0.0.1:1234
ffplay rtp://127.0.0.1:1234


# ~ 800 Kbit/s 
ffmpeg -i ~/Downloads/dream.mp4 -framerate 20 -vf scale=640:480 -vcodec libx264 -f mpegts udp://127.0.0.1:1234
# ~ 300 Kbit/s 
ffmpeg -i ~/Downloads/dream.mp4 -vf scale=640:480 -vcodec libx264 -r 10 -b 50k -ar 22050 -f mpegts udp://127.0.0.1:1234
# ~ 130 Kbit/s
ffmpeg -i ~/Downloads/dream.mp4 -vf scale=640:480 -vcodec libx264 -r 10 -async 1 -acodec libmp3lame  -b 50k -ar 22050 -f mpegts udp://192.168.0.150:5555
# не кешировать плеер для онлайн трансляции
ffplay udp://127.0.0.1:6666 -fflags nobuffer
ffplay udp://192.168.0.150:6666 -fflags nobuffer  -probesize 32 -sync ext

# переадресуем порт udp на другой порт udp
socat -T15 udp4-recvfrom:5555,reuseaddr,fork udp:192.168.0.102:6666
# переадресуем порт tcp на другой порт udp
socat tcp4-listen:5555,reuseaddr,fork udp:192.168.0.102:6666

# отключить энергосбережение
iwconfig wlan0 power off

# stream screen
ffmpeg -video_size 1024x768 -framerate 10 -f x11grab -i :0.0+100,200 -f pulse -ac 2 -f mpegts udp://192.168.0.150:5555
ffmpeg -video_size 1024x768 -framerate 10 -f x11grab -i :0.0+100,200 -vcodec libx264 -async 1 -acodec libmp3lame -ar 22050 -bufsize 300k  -f mpegts udp://192.168.0.150:5555
# zerolatency
ffmpeg -video_size 1024x768 -framerate 10 -f x11grab -i :0.0+100,200 -preset ultrafast -tune zerolatency -vcodec libx264 -async 1 -acodec libmp3lame -ar 22050  -f mpegts udp://192.168.0.150:5555

# сделать стерео видео из одного
ffmpeg -i ~/Downloads/dream.mp4 -i ~/Downloads/dream.mp4 -filter_complex "pad=in_w*2:in_h, overlay=main_w/2:0, scale=in_w/2:in_h, scale=-1:540" -vcodec libx264 -r 10 -async 1 -acodec libmp3lame  -b 50k -ar 22050 -f mpegts udp://192.168.0.110:6666


# Полный цикл стрима
# на машине создающей стрим
ffmpeg -i ~/Downloads/dream.mp4 -vf scale=640:480 -vcodec libx264 -r 10 -async 1 -acodec libmp3lame  -b 50k -ar 22050 -f mpegts udp://192.168.0.150:5555
# на машине ретрансляторе
socat -T15 udp4-recvfrom:5555,reuseaddr,fork udp:192.168.0.110:6666
# на машине получателе
ffplay udp://192.168.0.110:6666 -fflags nobuffer

