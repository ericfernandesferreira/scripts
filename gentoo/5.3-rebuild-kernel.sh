#!/bin/sh

VERSION=6.11.3-gentoo

# Removendo o anterior
rm /boot/config-$VERSION
rm /boot/System.map-$VERSION
rm /boot/vmlinuz-$VERSION
rm -rf /lib/modules/$VERSION

# Recompilando o Kernel
cp /usr/src/linux/.config /home/backup/kernel/configs/grinder-gentoo
cd /usr/src/linux
make mrproper
cp /home/backup/kernel/configs/grinder-gentoo /usr/src/linux/.config
make -j17 && make modules_install && make install

# Atualizando o Grub
#grub-mkconfig -o /boot/grub/grub.cfg
