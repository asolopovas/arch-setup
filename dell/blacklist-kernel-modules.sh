#!/bin/bash

cat << EOT > /etc/modprobe.d/blacklist.conf
blacklist nouveau
blacklist rivafb
blacklist nvidiafb
blacklist rivatv
blacklist nv
EOT
