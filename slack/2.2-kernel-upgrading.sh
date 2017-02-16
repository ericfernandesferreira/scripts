#!/bin/sh

OLD=4.9.5
OLD_LIB=4.9.5
NEW=4.9.10

# Compilando o novo kernel
cd /home/backup/kernel
cp linux-$NEW.tar.xz /usr/src
cd /usr/src
tar xvf linux-$NEW.tar.xz
rm -rf linux
ln -s linux-$NEW linux
rm linux-$NEW.tar.xz
cd /usr/src/linux
cp /usr/src/linux-$OLD/.config /usr/src/linux-$NEW/.config
# cp /home/backup/kernel/configs/grinder-slackware /usr/src/linux/.config
make oldconfig
cp .config /home/backup/kernel/configs/grinder-slackware
make CFLAGS='"-O3 -march=haswell -pipe"' -j5 bzImage && make CFLAGS='"-O3 -march=haswell -pipe"' -j5 modules && make CFLAGS='"-O3 -march=haswell -pipe"' -j5 modules_install

# Arrumando os symlinks
cp System.map /boot/System.map-$NEW
rm /boot/System.map
ln -s /boot/System.map-$NEW /boot/System.map
cp .config /boot/config-$NEW
rm /boot/config
ln -s /boot/config-$NEW /boot/config
cd arch/x86_64/boot
cp bzImage /boot/vmlinuz-$NEW
rm /boot/vmlinuz
ln -s /boot/vmlinuz-$NEW /boot/vmlinuz

# Removendo o kernel antigo
rm /boot/System.map-$OLD
rm /boot/vmlinuz-$OLD
rm /boot/config-$OLD
rm -rf /lib/modules/$OLD_LIB
cd /usr/src/linux-$OLD
make mrproper
cd /usr/src
rm -rf linux-$OLD

# Gerando o initramfs
# mkinitrd -c -k $NEW -m ext4 -f ext4 -r /dev/sda5

# Gerando o novo GRUB
grub-mkconfig -o /boot/grub/grub.cfg
