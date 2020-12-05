# https://www.lua.org/download.html
curl -R -O http://www.lua.org/ftp/lua-5.4.1.tar.gz
tar zxf lua-5.4.1.tar.gz
cd lua-5.4.1
make all test

sudo luarocks install luasocket
