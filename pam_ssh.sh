#!/bin/bash

sudo pacman -U ~/Git/arch-setup/misc/pam_ssh-2.3-1-x86_64.pkg.tar.xz

sudo bash -c 'cat <<EOT > /etc/pam.d/login
#%PAM-1.0

auth       required     pam_securetty.so
auth       requisite    pam_nologin.so
auth       include      system-local-login
auth       optional     pam_ssh.so        try_first_pass
auth       optional     pam_gnome_keyring.so
account    include      system-local-login
session    include      system-local-login
session    optional     pam_ssh.so
session    optional     pam_gnome_keyring.so auto_start
EOT'
