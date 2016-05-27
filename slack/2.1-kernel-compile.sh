#!/bin/sh

# Compilando o novo kernel
cd /home/backup/kernel
cp linux-4.6.tar.xz /usr/src
cd /usr/src
tar xvf linux-4.6.tar.xz
ln -s linux-4.6 linux
rm linux-4.6.tar.xz
cp /home/backup/kernel/configs/grinder-slackware /usr/src/linux/.config
cd /usr/src/linux
make CFLAGS='"-O3 -march=haswell -pipe"' -j5 bzImage &&  make CFLAGS='"-O3 -march=haswell -pipe"' -j5 modules && make CFLAGS='"-O3 -march=haswell -pipe"' -j5 modules_install

# Arrumando os symlinks
cp System.map /boot/System.map-4.6
rm /boot/System.map
cp .config /boot/config-4.6
rm /boot/config
cd arch/x86_64/boot
cp bzImage /boot/vmlinuz-4.6
rm /boot/vmlinuz
cp -a /etc/rc.d/rc.modules-4.4.11 /etc/rc.d/rc.modules-4.6

# Removendo o kernel antigo
removepkg kernel-generic
removepkg kernel-huge
removepkg kernel-modules
ln -s /boot/System.map-4.6 /boot/System.map
ln -s /boot/config-4.6 /boot/config
ln -s /boot/vmlinuz-4.6 /boot/vmlinuz

# Gerando o initramfs
# mkinitrd -c -k 4.6 -m ext4 -f ext4 -r /dev/sda5

# Gerando o novo GRUB
grub-mkconfig -o /boot/grub/grub.cfg
