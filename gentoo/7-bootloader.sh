#!/bin/sh

# Instalando o GRUB
echo "sys-boot/grub -truetype -themes -fonts" >> /etc/portage/package.use
emerge -av sys-boot/grub

# Configurando o GRUB
grub2-install --target=x86_64-efi --efi-directory=/boot/efi
grub2-mkconfig -o /boot/grub/grub.cfg

# Adicionando senha ao root
passwd
