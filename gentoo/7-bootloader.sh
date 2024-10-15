#!/bin/sh

# Instalando o GRUB
echo "sys-boot/grub mount -truetype -themes -fonts" >> /etc/portage/package.use/grub
emerge -av sys-boot/grub sys-boot/os-prober
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub

# Configurando o GRUB
grub-install --target=x86_64-efi --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg

# Adicionando senha ao root
passwd
