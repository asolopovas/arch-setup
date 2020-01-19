#!/bin/bash

# ---------------------------------------------
# NVim configuration
# ---------------------------------------------
curl -fLo /usr/share/nvim/runtime/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s /usr/bin/nvim /bin/vim
ln -s /usr/bin/nvim /bin/e
mkdir -p /root/.config/nvim
