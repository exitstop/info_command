#!/bin/bash
#watch -n 1 sudo perl acer_ec.pl regs # просмотр значений 
#sudo perl /usr/local/bin/acer_ec.pl := 0x93  0x14 # [0x93] - CPU fan: Fan mode. 0x04 Auto, 0x14 Manual
# Возвращаем куллер в автоматический режим
sudo perl /usr/local/bin/acer_ec.pl := 0x93  0x4 # обратно в автоматический режим 
#sudo perl /usr/local/bin/acer_ec.pl := 0x94  0x50 # max:0x00 min:0xff 0xff-выключить совсем
