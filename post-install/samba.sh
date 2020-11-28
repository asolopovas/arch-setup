#!/bin/sh
# ---------------------------------------------
# Samba configuration
# ---------------------------------------------
sudo cp ../misc/smb.conf /etc/samba/
systemctl enable smb.service nmb.service avahi-daemon.service systemd-networkd-wait-online.service
sudo smbpasswd -a $username
sudo ufw allow proto udp to any port 137 from 192.168.1.0/24
sudo ufw allow proto udp to any port 138 from 192.168.1.0/24
sudo ufw allow proto tcp to any port 139 from 192.168.1.0/24
sudo ufw allow proto tcp to any port 445 from 192.168.1.0/24
