# если ничего не помогает и ender3 на кристале Atmega 1284p 16 Mhz, не грузит boot loader и выдает ошибку  "initialization failed, rc=-1"
# чтобы прошить bootloader нужно скачать, ardino 1.0 and install this board https://github.com/JChristensen/mighty-1284p/tree/v1.6.3
# и выбираем устройство Mighty-1284p и шьем с помошью "arduino as spi"

http://marlinfw.org/docs/gcode/G029-mbl.html
#Mesh bed leveling
#G code


# serial port
dmesg | grep tty
dmesg | egrep --color 'serial|ttyS'
picocom -b 115200 /dev/ttyUSB0 --imap lfcrlf
#setserial -g /dev/ttyUSB0
#stty -F /dev/ttyUSB0 inlcr
#stty -F /dev/ttyUSB0 onlcr
#cu -l /dev/ttyUSB0 -s 115200
#screen /dev/ttyUSB0 115200
#screen /dev/ttyUSB0 115200,cs8
#minicom
#putty
#tip -115200 ttyUSB0 
