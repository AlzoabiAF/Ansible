#!/bin/bash

apt update
apt install -y python3

if [[ $1 == 'manager' ]]; then   
    apt install -y ansible

fi

echo "ChallengeResponseAuthentication yes" | cat - /etc/ssh/sshd_config | tee /etc/ssh/sshd_config > /dev/null
(sleep 5; sudo systemctl restart sshd) &
