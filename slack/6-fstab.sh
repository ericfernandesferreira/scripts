#!/bin/sh

# Adicionar a entrada ntfs no fstab
mkdir -p /home/hd
chown eric:users /home/hd
echo "/dev/nvme0n1p5   /home/hd         ntfs-3g     fmask=111,dmask=000 1   0" >> /etc/fstab
