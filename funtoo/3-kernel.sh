#!/bin/sh

# Compilando kernel
emerge -av gentoo-sources
cp /home/backup/kernel/configs/grinder-gentoo /usr/src/linux/.config
cd /usr/src/linux
make CFLAGS="-march=haswell -O2 -pipe" -j5 && make modules_install && make install

# Bootloader
emerge boot-update
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id="funtoo" --recheck /dev/sda1
grub-mkconfig -o /boot/grub/grub.cfg
