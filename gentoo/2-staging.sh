#!/bin/sh

# Copiando o Staging para a pasta correta e instalando
cp /mnt/gentoo/home/backup/scripts/gentoo/stage3-*.tar.xz /mnt/gentoo
cd /mnt/gentoo
tar xvf stage3-*.tar.xz --xattrs
rm stage3-*.tar.xz

# Arrumando o /etc/portage/
cd /mnt/gentoo/etc/portage/
echo "net-misc/iputils -caps -filecaps -nettle" >> /mnt/gentoo/etc/portage/package.use/iputils
cd /mnt/gentoo/
cp /mnt/gentoo/home/backup/scripts/gentoo/make-install.conf /mnt/gentoo/etc/portage/make.conf

# Copiando as informacoes de DNS
cp -L /etc/resolv.conf /mnt/gentoo/etc/

# Montando os sistemas
mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
mount --bind /run /mnt/gentoo/run
mount --make-slave /mnt/gentoo/run

# Entrando no novo ambiente
echo 'Digite source /etc/profile'
echo Digite 'export PS1="(chroot) $PS1"'
chroot /mnt/gentoo /bin/bash
