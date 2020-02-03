#!/bin/bash


sudo -u "$1" yay --needed --noconfirm -S optimus-manager
cat <<EOT > /etc/optimus-manager/optimus-manager.conf
[optimus]
switching=none
pci_power_control=yes
pci_remove=yes
pci_reset=no
EOT

sudo systemctl enable optimus-manager
