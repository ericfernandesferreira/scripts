#!/bin/bash

# Copiando o make.conf
cp /home/backup/scripts/gentoo/make-final.conf /etc/portage/make.conf

# Adicionando ssh como serviço
rc-update add sshd default

# Configuracao do teclado
cp /home/backup/scripts/gentoo/keymaps /etc/conf.d/keymaps

# Configuração do relógio
echo clock='"local"' > /etc/conf.d/hwclock

# Instalando Filesystem Tools
emerge -av sys-fs/dosfstools
emerge -av sys-fs/ntfs3g
emerge -av sys-fs/e2fsprogs
emerge -av sys-block/io-scheduler-udev-rules

env-update && source /etc/profile
