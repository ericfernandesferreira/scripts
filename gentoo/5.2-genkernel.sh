#!/bin/sh

# Baixe o source
emerge --ask sys-kernel/gentoo-sources

# Baixe o genkernel
emerge --ask sys-kernel/genkernel

# Copiando o fstab para poder usar o genkernel
cp /home/backup/scripts/gentoo/fstab /etc/fstab

# Para compilar o kernel
genkernel all
