#!/bin/sh

# Script que adiciona discard,noatime no fstab
sed -i  '/^\/dev\/sda[2,3]/ s/defaults/&,discard,noatime,barrier=0/g' /etc/fstab

# Adicionar a entrada ntfs no fstab
mkdir -p /home/hd
chown eric:users /home/hd
echo "/dev/sdb1        /home/hd         ntfs-3g     fmask=111,dmask=000 1   0" >> /etc/fstab
