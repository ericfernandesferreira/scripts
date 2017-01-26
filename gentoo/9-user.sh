#!/bin/sh

# Adicionando um usuário
groupadd sudo
useradd -m -G users,wheel,audio,cdrom,portage,usb,video,bin,daemon,disk,sys,input,sudo -s /bin/bash eric
passwd eric
