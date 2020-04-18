sudo netstat -tulpn | grep :53
sudo killall dnsmasq
sudo systemctl stop systemd-resolved 
sudo ./dnschef.py --interface 0.0.0.0 -q --nameservers 8.8.8.8
