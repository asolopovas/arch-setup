#!/bin/bash
sudo cp disable-mouse-wakeup.service /etc/systemd/system/
sudo systemctl enable --now disable-mouse-wakeup.service
