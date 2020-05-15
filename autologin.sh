#!/bin/bash

sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/
sudo touch /etc/systemd/system/getty@tty1.service.d/autologin.conf
sudo bash -c 'cat <<EOT >> /etc/systemd/system/getty@tty1.service.d/autologin.conf
[Service]
ExecStart=
ExecStart=-/sbin/agetty --skip-login --login-options=andrius 38400 tty1 linux
EOT'
