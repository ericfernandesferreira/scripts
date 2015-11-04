#!/bin/sh

# Adicionando um usuario
groupadd sudo
useradd -m -G users,wheel,audio,cdrom,portage,usb,video,sudo,bin,daemon,disk,sys,input -s /bin/bash eric
passwd eric

# Instalando o sudo
# echo "dev-libs/openssl bindist" >> /etc/portage/package.use
# emerge -av app-admin/sudo

# echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
# echo "%sudo ALL=(ALL) ALL" >> /etc/sudoers
# echo "eric  gentoo = /usr/bin/emerge, /usr/bin/ebuild, /usr/sbin/emerge-webrsync" >> /etc/sudoers

# Ajeitando o bash completion para usuarios sudo
# echo "complete -cf sudo" >> /home/eric/.bashrc

env-update && source /etc/profile
