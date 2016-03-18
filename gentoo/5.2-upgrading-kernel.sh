#!/bin/sh

# Trocando o kernel default para o novo
eselect kernel set 2
eselect kernel list

# Copiando a config para o novo kernel
cp /usr/src/linux-4.4.4-gentoo/.config /usr/src/linux/.config

# Atualizando a config antiga
cd /usr/src/linux
make oldconfig
cp .config /home/backup/kernel/configs/grinder-gentoo

# Compilando o novo kernel
make CFLAGS='"-march=haswell -O2 -pipe"' -j5 && make modules_install && make install
make modules_prepare
emerge -av @module-rebuild

# Removendo o kernel antigo
emerge -av --depclean
cd /usr/src/
rm -rf linux-4.4.4-gentoo
cd /lib/modules
rm -rf 4.4.4-gentoo-gr1nder
cd /boot
rm config-4.4.4-gentoo-gr1nder
rm System.map-4.4.4-gentoo-gr1nder
rm vmlinuz-4.4.4-gentoo-gr1nder

# Gerando o grub com o kernel atualizado
grub2-mkconfig -o /boot/grub/grub.cfg