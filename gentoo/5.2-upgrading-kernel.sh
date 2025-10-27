#!/bin/sh

OLD=6.14.3-gentoo
NEW=6.14.5-gentoo

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
make -j17 && make modules_install && make install
make modules_prepare
emerge -av @module-rebuild

# Removendo o kernel antigo
emerge -av --depclean
rm -rf /usr/src/linux-$OLD
rm -rf /lib/modules/$OLD
rm /boot/config-$OLD
rm /boot/System.map-$OLD
rm /boot/vmlinuz-$OLD

# Criando os symlinks
ln -s /boot/System.map /boot/System.map-$NEW
ln -s /boot/vmlinuz /boot/vmlinuz-$NEW

# Gerando o grub com o kernel atualizado
grub-mkconfig -o /boot/grub/grub.cfg
