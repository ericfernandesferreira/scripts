#!/bin/sh

# Instalando as dependências

pacman -S xmlto docbook-xsl kmod inetutils bc

# Script que compila o kernel e remove o original

cd /home/backup/kernel
cp linux-4.1.3.tar.xz /usr/src
cd /usr/src
tar xvf linux-4.1.3.tar.xz
rm linux-4.1.3.tar.xz
cd linux-4.1.3
cp /home/backup/kernel/configs/grinder-arch /usr/src/linux-4.1.3/.config
make -j5 && make modules_install
cp arch/x86_64/boot/bzImage /boot/vmlinuz-4.1.3
cp System.map /boot/System.map-4.1.3
ln -sf /boot/System.map-4.1.3 /boot/System.map
mkinitcpio -k 4.1.3-grinder -c /etc/mkinitcpio.conf -g /boot/initramfs-4.1.3.img

# Removendo o Kernel antigo

rm -rf /lib/modules/4.1.2-2-ARCH
rm /boot/initramfs-linux.img
rm /boot/initramfs-linux-fallback.img
rm /boot/vmlinuz-linux

# Atualizando o grub

grub-mkconfig -o /boot/grub/grub.cfg
