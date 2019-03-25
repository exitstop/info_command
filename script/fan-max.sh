#!/bin/bash
#watch -n 1 sudo perl /usr/local/bin/acer_ec.pl regs # просмотр значений 
# Переводим в ручной режим
sudo perl /usr/local/bin/acer_ec.pl := 0x93 0x14
# Выставляем куллер в максимум
sudo perl /usr/local/bin/acer_ec.pl := 0x94  0x00 # [0x93] - CPU fan: Fan mode. 0x04 Auto, 0x14 Manual
#sudo perl /usr/local/bin/acer_ec.pl := 0x93  0x4 # обратно в автоматический режим 
#sudo perl /usr/local/bin/acer_ec.pl := 0x94  0x50 # max:0x00 min:0xff 0xff-выключить совсем
