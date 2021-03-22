# снять прошивку
sudo dd if=/dev/sdb of=backup.img

# Залить обратно
sudo dd if=backup.img of=/dev/sdb

# считать mbr
dd if=/dev/sda of=mbr.img bs=512 count=1
# восстановить mbr
dd if=mbr.img of=/dev/sda
