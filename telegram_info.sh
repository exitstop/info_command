# как пофиксить устновку
https://github.com/vysheng/tg/issues/1256
? sudo apt install libgcrypt20 libgcrypt20-dev
or
? sudo apt-get install libssl1.0-dev

# отключить openssl
./configure --disable-openssl

# стартануть через прокси с открытым 8888 портом для команд
proxychains bin/telegram-cli -k tg-server.pub -P 8888 -c /home/user/.config/telegram-cli/config
proxychains bin/telegram-cli -k tg-server.pub -P 8888 -c /home/user/.config/telegram-cli/config -N --permanent-msg-ids


