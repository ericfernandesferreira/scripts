#!/bin/bash
mke2fs -t ext4 -O dir_index,extent /dev/sda6
mount /dev/sda6 /mnt/gentoo

# Criando as pastas
mkdir -p /mnt/gentoo/boot/efi
mkdir -p /mnt/gentoo/home/backup
mkdir -p /mnt/gentoo/home/games
mkdir -p /mnt/gentoo/home/hd1
mkdir -p /mnt/gentoo/home/hd2

# Montando as partições
mount /dev/sda1 /mnt/gentoo/boot/efi
swapon /dev/sda2
mount /dev/sda3 /mnt/gentoo/home/backup
mount /dev/sda4 /mnt/gentoo/home/games
