#!/bin/bash

conf=$HOME/.config/systemd/user/xbacklightmon.service

mkdir -p $HOME/.config/systemd/user/
touch $conf && chmod +x $conf

cat <<EOT > $conf
[Unit]
Description=Ugly fix to be able to control the brightness of OLED screens via keyboard brightness
After=multi-user.target

[Service]
Type=simple
ExecStart=$HOME/.local/bin/xbacklightmon
Restart=on-failure
RestartSec=1

[Install]
WantedBy=default.target
EOT

systemctl --user enable --now xbacklightmon.service

