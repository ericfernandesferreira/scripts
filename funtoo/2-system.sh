#!/bin/sh

# Atualizando a arvore do portage
emerge --sync

# Se você receber um erro na primeira vez que rodar emerge --sync
# devido a restrições do protocolo do git, defina a variável
# SYNC em /etc/portage/make.conf para "https://github.com/funtoo/ports-2012.git"

# Arrumando o fstab
cp /home/backup/scripts/funtoo/fstab /etc/fstab

# Arrumando o teclado
echo 'keymap="br-abnt2"' > /etc/conf.d/keymaps

# Arrumando a localizacao
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# Arrumando o make.conf
cp /home/backup/scripts/funtoo/make.conf /etc/portage/make.conf

# Arrumando o relógio
echo 'clock="local"' > /etc/conf.d/hwclock

# Atualizando o sistema
emerge --sync
emerge -auDN @world
