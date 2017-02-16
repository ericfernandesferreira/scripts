#!/bin/sh

# Instalando o sudo
echo "app-admin/sudo skey" >> /etc/portage/package.use
emerge -av app-shells/bash-completion app-admin/sudo

echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
echo "%sudo ALL=(ALL) ALL" >> /etc/sudoers
echo "eric  gentoo = /usr/bin/emerge, /usr/bin/ebuild, /usr/sbin/emerge-webrsync" >> /etc/sudoers

# Ajeitando o bash completion para usuarios sudo
echo "complete -cf sudo" >> /home/eric/.bashrc
echo "complete -o filenames -F _root_command sudo" >> /home/eric/.bashrc

env-update && source /etc/profile
