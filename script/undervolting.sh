#!/bin/bash
#sudo undervolt --read
# Андервольтинг CPU
sudo undervolt --gpu -100 --core -120 --cache -120 --uncore -120 --analogio -120

#watch -n 1 sudo perl acer_ec.pl regs # просмотр значений 
#sudo perl /usr/local/bin/acer_ec.pl := 0x93  0x14 # [0x93] - CPU fan: Fan mode. 0x04 Auto, 0x14 Manual
#sudo perl /usr/local/bin/acer_ec.pl := 0x93  0x4 # обратно в автоматический режим 
#sudo perl /usr/local/bin/acer_ec.pl := 0x94  0x50 # max:0x00 min:0xff 0xff-выключить совсем


#nvidia undervolting
#https://askubuntu.com/questions/948721/nvidia-overclocking-undervolting-fanspeed-just-wont-work-on-ubuntu
nvidia-settings -c :0 -q gpus
nvidia-smi -i 0 -pl 50
nvidia-settings -c :0 -a '[gpu:0]/GPUMemoryTransferRateOffset[2]=-1000'
nvidia-settings -c :0 -a '[gpu:0]/GPUGraphicsClockOffset[2]=-99'
