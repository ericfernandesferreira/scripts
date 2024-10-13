#!/bin/sh

# Instalando a base do Mate
#echo "" >> /etc/portage/package.use/
#echo "" >> /etc/portage/package.use/
#echo "" >> /etc/portage/package.use/
#echo "" >> /etc/portage/package.use/
#echo "" >> /etc/portage/package.use/
#echo "" >> /etc/portage/package.use/
#echo "" >> /etc/portage/package.use/
#echo "" >> /etc/portage/package.use/
#echo "" >> /etc/portage/package.use/
#echo "" >> /etc/portage/package.use/
#echo "" >> /etc/portage/package.use/
#echo "" >> /etc/portage/package.use/
#echo "" >> /etc/portage/package.use/
#echo "" >> /etc/portage/package.use/
#echo "" >> /etc/portage/package.use/
#echo "" >> /etc/portage/package.use/
#echo "" >> /etc/portage/package.use/
#echo "" >> /etc/portage/package.use/
#echo "" >> /etc/portage/package.use/
#echo "" >> /etc/portage/package.use/

emerge -av mate-base/mate

# Adicionando grupos para o usuário no X
for x in cdrom audio cdrw disk sys sudo portage wheel usb video bin daemon input plugdev ; do gpasswd -a eric $x ; done
env-update && source /etc/profile

# Adicionando o Mate para ser iniciado
echo "exec dbus-launch mate-session" > ~/.xinitrc
#echo "exec dbus-launch mate-session" > /home/eric/.xinitrc
#echo "exec dbus-launch mate-session" > /home/eric/.xsession

# Desktop Portal
emerge -av sys-apps/xdg-desktop-portal-xapp

# Para esconder icones do Desktop
# dconf write /org/mate/caja/desktop/computer-icon-visible false
# dconf write /org/mate/caja/desktop/volumes-visible false
# dconf write /org/mate/caja/desktop/thrash-icon-visible false

# Fixando o cursor do mouse
mkdir -p /home/eric/.icons/default
cp /home/backup/scripts/gentoo/index.theme /home/eric/.icons/default

# Habilitando o consolekit e dbus no init
rc-update add dbus default
rc-service dbus start
