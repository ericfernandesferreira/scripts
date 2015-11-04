#!/bin/sh

# Instalando a base do Mate
echo "media-libs/gst-plugins-bad -gles2" >> /etc/portage/package.use
echo "mate-extra/caja-extensions image-converter -cdr" >> /etc/portage/package.use
echo "app-arch/engrampa caja" >> /etc/portage/package.use
echo "mate-extra/mate-power-manager -gnome-keyring" >> /etc/portage/package.use
echo "media-video/ffmpeg ~amd64" >> /etc/portage/package.accept_keywords

emerge -av mate-base/mate x11-misc/mozo mate-extra/mate-sensors-applet mate-extra/caja-extensions

# Adicionando grupos para o usuario no X
for x in cdrom audio cdrw disk sys portage wheel usb video sudo bin daemon input plugdev ; do gpasswd -a eric $x ; done
env-update && source /etc/profile

# Adicionando o Mate para ser iniciado
echo "exec ck-launch-session dbus-launch mate-session" > ~/.xinitrc
echo "exec ck-launch-session dbus-launch mate-session" > /home/eric/.xinitrc
echo "exec ck-launch-session dbus-launch mate-session" > /home/eric/.xsession

# Para esconder icones do Desktop
# dconf write /org/mate/caja/desktop/computer-icon-visible false
# dconf write /org/mate/caja/desktop/volumes-visible false

# Fixando o cursor do mouse
mkdir -p /home/eric/.icons/default
cp /home/backup/scripts/gentoo/index.theme /home/eric/.icons/default

# Dando uma atualizada no sistema geral antes de prosseguir
env-update && source /etc/profile

# Habilitando o consolekit e dbus no init
rc-update add consolekit default
rc-update add dbus default
