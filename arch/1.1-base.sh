#!/bin/sh

# Atualizando o mirrorlist
cd /mnt/home/backup/scripts/arch
cp mirrorlist /etc/pacman.d/mirrorlist

# Instalando a base para prosseguimento da instalação
pacstrap /mnt base base-devel

# Montando o fstab
genfstab -p /mnt >> /mnt/etc/fstab

# Mudando para o novo sistema
arch-chroot /mnt /bin/bash
