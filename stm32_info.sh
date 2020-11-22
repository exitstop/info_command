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

# stm32 to linux atolic
https://atollic.com/resources/download/linux/linux-archive/?submissionGuid=e4e4689c-0e7f-445e-acb3-95c9d3616cc5

tar -xvf ~/Downloads/Atollic_TrueSTUDIO_for_STM32_linux_x86_64_v9.3.0_20190212-0734.tar.gz
cd Atollic_TrueSTUDIO_for_STM32_9.3.0_installer && sudo ./install.sh
d /opt/Atollic_TrueSTUDIO_for_STM32_9.3.0/ide && ./TrueSTUDIO
# Урок
https://www.youtube.com/watch?v=FmT1x3PHldk

sudo stm32flash -w HelloWorld.elf -v -g 0x0 /dev/ttyS0

st-flash write HelloWorld.elf 0x8000000

# gdb arm-eabi-gdb
https://stackoverflow.com/questions/53450745/message-unable-to-run-arm-none-eabi-gdb-cannot-find-libncurses-so-5

```bash
sudo apt-get install build-essential libncurses5-dev libexpat1-dev texinfo-doc-nonfree
pushd /tmp
wget -qO- ftp://ftp.gnu.org/gnu/gdb/gdb-8.2.tar.xz | tar Jxv
mkdir gdb
cd gdb
../gdb-8.2/configure  --enable-tui --with-expat --prefix=/usr/local  --target=arm-eabi --program-prefix=arm-eabi-
make all
sudo make  install
popd
```

# https://community.st.com/s/question/0D50X0000BTd7Zi/how-to-deal-wirh-could-not-verify-st-device-
https://community.st.com/s/question/0D50X0000BTd7Zi/how-to-deal-wirh-could-not-verify-st-device-

```
/opt/st/stm32cubeide_1.4.0/plugins/com.st.stm32cube.ide.mcu.debug.openocd_1.4.0.202007081208/resources/openocd/st_scripts/target/stm32f1x.cfg

Debug Configurations установить Debug Probe = ST-LINK(OpenOCD)

Вместо этого сделайте следующее: >>

В файле stm32f1x.cfg найдите командную строку (около строки 62), начинающуюся с: swj_newdap
В конце этой командной строки вы увидите: -expected-id $ _CPUTAPID
Просто измените его на: -expected-id 0
Ноль указывает OpenOCD игнорировать идентификационные номера, что означает, что все клоны или подлинные MCU будут работать.

Сохраните изменения. Теперь ваша прошивка и отладка должны работать.
```

```bash
#define  TICK_INT_PRIORITY            0x0FU /*!< tick interrupt priority */
uint32_t HAL_GetTick(void) {
    return TIM2->CNT; // or TIM5->CNT
}
```

# st link v2 + swo для вывода отладки
https://habr.com/ru/post/402927/

# nrf24 tutorial
https://istarik.ru/blog/stm32/127.html
