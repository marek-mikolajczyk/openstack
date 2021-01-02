#!/bin/bash -x

echo "ENABLE PASSWORD SSH"
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config