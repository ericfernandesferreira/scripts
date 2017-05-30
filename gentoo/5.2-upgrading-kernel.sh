#!/bin/sh

OLD=4.9.9-gentoo
NEW=4.9.10-gentoo

# Trocando o kernel default para o novo
eselect kernel set 2
eselect kernel list

# Copiando a config para o novo kernel
cp /usr/src/linux-$OLD/.config /usr/src/linux-$NEW/.config

# Atualizando a config antiga
cd /usr/src/linux-$NEW
make oldconfig
cp .config /home/backup/kernel/configs/grinder-gentoo

# Compilando o novo kernel
make CFLAGS='"-march=haswell -O3 -pipe"' -j5 && make modules_install && make install
make modules_prepare
emerge -av @module-rebuild

# Removendo o kernel antigo
emerge -av --depclean
cd /usr/src/
rm -rf linux-$OLD
cd /lib/modules
rm -rf $OLD-gr1nder
cd /boot
rm config-$OLD-gr1nder
rm System.map-$OLD-gr1nder
rm vmlinuz-$OLD-gr1nder

# Gerando o grub com o kernel atualizado
grub-mkconfig -o /boot/grub/grub.cfg
