sudo nmcli device wifi hotspot con-name my-hotspot ssid my-hotspot band bg password jesuisunmotdepasse

sudo nmcli device set wlan0 autoconnect yes

sudo nmcli connection add type wifi ifname '*' con-name my-hotspot autoconnect yes ssid wifi-name
sudo nmcli connection modify my-hotspot ipv4.method auto
sudo nmcli connection modify my-hotspot 802-11-wireless-security.key-mgmt wpa-psk 802-11-wireless-security.psk password
sudo nmcli connection up my-hotspot
