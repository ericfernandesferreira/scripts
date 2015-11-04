#!/bin/bash
mke2fs -t ext4 -O dir_index,extent /dev/sda5
mount /dev/sda5 /mnt/gentoo

# Criando as pastas
mkdir -p /mnt/gentoo/boot/efi
mkdir -p /mnt/gentoo/home/backup
mkdir -p /mnt/gentoo/home/games
mkdir -p /mnt/gentoo/home/hd

# Montando as particoes
mount /dev/sda1 /mnt/gentoo/boot/efi
swapon /dev/sda2
mount /dev/sda6 /mnt/gentoo/home/backup
mount /dev/sda7 /mnt/gentoo/home/games
