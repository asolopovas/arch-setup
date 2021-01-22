#!/bin/bash

sudo bash -c 'cat <<EOT > /etc/X11/xorg.conf.d/99-libinput-mouse.conf
Section "InputClass"
  Identifier "Mouse"
  MatchIsPointer "yes"
  Option "AccelSpeed" "1"
EndSection
EOT'
