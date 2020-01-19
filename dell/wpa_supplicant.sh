#!/bin/bash
conf=/etc/wpa_supplicant/wpa_supplicant.conf

touch $conf
cat <<EOT > $conf
	ctrl_interface=/run/wpa_supplicant
	update_config=1
EOT

wpa_supplicant -B -i wlp59s0 -c $conf

