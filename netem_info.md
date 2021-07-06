```
sudo tc qdisc

sudo tc qdisc delete dev wlo1 root
sudo tc qdisc add dev wlo1 root netem delay 50ms 50ms loss 50% rate 50kbit
sudo tc qdisc add dev wlo1 root netem limit 12500 slot 75ms 200ms packets 1

sudo modprobe sch_netem

sudo tc qdisc delete dev eth0 root
sudo tc qdisc add dev eth0 root netem delay 50ms 50ms loss 50% rate 50kbit
```
