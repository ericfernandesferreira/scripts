#!/bin/sh

# Baixando o source
echo "sys-kernel/gentoo-sources ~amd64" >> /etc/portage/package.accept_keywords
emerge --ask sys-kernel/gentoo-sources

# Compilando o kernel
cp /home/backup/kernel/configs/grinder-gentoo /usr/src/linux/.config
cd /usr/src/linux
make CFLAGS='"-march=haswell -O2 -pipe"' -j5 && make modules_install && make install

# Arrumando o fstab
cp /home/backup/scripts/gentoo/fstab /etc/fstab

# Instalando o firmware
emerge --ask sys-kernel/linux-firmware
