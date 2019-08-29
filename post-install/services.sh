#!/bin/sh
# ---------------------------------------------
# Display Profile
# ---------------------------------------------
autorandr -s default
autorandr -d default
systemctl --now enable autorandr.service
