#!/bin/bash

# Copiando o make.conf
cp /home/backup/scripts/gentoo/make-final.conf /etc/portage/make.conf

# Configuracao do teclado
cp /home/backup/scripts/gentoo/keymaps /etc/conf.d/keymaps

# Configuracao do relogio
echo clock='"local"' > /etc/conf.d/hwclock

# Instalando um System Logger
# emerge --ask app-admin/syslog-ng
# rc-update add syslog-ng default

# Instalando File Indexing
# emerge --ask sys-apps/mlocate

# Instalando Filesystem Tools
emerge --ask sys-fs/xfsprogs
emerge --ask sys-fs/reiserfsprogs
emerge --ask sys-fs/jfsutils
emerge --ask sys-fs/dosfstools
emerge --ask sys-fs/f2fs-tools
emerge --ask sys-fs/ntfs3g
emerge --ask sys-fs/e2fsprogs

# Instalando DHCP Client
emerge --ask net-misc/dhcpcd
rc-update add dhcpcd default

env-update && source /etc/profile
