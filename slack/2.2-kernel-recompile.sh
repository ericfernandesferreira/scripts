#!/bin/sh

# Removendo o kernel antigo
rm /boot/System.map
rm /boot/System.map-4.5
rm /boot/vmlinuz
rm /boot/vmlinuz-4.5
rm /boot/config
rm /boot/config-4.5
rm -rf /lib/modules/4.5.0
cd /usr/src/linux-4.5
make clean
cd /usr/src
rm -rf linux-4.5
rm -rf linux

# Recompilando o kernel
cd /home/backup/kernel
cp linux-4.5.tar.xz /usr/src
cd /usr/src
tar xvf linux-4.5.tar.xz
ln -s linux-4.5 linux
rm linux-4.5.tar.xz
cp /home/backup/kernel/configs/grinder-slackware /usr/src/linux/.config
cd /usr/src/linux
make CFLAGS='"-O2 -march=haswell -pipe"' -j5 bzImage &&  make CFLAGS='"-O2 -march=haswell -pipe"' -j5 modules && make CFLAGS='"-O2 -march=haswell -pipe"' -j5 modules_install

# Arrumando os symlinks
cp System.map /boot/System.map-4.5
ln -s /boot/System.map-4.5 /boot/System.map
cp .config /boot/config-4.5
ln -s /boot/config-4.5 /boot/config
cd arch/x86_64/boot
cp bzImage /boot/vmlinuz-4.5
ln -s /boot/vmlinuz-4.5 /boot/vmlinuz
cp -a /etc/rc.d/rc.modules-4.5 /etc/rc.d/rc.modules-4.5

# Gerando o initramfs
# mkinitrd -c -k 4.5 -m ext4 -f ext4 -r /dev/sda5

# Gerando o novo GRUB
grub-mkconfig -o /boot/grub/grub.cfg
