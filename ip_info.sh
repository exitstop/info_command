# разрешить програаме работать через определенный интерфейс
https://unix.stackexchange.com/questions/210982/bind-unix-program-to-specific-network-interface

# metric приоритет
nmcli connection
sudo nmcli connection modify "Wired connection 1" ipv4.route-metric 102
nmcli connection up "Wired connection 1"
