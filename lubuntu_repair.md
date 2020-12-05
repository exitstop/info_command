sudo fdisk -l
sudo blkid

sudo mkdir /mnt/ubuntu

PART=/dev/nvme0n1p2

sudo mount $PART /mnt/ubuntu
sudo grub-install --boot-directory=/mnt/ubuntu/boot $PART
sudo umount /mnt/ubuntu

sudo ln /dev/nvme0n1 /dev/sdd
sudo ln /dev/nvme0n1p1 /dev/sdd1
sudo ln /dev/nvme0n1p2 /dev/sdd2

sudo mount /dev/nvme0n1p2 /mnt #sda1 is `boot` partition
sudo chroot /mnt
<!--pacman -S os-prober-->
grub-install /dev/nvme0n1
grub-mkconfig -o /boot/grub/grub.cfg
exit
reboot

#!/bin/bash

sudo mkdir /mnt/boot-sav/nvme0n1p2
sudo mount /dev/nvme0n1p2 /mnt/boot-sav/nvme0n1p2

sudo chroot "/mnt/boot-sav/nvme0n1p2" dpkg --configure -a
sudo chroot "/mnt/boot-sav/nvme0n1p2" apt-get install -fy
sudo chroot "/mnt/boot-sav/nvme0n1p2" apt-get purge -y grub*-common shim-signed
sudo chroot "/mnt/boot-sav/nvme0n1p2" apt-get install -y grub-efi-amd64-signed shim-signed linux-headers-generic linux-signed-generic
