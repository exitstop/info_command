bootloader instruction
http://wiki.stm32duino.com/index.php?title=Burning_the_bootloader
http://www.avislab.com/blog/stm32_st_link_ru/


В папке /arduino-1.8.7/hardware/Arduino_STM32/tools/linux нужно всем утилитам дать разрешение на запуск sudo chmod +x *

#прошиваемся
stm32flash -w flash.hex -v -g 0x0 /dev/ttyUSB4

sudo apt-get install minicom

# tool chain crosscompile
https://developer.arm.com/tools-and-software/embedded/arm-compiler

sudo apt -y install gcc-arm-none-eabi
# https://command-not-found.com/st-flash
sudo apt -y install stlink-tools

# tutorial by ubuntu
1. 
https://freeelectron.ro/arm-cross-compiler-tutorial-stm32/
2. led blink
https://freeelectron.ro/bare-metal-stm32-led-blink/

# 2020-11-02T00:18:18 WARN usb.c: Couldn't find any ST-Link/V2 devices
# https://stackoverflow.com/questions/23312087/error-3-opening-st-link-v2-device
sudo nvim /etc/udev/rules.d/45-usb-stlink-v2.rules

```bash
#FT232
ATTRS{idProduct}=="6014", ATTRS{idVendor}=="0403", MODE="666", GROUP="plugdev"

#FT2232
ATTRS{idProduct}=="6010", ATTRS{idVendor}=="0403", MODE="666", GROUP="plugdev"

#FT230X
ATTRS{idProduct}=="6015", ATTRS{idVendor}=="0403", MODE="666", GROUP="plugdev"

#STLINK V1
ATTRS{idProduct}=="3744", ATTRS{idVendor}=="0483", MODE="666", GROUP="plugdev"

#STLINK V2
ATTRS{idProduct}=="3748", ATTRS{idVendor}=="0483", MODE="666", GROUP="plugdev"
```
sudo service udev restart

# с чего начать изучение
https://www.youtube.com/watch?v=vZVwv-EeHkI

# защита
https://www.youtube.com/watch?v=S-fOobgttXQ
