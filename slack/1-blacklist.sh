#!/bin/sh

# cp configs/nouveau.conf /etc/modprobe.d/

grub-install /dev/nvme0n1p1
grub-mkconfig -o /boot/grub/grub.cfg
