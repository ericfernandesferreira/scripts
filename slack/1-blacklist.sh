#!/bin/sh

# Script pós instalação
# 1- Adiciona Blacklist do Nouveau
# 2- Instala o GRUB e gera uma configuração

cp nouveau.conf /etc/modprobe.d/

grub-install /dev/sda1
grub-mkconfig -o /boot/grub/grub.cfg
