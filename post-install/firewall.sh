#!/bin/sh
# ---------------------------------------------
# Firewall
# ---------------------------------------------
sudo ufw enable
sudo systemctl enable ufw.service

# Open ports for Samba
sudo ufw allow ssh
sudo ufw allow proto tcp to any port 137 from 192.168.0.0/24
sudo ufw allow proto tcp to any port 138 from 192.168.0.0/24
sudo ufw allow proto tcp to any port 139 from 192.168.0.0/24
sudo ufw allow proto tcp to any port 445 from 192.168.0.0/24

# Open teamviewer ports
sudo ufw allow proto tcp to any port 5938 from 192.168.0.0/24
# ipp
sudo ufw allow proto tcp to any port 631 from 192.168.0.0/24
# sane
sudo ufw allow proto tcp to any port 6566 from 192.168.0.0/24


