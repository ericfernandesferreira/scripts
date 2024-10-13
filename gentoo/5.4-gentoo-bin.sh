#!/bin/sh

# Baixe o kernel compilado
emerge -av sys-kernel/gentoo-kernel-bin
emerge -av sys-kernel/installkernel

# Baixe o kernel source
echo "sys-kernel/gentoo-sources ~amd64" >> /etc/portage/package.accept_keywords/gentoo-sources
echo "sys-kernel/linux-firmware ~amd64" >> /etc/portage/package.accept_keywords/linux-firmware
emerge -av sys-kernel/gentoo-sources

# Copiando o fstab para poder usar o genkernel
cp /home/backup/scripts/gentoo/fstab /etc/fstab
