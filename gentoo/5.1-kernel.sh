#!/bin/sh

# Baixando o source
echo "# Kernel" >> /etc/portage/package.accept_keywords
echo "sys-kernel/gentoo-sources ~amd64" >> /etc/portage/package.accept_keywords
emerge -av sys-kernel/gentoo-sources

# Compilando o kernel
cp /home/backup/kernel/configs/grinder-gentoo /usr/src/linux/.config
cd /usr/src/linux
make -j17 && make modules_install && make install

# Arrumando o fstab
cp /home/backup/scripts/gentoo/fstab /etc/fstab

# Instalando o firmware
echo "sys-kernel/linux-firmware ~amd64" >> /etc/portage/package.accept_keywords
emerge -av sys-kernel/linux-firmware
