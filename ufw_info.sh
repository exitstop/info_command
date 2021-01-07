# https://www.digitalocean.com/community/tutorials/how-to-setup-a-firewall-with-ufw-on-an-ubuntu-and-debian-cloud-server

```bash
sudo apt-get install ufw
sudo ufw status

sudo ufw disable
sudo ufw enable

# Запретить входящие
sudo ufw default deny incoming
# Разрешить исходящие
sudo ufw default allow outgoing

sudo ufw allow ssh
sudo ufw allow 22/tcp

# range
sudo ufw allow 1000:2000/tcp
sudo ufw allow 1000:2000/udp

# 
sudo ufw allow from 192.168.255.255

# Запретить
sudo ufw deny 80/tcp

# Удалить
sudo ufw delete allow ssh
sudo ufw delete allow 80/tcp
sudo ufw delete allow 1000:2000/tcp

# Удалить по номеру
sudo ufw status numbered
sudo ufw delete [number]
```

# сбросить правила
sudo ufw reset
