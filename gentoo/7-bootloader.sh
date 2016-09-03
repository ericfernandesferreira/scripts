#!/bin/sh

# Instalando o GRUB
echo "sys-boot/grub -truetype -themes -fonts" >> /etc/portage/package.use
emerge -av sys-boot/grub

# Configurando o GRUB
grub-install --target=x86_64-efi --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg

# Adicionando senha ao root
passwd
