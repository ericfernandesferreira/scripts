#!/bin/bash

# Configurando o Pacman
echo [multilib] >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
pacman -Syu

# Instalando o Multilibs
pacman -S multilib-devel

# Instalando o xorg
pacman -S xorg-server xorg-xinit xorg-server-utils xorg-server-devel

# Adicionando br-abnt2 no Xorg
localectl set-x11-keymap br abnt2
