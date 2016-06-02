#!/bin/sh

# Baixe o source
echo "sys-kernel/gentoo-sources ~amd64" >> /etc/portage/package.accept_keywords
emerge -av sys-kernel/gentoo-sources

# Baixe o genkernel
emerge -av sys-kernel/genkernel

# Copiando o fstab para poder usar o genkernel
cp /home/backup/scripts/gentoo/fstab /etc/fstab

# Para compilar o kernel
genkernel all
