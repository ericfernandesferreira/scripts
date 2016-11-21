#!/bin/sh

OLD=4.4.29
NEW=4.8.9

# Compilando o novo kernel
cd /home/backup/kernel
cp linux-$NEW.tar.xz /usr/src
cd /usr/src
tar xvf linux-$NEW.tar.xz
rm linux-$NEW.tar.xz
cp /home/backup/kernel/configs/grinder-slackware /usr/src/linux-$NEW/.config
cd /usr/src/linux-$NEW
make CFLAGS='"-O3 -march=haswell -pipe"' -j5 bzImage &&  make CFLAGS='"-O3 -march=haswell -pipe"' -j5 modules && make CFLAGS='"-O3 -march=haswell -pipe"' -j5 modules_install

# Copiando arquivos do novo kernel
cp System.map /boot/System.map-$NEW
cp .config /boot/config-$NEW
cd arch/x86_64/boot
cp bzImage /boot/vmlinuz-$NEW
# cp -a /etc/rc.d/rc.modules-$OLD /etc/rc.d/rc.modules-$NEW

# Removendo o kernel antigo
removepkg kernel-generic
removepkg kernel-huge
removepkg kernel-modules
removepkg kernel-source
rm -rf /usr/src/linux

# Arrumando os symlinks
cd /usr/src
ln -s linux-$NEW linux
ln -s /boot/System.map-$NEW /boot/System.map
ln -s /boot/config-$NEW /boot/config
ln -s /boot/vmlinuz-$NEW /boot/vmlinuz

# Gerando o initramfs
# mkinitrd -c -k $NEW -m ext4 -f ext4 -r /dev/sda5

# Gerando o novo GRUB
grub-mkconfig -o /boot/grub/grub.cfg
