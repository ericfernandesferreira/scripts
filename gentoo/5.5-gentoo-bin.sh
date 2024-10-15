#!/bin/sh

# Baixe o kernel compilado
echo "sys-kernel/installkernel dracut grub" >> /etc/portage/package.use/installkernel
echo "sys-boot/grub mount -truetype -themes -fonts" >> /etc/portage/package.use/grub
emerge -av sys-kernel/gentoo-kernel-bin
emerge -av sys-kernel/installkernel
emerge -av sys-boot/os-prober
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub

# Arrumando o fstab
cp /home/backup/scripts/gentoo/fstab /etc/fstab
