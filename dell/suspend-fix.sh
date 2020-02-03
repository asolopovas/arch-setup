#!/bin/bash
sed -ie 's/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"/GRUB_CMDLINE_LINUX_DEFAULT="mem_sleep_default=deep loglevel=3 quiet"/g' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
