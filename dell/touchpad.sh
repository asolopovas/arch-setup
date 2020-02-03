conf=/etc/X11/xorg.conf.d/30-touchpad.conf

cat <<EOT > $conf
Section "InputClass"
    Identifier "devname"
    Driver "libinput"
		Option "NaturalScrolling" "true"
		Option "Tapping" "on"
EndSection
EOT
