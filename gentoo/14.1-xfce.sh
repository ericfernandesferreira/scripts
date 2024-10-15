#!/bin/sh

# Instalando a base do xfce4
echo "sys-fs/cryptsetup -gcrypt" >> /etc/portage/package.use

echo "# DE" >> /etc/portage/package.accept_keywords
echo "dev-lang/nasm ~amd64" >> /etc/portage/package.accept_keywords
echo "media-sound/* ~amd64" >> /etc/portage/package.accept_keywords
echo "media-video/* ~amd64" >> /etc/portage/package.accept_keywords
echo "media-plugins/* ~amd64" >> /etc/portage/package.accept_keywords
echo "x11-themes/* ~amd64" >> /etc/portage/package.accept_keywords
echo "net-wireless/blueman ~amd64" >> /etc/portage/package.accept_keywords

emerge -av xfce-base/xfce4-meta

# Adicionando Aplicativos
emerge -av x11-themes/xfwm4-themes
emerge -av app-editors/mousepad
emerge -av x11-terms/xfce4-terminal
emerge -av media-gfx/ristretto
emerge -av sci-calculators/galculator
emerge -av media-sound/pavucontrol
emerge -av net-wireless/blueman
emerge -av app-cdr/cdrtools
emerge -av app-cdr/xfburn
emerge -av app-arch/file-roller

# Adicionando Extras
emerge -av xfce-extra/xfce4-notifyd
emerge -av xfce-extra/xfce4-taskmanager
emerge -av xfce-extra/xfce4-power-manager
emerge -av xfce-extra/xfce4-screenshooter
emerge -av xfce-extra/thunar-volman
emerge -av xfce-extra/tumbler

# Adicionando Plugins
emerge -av xfce-extra/thunar-archive-plugin
emerge -av xfce-extra/xfce4-cpufreq-plugin
emerge -av xfce-extra/xfce4-cpugraph-plugin
emerge -av xfce-extra/xfce4-mount-plugin
emerge -av xfce-extra/xfce4-sensors-plugin
emerge -av xfce-extra/xfce4-pulseaudio-plugin

# Adicionando Temas
echo "x11-themes/arc-theme xfce" >> /etc/portage/package.use
emerge -av x11-themes/arc-theme
emerge -av x11-themes/greybird
emerge -av x11-themes/vanilla-dmz-xcursors

# Fixando o cursor do mouse
mkdir /usr/share/cursors/xorg-x11/default
echo "Inherits=Vanilla-DMZ" > /usr/share/cursors/xorg-x11/default/index.theme

# Adicionando grupos para o usuário no X
for x in cdrom audio cdrw disk sys sudo portage wheel usb video bin daemon input plugdev ; do gpasswd -a eric $x ; done
env-update && source /etc/profile

# Adicionando o xfce4 para iniciar
echo "exec ck-launch-session dbus-launch --sh-syntax --exit-with-session xfce4-session startxfce4" > ~/.xinitrc
echo "exec ck-launch-session dbus-launch --sh-syntax --exit-with-session xfce4-session startxfce4" > /home/eric/.xinitrc

# Habilitando o consolekit e dbus no init
rc-update add consolekit default
rc-update add dbus default
rc-update add acpid default
rc-update add bluetooth default