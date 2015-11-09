#!/bin/sh

# Copiando o Staging para a pasta correta e instalando
cp /mnt/gentoo/home/backup/scripts/gentoo/stage3-*.tar.bz2 /mnt/gentoo
cd /mnt/gentoo
tar xvjpf stage3-*.tar.bz2 --xattrs
rm stage3-*.tar.bz2

# Arrumando o /etc/portage/
cd /mnt/gentoo/etc/portage/
rm -rf package.use
echo "net-misc/iputils -caps -filecaps" >> /mnt/gentoo/etc/portage/package.use
cd /mnt/gentoo/
cp /mnt/gentoo/home/backup/scripts/gentoo/make-install.conf /mnt/gentoo/etc/portage/make.conf

# Copiando as informacoes de DNS
cp -L /etc/resolv.conf /mnt/gentoo/etc/

# Montando os sistemas
mount -t proc proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev

# Entrando no novo ambiente
echo 'Digite source /etc/profile'
echo Digite 'export PS1="(chroot) $PS1"'
chroot /mnt/gentoo /bin/bash
