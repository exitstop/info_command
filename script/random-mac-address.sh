#!/bin/sh

# /etc/NetworkManager/dispatcher.d/pre-up.d/randomize-mac-addresses.sh

# INSTALL
#
# > curl -L 'https://gist.github.com/paulfurley/46e0547ce5c5ea7eabeaef50dbacef3f/raw/56ee5dd5f40dec93b8f7438cbdeda5475ea3b5d2/randomize-mac-addresses.sh' |sudo tee /etc/NetworkManager/dispatcher.d/pre-up.d/randomize-mac-addresses.sh
# > sudo chmod +x /etc/NetworkManager/dispatcher.d/pre-up.d/randomize-mac-addresses.sh

# Configure every saved WiFi connection in NetworkManager with a spoofed MAC
# address, seeded from the UUID of the connection and the date eg:
# 'c31bbcc4-d6ad-11e7-9a5a-e7e1491a7e20-2017-11-20'

# This makes your MAC impossible(?) to track across WiFi providers, and
# for one provider to track across days.

# For craptive portals that authenticate based on MAC, you might want to
# automate logging in :)

# Note that NetworkManager >= 1.4.1 (Ubuntu 17.04+) can do something similar
# automatically.

# See https://www.paulfurley.com/randomize-your-wifi-mac-address-on-ubuntu-1604-xenial/


export PATH=$PATH:/usr/bin:/bin

LOG_FILE=/var/log/randomize-mac-addresses

echo "$(date): $*" > ${LOG_FILE}

#WIFI_UUIDS=$(nmcli --fields type,uuid connection show |grep wifi | tr -d "wifi| ")
WIFI_UUIDS=$(nmcli --fields type,uuid connection show |grep wifi | grep -o -E '([[:xdigit:]]{3,8}-){4}[[:xdigit:]]*')

for UUID in ${WIFI_UUIDS}
do
    UUID_DAILY_HASH=$(echo "${UUID}-$(date +%F)" | md5sum)

    RANDOM_MAC="02:$(echo -n ${UUID_DAILY_HASH} | sed 's/^\(..\)\(..\)\(..\)\(..\)\(..\).*$/\1:\2:\3:\4:\5/')"

    CMD="nmcli connection modify ${UUID} wifi.cloned-mac-address ${RANDOM_MAC}"

    echo "$CMD" >> ${LOG_FILE}
    $CMD &
done

wait

#sudo service network-manager stop
#sudo ifconfig wlo1 down
#sudo macchanger --mac=02:23:45:67:89:AB wlo1
#sudo service network-manager start
#sudo ifconfig wlo1 up
