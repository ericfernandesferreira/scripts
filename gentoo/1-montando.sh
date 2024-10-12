#!/bin/bash
mke2fs -t ext4 -O dir_index,extent /dev/sda3
mount /dev/sda3 /mnt/gentoo

# Criando as pastas
mkdir -p /mnt/gentoo/boot/efi
mkdir -p /mnt/gentoo/home/backup
mkdir -p /mnt/gentoo/home/hd

# Montando as partições
mount /dev/sda1 /mnt/gentoo/boot/efi
swapon /dev/sda2
mount /dev/sda4 /mnt/gentoo/home/backup
