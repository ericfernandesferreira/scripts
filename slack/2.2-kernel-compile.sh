#!/bin/sh

# Em caso de recompilamento da mesma versao
rm /boot/config-4.2.5
rm /boot/config
rm /boot/vmlinuz-4.2.5
rm /boot/vmlinuz
rm /boot/System.map-4.2.5
rm /boot/System.map
rm -rf /lib/modules/4.2.5

# Compilando o novo kernel
cd /home/backup/kernel/linux-4.2.5
make clean
make -j5 bzImage && make -j5 modules && make -j5 modules_install
cp System.map /boot/System.map-4.2.5
ln -s /boot/System.map-4.2.5 /boot/System.map
cp .config /boot/config-4.2.5
ln -s /boot/config-4.2.5 /boot/config
cd arch/x86_64/boot
cp bzImage /boot/vmlinuz-4.2.5
ln -s /boot/vmlinuz-4.2.5 /boot/vmlinuz
cp -a /etc/rc.d/rc.modules-4.1.12 /etc/rc.d/rc.modules-4.2.5
# mkinitrd -c -k 4.2.5 -m ext4 -f ext4 -r /dev/sda5

# Removendo o kernel antigo
removepkg kernel-generic
removepkg kernel-huge
removepkg kernel-modules

# Gerando o novo GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# Arrumando o GRUB
sed -i '/dev\/sda[1-9] ro\ *$/ s/$/acpi_enforce_resources=lax/g'
sed -i '/### BEGIN \/etc\/grub.d\/30_os-prober ###/,/### BEGIN \/etc\/grub.d\/30_os-prober ###/d'

reboot
