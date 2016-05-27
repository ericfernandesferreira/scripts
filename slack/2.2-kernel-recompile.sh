#!/bin/sh

# Compilando o novo kernel
cd /home/backup/kernel
cp linux-4.6.tar.xz /usr/src
cd /usr/src
tar xvf linux-4.6.tar.xz
rm -rf linux
ln -s linux-4.6 linux
rm linux-4.6.tar.xz
cd /usr/src/linux
cp /usr/src/linux-4.6/.config /usr/src/linux/.config
# cp /home/backup/kernel/configs/grinder-slackware /usr/src/linux/.config
make oldconfig
cp .config /home/backup/kernel/configs/grinder-slackware
make CFLAGS='"-march=haswell -03 -pipe"' -j5 bzImage && make CFLAGS='"-march=haswell -03 -pipe"' -j5 modules && make CFLAGS='"-march=haswell -03 -pipe"' -j5 modules_install

# Arrumando os symlinks
cp System.map /boot/System.map-4.6
rm /boot/System.map
ln -s /boot/System.map-4.6 /boot/System.map
cp .config /boot/config-4.6
rm /boot/config
ln -s /boot/config-4.6 /boot/config
cd arch/x86_64/boot
cp bzImage /boot/vmlinuz-4.6
rm /boot/vmlinuz
ln -s /boot/vmlinuz-4.6 /boot/vmlinuz

# Removendo o kernel antigo
rm /boot/System.map-4.6
rm /boot/vmlinuz-4.6
rm /boot/config-4.6
rm -rf /lib/modules/4.6.0
cd /usr/src/linux-4.6
make mrproper
cd /usr/src
rm -rf linux-4.6

# Gerando o initramfs
# mkinitrd -c -k 4.6 -m ext4 -f ext4 -r /dev/sda5

# Gerando o novo GRUB
grub-mkconfig -o /boot/grub/grub.cfg
