#!/bin/sh

# ---------------------------------------------
# Set default variables
# ---------------------------------------------
username=$1

# ---------------------------------------------
# Display Driver
# ---------------------------------------------
nvidia-xconfig

# ---------------------------------------------
# System
# ---------------------------------------------
# Lightdm theme
sed -i -e 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-slick-greeter/g' /etc/lightdm/lightdm.conf
# Change Reboot Timeout
sed -i -e 's/#DefaultTimeoutStartSec=90s/DefaultTimeoutStartSec=10s/g' /etc/systemd/system.conf
sed -i -e 's/#DefaultTimeoutStopSec=90s/DefaultTimeoutStopSec=10s/g' /etc/systemd/system.conf
systemctl enable lightdm.service

# ---------------------------------------------
# Oh-My-Zsh
# ---------------------------------------------
git clone htts://github.com/robbyrussel/oh-my-zsh /usr/share/oh-my-zsh

# ---------------------------------------------
# Mdadm service fix
# ---------------------------------------------
cp -f misc/mdadm/mdadm_env.sh /usr/lib/systemd/scripts
cp -f misc/mdadm/mdmonitor.service /usr/lib/systemd/system
cp -f misc/mdadm/mdadm /etc/conf.d

# ---------------------------------------------
# Set default program for torrent magnets
# ---------------------------------------------
gio mime x-scheme-handler/magnet qbittorrent.desktop

# ---------------------------------------------
# Change default shell to zsh
# ---------------------------------------------
chsh -s $(which zsh) root
chsh -s $(which zsh) $username

# Dolphin Service Menus (Context)
mkdir -p "/home/$username/.local/share/kservices5"
cp -fr misc/kdeservices "/home/$username/.local/share/kservices5"

# fstabs
sudo mkdir -p "/run/media/$username/c"
sudo mkdir -p "/run/media/$username/d"

# ---------------------------------------------
# NVim configuration
# ---------------------------------------------
curl -fLo /usr/share/nvim/runtime/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s /usr/bin/nvim /bin/vim
ln -s /usr/bin/nvim /bin/e
mkdir -p /root/.config/nvim
git clone https://github.com/asolopovas/dotfiles.git "/home/$username/tmp/dotfiles"
cp -r "/home/$username/tmp/dotfiles/." "/home/$username"
cp -r "/home/$username/tmp/dotfiles/.config/nvim" /root/.config
chown -R $username:$username "/home/$username"
rm -rf "/home/$username/tmp"

# ---------------------------------------------
# Phpstorm adjustments
# ---------------------------------------------
sed -i -e 's/-Didea.jre.check=true//g' /usr/bin/phpstorm

# ---------------------------------------------
# Docker Configurations
# ---------------------------------------------
usermod -aG docker andrius

# ---------------------------------------------
# G9X Mouse Accellartation
# ---------------------------------------------
cp misc/mouse-accelleration.conf /etc/X11/xorg.conf.d/99-libinput-custom-config.conf

# ---------------------------------------------
# Enable Services
# ---------------------------------------------
systemctl enable NetworkManager.service
systemctl enable teamviewerd.services
systemctl enable org.cups.cupsd.service
systemctl enable ntpd
