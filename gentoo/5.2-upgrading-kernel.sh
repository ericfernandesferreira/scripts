#!/bin/sh

OLD=4.6.2
NEW=4.6.3

# Trocando o kernel default para o novo
eselect kernel set 2
eselect kernel list

# Copiando a config para o novo kernel
cp /usr/src/linux-$OLD-gentoo/.config /usr/src/linux-$NEW-gentoo/.config

# Atualizando a config antiga
cd /usr/src/linux-$NEW-gentoo
make oldconfig
cp .config /home/backup/kernel/configs/grinder-gentoo

# Compilando o novo kernel
make CFLAGS='"-march=haswell -O3 -pipe"' -j5 && make modules_install && make install
make modules_prepare
emerge -av @module-rebuild

# Removendo o kernel antigo
emerge -av --depclean
cd /usr/src/
rm -rf linux-$OLD-gentoo
cd /lib/modules
rm -rf $OLD-gentoo-gr1nder
cd /boot
rm config-$OLD-gentoo-gr1nder
rm System.map-$OLD-gentoo-gr1nder
rm vmlinuz-$OLD-gentoo-gr1nder

# Gerando o grub com o kernel atualizado
grub2-mkconfig -o /boot/grub/grub.cfg
