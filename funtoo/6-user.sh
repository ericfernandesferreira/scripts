#!/bin/sh

# Instalando o sudo
emerge -av sudo

# Adicionando um usuario
useradd -m -g users -G wheel,audio,cdrom,portage,usb,video,sudo,bin,daemon,disk,sys -s /bin/bash eric
passwd eric
