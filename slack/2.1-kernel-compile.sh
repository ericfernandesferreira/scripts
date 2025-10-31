#!/bin/sh

NEW=6.17.6

# Removendo o kernel antigo
removepkg kernel-generic
removepkg kernel-source
rm -rf /usr/src/linux
rm /boot/{amd-ucode.img,intel-ucode.img,initrd*}

# Compilando o novo kernel
cd /home/backup/kernel
cp linux-$NEW.tar.xz /usr/src
cd /usr/src
tar xvf linux-$NEW.tar.xz
rm linux-$NEW.tar.xz
cp /home/backup/kernel/configs/grinder-slackware /usr/src/linux-$NEW/.config
cd /usr/src/linux-$NEW
make -j17 bzImage && make -j17 modules && make modules_install

# Copiando arquivos do novo kernel
cp System.map /boot/System.map-$NEW
cp .config /boot/config-$NEW
cd arch/x86_64/boot
cp bzImage /boot/vmlinuz-$NEW

# Arrumando os symlinks
cd /usr/src
ln -s linux-$NEW linux
ln -s /boot/System.map-$NEW /boot/System.map
ln -s /boot/config-$NEW /boot/config
ln -s /boot/vmlinuz-$NEW /boot/vmlinuz

# Gerando o initramfs
# mkinitrd -c -k $NEW -m ext4 -f ext4 -r /dev/nvme0n1p6

# Adicionando a entrada do Windows no GRUB
cp /home/backup/scripts/slack/configs/40_custom /etc/grub.d/40_custom

# Gerando o novo GRUB
grub-mkconfig -o /boot/grub/grub.cfg
