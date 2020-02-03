#!/bin/sh
# DEFAULTS:

# ---------------------------------------------
# Set default variables
# ---------------------------------------------
username=$1
[ -z "$soft" ] && soft="https://raw.githubusercontent.com/asolopovas/arch-setup/master/misc/software.csv"
[ -z "$aurhelper" ] && aurhelper="yay"

if [ -z $username ]; then
  while true; do
    read -p "Username argument not present install only official packages ( yes 'default'/no )?" yn
    case $yn in
      [Nn]*) official="false"
        while true; do
          read -p "Enter username for aur package installation:" username
          case $username in
            *)
              if [ -z $username ]; then echo 'entry is empty please retry'; continue; fi
              user_exist=`awk -F':' '{ print $1 }' /etc/passwd | grep $username`
              if [ "$user_exist" = "$username" ]; then
                break; else echo "Username '$username' does not exist";
              fi
              ;;
          esac
        done
        break;;
      *) official="true"; break ;;
    esac
  done;
fi

# ---------------------------------------------
# Install Yay
# ---------------------------------------------
install_aur() {
  if [ -f "/usr/bin/$aurhelper" ]; then return; fi
  sudo -u "$username" sh -c  " pushd /tmp && git clone https://aur.archlinux.org/yay.git"
  sudo -u "$username" sh -c  "pushd /tmp/yay && makepkg -si --noconfirm"
} 

install_aur
sudo sed -i -e 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j $(nproc)"/g' /etc/makepkg.conf;

# ---------------------------------------------
# Main rero install helper
# ---------------------------------------------
install() { \
  sudo pacman --noconfirm --needed -S "$1"
}

# ---------------------------------------------
# Community repo install helper
# ---------------------------------------------
aurinstall() { \
  if [ "$official" = "true" ]; then exit 1; fi
  sudo -u "$username" $aurhelper --needed --noconfirm -S "$1"
}

# ---------------------------------------------
# Program list installer
# ---------------------------------------------
installationloop() { \
  # Copy config file
  ([ -f "$soft" ] && cp "$soft" /tmp/software.csv) || curl -Ls "$soft" | sed 1d > /tmp/software.csv


  while IFS=, read -r name description tag group; do
    if [ "$name" = "playerctl" ]; then echo $tag; fi
    case "$tag" in
      ""  ) install        "$name" ;;
      "A" ) aurinstall     "$name" ;;
      # "G") gitmakeinstall "$name" ;;
      # "P") pipinstall     "$name" ;;
    esac
  done < /tmp/software.csv;
}

installationloop

