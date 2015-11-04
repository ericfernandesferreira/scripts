#!/bin/sh

# Removendo o kernel antigo
removepkg kernel-generic
removepkg kernel-huge
removepkg kernel-modules
rm -rf /lib/modules/4.2.5/
rm -rf /usr/src/linux-4.2.5/
rm -rf /usr/src/linux
rm /boot/config
rm /boot/vmlinuz
rm /boot/System.map

# Compilando o novo kernel
cd /home/backup/kernel
cp linux-4.3.tar.xz /usr/src
cd /usr/src
tar xvf linux-4.3.tar.xz
ln -s linux-4.3 linux
rm linux-4.3.tar.xz
cp /home/backup/kernel/configs/grinder-slackware /usr/src/linux/.config
# cd /usr/src/linux/kernel
# patch -p0 workqueue.c < /home/backup/kernel/configs/nvidia.patch
cd /usr/src/linux
make CFLAGS='"-O3 -march=haswell -fomit-frame-pointer -pipe"' -j5 bzImage &&  make CFLAGS='"-O3 -march=haswell -fomit-frame-pointer -pipe"' -j5 modules && make CFLAGS='"-O3 -march=haswell -fomit-frame-pointer -pipe"' -j5 modules_install

# Arrumando os symlinks
cp System.map /boot/System.map-4.3
ln -s /boot/System.map-4.3 /boot/System.map
cp .config /boot/config-4.3
ln -s /boot/config-4.3 /boot/config
cd arch/x86_64/boot
cp bzImage /boot/vmlinuz-4.3
ln -s /boot/vmlinuz-4.3 /boot/vmlinuz
cp -a /etc/rc.d/rc.modules-4.1.12 /etc/rc.d/rc.modules-4.3

# Gerando o initramfs
# mkinitrd -c -k 4.3 -m ext4 -f ext4 -r /dev/sda5

# Gerando o novo GRUB
grub-mkconfig -o /boot/grub/grub.cfg

reboot
