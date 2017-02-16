#!/bin/sh

# Instalando a base do xfce4
echo "sys-block/parted device-mapper" >> /etc/portage/package.use
echo "x11-themes/gtk-engines-murrine animation-rtl" >> /etc/portage/package.use
echo "app-text/enchant aspell" >> /etc/portage/package.use
echo "media-libs/alsa-lib alisp" >> /etc/portage/package.use
echo "media-libs/libbluray aacs" >> /etc/portage/package.use
echo "media-gfx/ufraw contrast" >> /etc/portage/package.use
echo "media-gfx/imagemagick corefonts hdri fpx" >> /etc/portage/package.use
echo "media-libs/gst-plugins-bad -gles2" >> /etc/portage/package.use
echo "gnome-base/librsvg -tools" >> /etc/portage/package.use
echo "media-libs/libsdl2 gles" >> /etc/portage/package.use
echo "gnome-base/gvfs archive" >> /etc/portage/package.use
echo "media-libs/x264 ~amd64" >> /etc/portage/package.accept_keywords
echo "media-libs/x265 ~amd64" >> /etc/portage/package.accept_keywords
echo "media-video/ffmpeg ~amd64" >> /etc/portage/package.accept_keywords
echo "media-libs/openal ~amd64" >> /etc/portage/package.accept_keywords
echo "media-libs/webrtc-audio-processing ~amd64" >> /etc/portage/package.accept_keywords
echo "media-sound/pulseaudio ~amd64" >> /etc/portage/package.accept_keywords

emerge -av xfce-base/xfce4-meta

# Adicionando Aplicativos
emerge -av x11-themes/xfwm4-themes
emerge -av app-editors/mousepad
emerge -av x11-terms/xfce4-terminal
emerge -av app-arch/xarchiver
emerge -av media-gfx/ristretto
emerge -av sci-calculators/galculator
emerge -av media-sound/pavucontrol

# Adicionando Extras
emerge -av xfce-extra/xfce4-notifyd
emerge -av xfce-extra/xfce4-taskmanager
emerge -av xfce-extra/xfce4-power-manager
emerge -av xfce-extra/xfce4-screenshooter
emerge -av xfce-extra/thunar-volman
emerge -av xfce-extra/tumbler

# Adicionando Plugins
echo "xfce-extra/xfce4-pulseaudio-plugin keybinder" >> /etc/portage/package.use
emerge -av xfce-extra/thunar-archive-plugin
emerge -av xfce-extra/xfce4-mount-plugin
emerge -av xfce-extra/xfce4-sensors-plugin
emerge -av xfce-extra/xfce4-pulseaudio-plugin

# Adicionando Temas
emerge -av x11-themes/vanilla-dmz-xcursors
emerge -av x11-themes/greybird
emerge -av x11-themes/clearlooks-phenix
emerge -av x11-themes/gtk-engines-aurora

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
