#!/bin/sh

# Removendo kernel antigos
removepkg kernel-generic
removepkg kernel-modules
removepkg kernel-huge

# Instalando o Kernel
cd /home/backup/app/slackware/kernel/kernel-generic
installpkg *.t?z

# Instalando os Módulos
cd /home/backup/app/slackware/kernel/kernel-modules
installpkg *.t?z

# Atualizando o GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# Arrumando o GRUB
sed -i '/dev\/sda[1-9] ro\ *$/ s/$/acpi_enforce_resources=lax/g'
sed -i '/### BEGIN \/etc\/grub.d\/30_os-prober ###/,/### BEGIN \/etc\/grub.d\/30_os-prober ###/d'

reboot
