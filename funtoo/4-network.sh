#!/bin/sh

# Deixando dhcp como padrao
rc-update add dhcpcd default

# Arrumando hostname
echo 'hostname="funtoo"' > /etc/conf.d/hostname

# Arrumando o password do root
passwd

# Reiniciando o sistema
exit
cd /mnt
umount -lR funtoo
reboot
