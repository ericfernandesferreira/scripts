#!/bin/sh

# Baixe o source
echo "sys-kernel/gentoo-sources ~amd64" >> /etc/portage/package.accept_keywords
emerge -av sys-kernel/gentoo-sources
ln -s /usr/src/linux-6.11.3-gentoo /usr/src/linux

# Baixe o genkernel
emerge -av sys-kernel/genkernel

# Copiando o fstab para poder usar o genkernel
cp /home/backup/scripts/gentoo/fstab /etc/fstab

# Para compilar o kernel
genkernel all