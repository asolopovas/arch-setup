#!/bin/sh
# ---------------------------------------------
# Samba configuration
# ---------------------------------------------
cp /home/setup/misc/smb.conf /etc/samba
systemctl enable smb.service nmb.service avahi-daemon.service
sudo smbpasswd -a $username
