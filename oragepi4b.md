# снять прошивку
sudo dd if=/dev/sdb of=backup.img

# Залить обратно
sudo dd if=backup.img of=/dev/sdb bs=4M status=progress
sudo dd if=opay_2021.15.03.img of=/dev/sdb bs=4M status=progress

# считать mbr
dd if=/dev/sda of=mbr.img bs=512 count=1
# восстановить mbr
dd if=mbr.img of=/dev/sda

#resize2fs -M xxx.img

https://github.com/econsysqtcam/qtcam/blob/master/INSTALL
4.1.3 Ubuntu 18.04
```bash
sudo apt-add-repository ppa:qtcam/bionic
sudo apt-get update
sudo apt-get install qtcam
```

xzcat Armbian_21.02.3_Orangepi4_focal_current_5.10.21.img.xz | dd of=/dev/sdb bs=4M status=progress conv=sync
sync

sudo apt install guvcview

dd if=OrangePi_4_debian_stretch_desktop_linux4.4.179_v1.4.img of=/dev/sdb bs=4M status=progress conv=sync
