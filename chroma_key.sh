https://kdenlive.org/en/download/
https://www.youtube.com/watch?v=l43Hz7YEcYU

https://forum.kde.org/viewtopic.php?f=270&t=116693

http://lea.hamradio.si/~s57uuu/video/keyspillm0pup.c
http://lea.hamradio.si/~s57uuu/video/frei0r_keyspillm0pup.xml

```
wget http://lea.hamradio.si/~s57uuu/video/keyspillm0pup.c
wget http://lea.hamradio.si/~s57uuu/video/frei0r_keyspillm0pup.xml

gcc -c -fPIC -Wall keyspillm0pup.c -o keyspillm0pup.o
gcc -shared -o keyspillm0pup.so keyspillm0pup.o

sudo cp keyspillm0pup.so /usr/lib/frei0r-1
sudo cp frei0r_keyspillm0pup.xml /usr/share/kdenlive/effects
