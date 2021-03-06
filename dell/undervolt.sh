#!/bin/bash

sudo -u andrius yay -S --needed --noconfirm intel-undervolt 
conf=/etc/intel-undervolt.conf

sudo cat <<EOT > $conf
undervolt 0 'CPU' -139
undervolt 1 'GPU' -139
undervolt 2 'CPU Cache' -139
undervolt 3 'System Agent' 0
undervolt 4 'Analog I/O' 0
EOT
su -c 'systemctl enable --now intel-undervolt'
su -c 'intel-undervolt read'


