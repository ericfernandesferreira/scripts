#!/bin/sh

VERSION=6.14.6
VERSION_MODULES=6.14.6

# Removendo o kernel antigo
rm /boot/System.map
rm /boot/System.map-$VERSION
rm /boot/config
rm /boot/config-$VERSION
rm /boot/vmlinuz
rm /boot/vmlinuz-$VERSION
rm -rf /lib/modules/$VERSION_MODULES

# Compilando o novo kernel
cp /usr/src/linux-$VERSION/.config /home/backup/kernel/configs/grinder-slackware
rm -rf /usr/src/linux && rm -rf /usr/src/linux-$VERSION
tar xvf /home/backup/kernel/linux-$VERSION.tar.xz -C /usr/src
cd /usr/src
ln -s linux-$VERSION linux
cp /home/backup/kernel/configs/grinder-slackware /usr/src/linux-$VERSION/.config
cd linux-$VERSION
make -j17 bzImage && make -j17 modules && make modules_install

# Copiando arquivos do novo kernel
cp System.map /boot/System.map-$VERSION
cp .config /boot/config-$VERSION
cd arch/x86_64/boot
cp bzImage /boot/vmlinuz-$VERSION

# Arrumando os symlinks
ln -s /boot/System.map-$VERSION /boot/System.map
ln -s /boot/config-$VERSION /boot/config
ln -s /boot/vmlinuz-$VERSION /boot/vmlinuz

# Gerando o initramfs
# mkinitrd -c -k $VERSION -m ext4 -f ext4 -r /dev/nvme0n1p6

# Gerando o novo GRUB
grub-mkconfig -o /boot/grub/grub.cfg
