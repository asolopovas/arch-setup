#!/bin/bash

loadkeys uk

# Mirror List
curl -s 'https://www.archlinux.org/mirrorlist/?country=GB&protocol=https&use_mirror_status=on' | sed -e 's/^#Server/Server/' -e '/^#/d' > /etc/pacman.d/mirrorlist

# Grub fix
mkdir /mnt/hostlvm
mount --bind /run/lvm /mnt/hostlvm

# Install arch base packages
pacstrap /mnt base base-devel git neovim grub linux-firmware
ln -sf /usr/bin/nvim /usr/bin/vim

# Generate fstab
genfstab -U /mnt >> /mnt/etc/fstab

#arch-chroot /mnt /bin/sh -c 'git clone https://github.com/asolopovas/arch-setup.git /home/setup'
#arch-chroot /mnt /bin/sh -c '/home/setup/init.sh'

