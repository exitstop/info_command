#convert outresize.jpg -channel alpha -fx @/home/user/Documents/save/sources/info_command/imagemagick/hsl-greenscreen.fx out_without_key.png

#magick convert outresize.jpg  -colorspace HSL -channel Hue,Saturation -separate +channel ( -clone 0 -background none -fuzz 7% -transparent #575757 )  ( -clone 1 -background none -fuzz 0% -transparent #4a4a4a ) -delete 0,1  -alpha extract  -compose multiply -composite  mask.png

#http://www.fmwconcepts.com/imagemagick/greenscreen/index.php
convert IMG_5234.JPG -resize 900 outresize.jpg
greenscreen -t 22 -a 2000 -s 0 -A 2 -b none IMG_5234.JPG output.png
greenscreen -t 40 -a 2000 -s 0 -A 2 -b none outresize.jpg output.png
greenscreen -t 12 -a 2000 -s 0 -A 2 -b none outresize.jpg output.png


#greenscreen -t 12 -a 1000 -s 0 -A 2 -b none outresize.jpg output.png

convert IMG_5197.JPG -resize 900 place.jpg
