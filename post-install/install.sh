#!/bin/sh
# ---------------------------------------------
# Set default variables
# ---------------------------------------------
username=$1

sh /home/setup/post-install/samba.sh $username
sh /home/setup/post-install/firewall.sh
sh /home/setup/post-install/scanner-setup.sh
sh /home/setup/post-install/firewall.sh
sh /home/setup/post-install/services.sh
sh /home/setup/post-install/printer-scanner-setup.sh

