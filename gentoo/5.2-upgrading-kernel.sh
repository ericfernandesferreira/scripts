#!/bin/sh

OLD=4.20.0-gentoo
NEW=4.20.2-gentoo

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
make -j5 && make modules_install && make install
make modules_prepare
emerge -av @module-rebuild

# Removendo o kernel antigo
emerge -av --depclean
cd /usr/src/
rm -rf linux-$OLD
cd /lib/modules
rm -rf $OLD
cd /boot
rm config-$OLD
rm System.map-$OLD
rm vmlinuz-$OLD

# Gerando o grub com o kernel atualizado
grub-mkconfig -o /boot/grub/grub.cfg
