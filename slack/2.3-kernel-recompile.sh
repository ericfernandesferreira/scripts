#!/bin/sh

VERSION=4.6.3

# Removendo o kernel antigo
rm /boot/System.map
rm /boot/System.map-$VERSION
rm /boot/config
rm /boot/config-$VERSION
rm /boot/vmlinuz
rm /boot/vmlinuz-$VERSION
rm -rf /lib/modules/$VERSION

# Compilando o novo kernel
cd /usr/src/linux-$VERSION
make clean
make CFLAGS='"-O3 -march=haswell -pipe"' -j5 bzImage &&  make CFLAGS='"-O3 -march=haswell -pipe"' -j5 modules && make CFLAGS='"-O3 -march=haswell -pipe"' -j5 modules_install

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
# mkinitrd -c -k $VERSION -m ext4 -f ext4 -r /dev/sdc5

# Gerando o novo GRUB
grub-mkconfig -o /boot/grub/grub.cfg
