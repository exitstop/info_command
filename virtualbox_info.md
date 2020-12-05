sudo fdisk -l

sudo umount /dev/sdb1
sudo mount /dev/sdb1
sudo vboxmanage internalcommands createrawvmdk -filename  ~/usb.vmdk -rawdisk /dev/sdb1
sudo chmod 666 ~/usb.vmdk
sudo chown $USER:$USER ~/usb.vmdk
sudo usermod -a -G vboxusers $USER
sudo usermod -a -G disk $USER
