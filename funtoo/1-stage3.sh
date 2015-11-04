#!/bin/sh

# Instalando o Stage3

cp /mnt/funtoo/home/backup/scripts/funtoo/stage3-*.tar.xz /mnt/funtoo
cd /mnt/funtoo
tar xpf stage3-intel64-haswell-funtoo-current-2015-09-21.tar.xz
rm stage3-*.tar.xz

# Montando o Funtoo
mount -t proc none proc
mount --rbind /sys sys
mount --rbind /dev dev
cp /etc/resolv.conf /mnt/funtoo/etc/
echo 'Digite export PS1="(chroot) $PS1"'
env -i HOME=/root TERM=$TERM chroot . bash -l
