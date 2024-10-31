#!/bin/sh

# Baixando o source
echo "sys-kernel/gentoo-sources ~amd64" >> /etc/portage/package.accept_keywords/gentoo-sources
emerge -av sys-kernel/gentoo-sources
eselect kernel set 1
eselect kernel list

# Compilando o kernel
cp /home/backup/kernel/configs/grinder-gentoo /usr/src/linux/.config
cd /usr/src/linux
make -j17 && make modules_install && make install

# Arrumando o fstab
cp /home/backup/scripts/gentoo/fstab /etc/fstab

# Instalando o firmware
echo "sys-kernel/linux-firmware ~amd64" >> /etc/portage/package.accept_keywords/linux-firmware
emerge -av sys-kernel/linux-firmware
