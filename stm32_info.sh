bootloader instruction
http://wiki.stm32duino.com/index.php?title=Burning_the_bootloader
http://www.avislab.com/blog/stm32_st_link_ru/


В папке /arduino-1.8.7/hardware/Arduino_STM32/tools/linux нужно всем утилитам дать разрешение на запуск sudo chmod +x *

#прошиваемся
stm32flash -w flash.hex -v -g 0x0 /dev/ttyUSB4
