# прибавить звук
pactl list | grep 'Sink'
pactl -- set-sink-volume alsa_output.pci-0000_09_00.1.hdmi-stereo 50%
