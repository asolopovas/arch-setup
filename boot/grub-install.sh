#!/bin/sh
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --recheck
sed -i -e 's/GRUB_GFXMODE=auto/GRUB_GFXMODE="1920x1080x32"/g' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
