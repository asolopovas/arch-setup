#!/bin/bash

# ---------------------------------------------
# Fix Boot Loader
# ---------------------------------------------
ln -s /hostlvm /run/lvm

# ---------------------------------------------
# Update system packages
# ---------------------------------------------
pacman --noconfirm -Syu

# ---------------------------------------------
# Grub loader
# ---------------------------------------------
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --recheck
sed -i -e 's/GRUB_GFXMODE=auto/GRUB_GFXMODE="1920x1080x32"/g' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

# ---------------------------------------------
# User Account Setup
# ---------------------------------------------
echo -n "Enter your name and press [ENTER]: "
read username

$displayname=${username^}

while true; do
    read -p "Does user have existing folder [yes/no]" yn
    case $yn in
        [Yy]*) useradd -d "/home/$username" -c "$displayname"  -G wheel $username
               chown -R "$username:$username" "/home/$username"
               passwd $username
          break;;
        [Nn]*) useradd -mG wheel $username;
               passwd $username
          break;;
        *)     echo "Please answer yes or no.";;
    esac
done

# ---------------------------------------------
# Administrative Settings
# ---------------------------------------------
# Add wheel group users to sudoers
sed -i -e 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers
# Disable password request for administrative tasks
echo '%wheel ALL=(ALL) NOPASSWD: /usr/bin/shutdown,/usr/bin/reboot,/usr/bin/mount,/usr/bin/umount,/usr/bin/pacman -Syu,/usr/bin/pacman -Syyu,/usr/bin/pacman -Syyu --noconfirm,/usr/bin/yay -Syu,/usr/bin/yay -Syyu' >> /etc/sudoers
# Disable root request for additional terminals
echo 'Defaults !tty_tickets' >> /etc/sudoers

# ---------------------------------------------
# Initial Configurations
# ---------------------------------------------
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
sed -i -e 's/#en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/g' /etc/locale.gen
echo "LANG=en_GB.UTF-8" >> /etc/locale.conf
echo "KEYMAP=uk" >> /etc/vconsole.conf
echo "main-linux-host" >> /etc/hostname
echo "127.0.0.1     localhost" >> /etc/hosts
echo "::1           localhost" >> /etc/hosts

echo "Please set root password:"
passwd

# ---------------------------------------------
# Time and Date
# ---------------------------------------------
locale-gen
hwclock --systohc
# Match windows and linux time
export LANGUAGE=en_GB.UTF-8
systemctl enable systemd-timesyncd.service
timedatectl set-ntp true

# ---------------------------------------------
# Install Software
# ---------------------------------------------
#sh /home/setup/soft.sh $username
#sh /home/setup/config.sh $username
