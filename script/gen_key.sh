#!/bin/bash

ssh-keygen -t rsa -b 4096 -C "exitstop@list.ru" -f $HOME/.ssh/key/new_key
ssh-keygen -y -f new_key.pem > new_key.pub

# скопировать на сервер
# ssh-copy-id -i new_key.pub
