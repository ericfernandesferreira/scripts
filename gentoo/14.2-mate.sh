#!/bin/sh

# Instalando a base do Mate
mkdir -p /etc/portage/package.use/mate
echo "dev-libs/libdbusmenu gtk3" > /etc/portage/package.use/mate/libdbusmenu
echo "app-text/atril caja" > /etc/portage/package.use/mate/atril
echo "app-text/poppler -qt5 -qt6 curl" > /etc/portage/package.use/mate/poppler
echo "dev-libs/appstream -qt6" > /etc/portage/package.use/mate/appstream
echo "mate-extra/caja-extensions -cdr -mail image-converter share" > /etc/portage/package.use/mate/caja-extensions
echo "mate-base/mate-applets-meta sensors" > /etc/portage/package.use/mate/mate-applets-meta
echo "mate-base/mate-applets netlink" > /etc/portage/package.use/mate/mate-applets
echo "mate-base/mate-settings-daemon rfkill" > /etc/portage/package.use/mate/mate-settings-daemon
echo "mate-extra/mate-utils applet" > /etc/portage/package.use/mate/mate-utils
echo "mate-extra/mate-sensors-applet hddtemp" > /etc/portage/package.use/mate/mate-sensors-applet
echo "app-arch/engrampa caja" > /etc/portage/package.use/mate/engrampa
echo "dev-libs/libnl -debug" > /etc/portage/package.use/mate/libnl

# Depois dar uma checada nos pacotes : gvfs, lzma nos configs, cxx nos configs, olhar o blueman network

emerge -av mate-base/mate

# Adicionando meus temas prediletos
echo "x11-themes/gtk-engines-murrine animation-rtl" > /etc/portage/package.use/mate/murrine
echo "x11-themes/arc-theme mate" > /etc/portage/package.use/mate/arc-theme
emerge -av x11-themes/arc-theme
emerge -av x11-themes/papirus-icon-theme

# Adicionando grupos para o usuário no X
for x in cdrom audio cdrw disk sys sudo portage wheel usb video bin daemon input ; do gpasswd -a eric $x ; done
env-update && source /etc/profile

# Adicionando o Mate para ser iniciado
echo "exec dbus-launch mate-session" > ~/.xinitrc
echo "exec dbus-launch mate-session" > /home/eric/.xinitrc
echo "exec dbus-launch mate-session" > /home/eric/.xsession

# Desktop Portal
echo "x11-libs/xapp mate" > /etc/portage/package.use/mate/xapp
emerge -av sys-apps/xdg-desktop-portal-xapp

# Para esconder icones do Desktop
dconf write /org/mate/caja/desktop/computer-icon-visible false
# dconf write /org/mate/caja/desktop/volumes-visible false
# dconf write /org/mate/caja/desktop/thrash-icon-visible false

# Fixando o cursor do mouse
mkdir -p /home/eric/.icons/default
cp /home/backup/scripts/gentoo/index.theme /home/eric/.icons/default

# Habilitando o elogind e dbus no init
rc-update add dbus default
rc-update add elogind boot
rc-update add bluetooth default
