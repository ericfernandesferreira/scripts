#!/bin/sh

# Instalando a base do xfce4
echo "media-libs/x264 ~amd64" >> /etc/portage/package.accept_keywords
echo "media-libs/x265 ~amd64" >> /etc/portage/package.accept_keywords
echo "media-video/ffmpeg ~amd64" >> /etc/portage/package.accept_keywords
echo "media-libs/openal ~amd64" >> /etc/portage/package.accept_keywords
echo "media-libs/webrtc-audio-processing ~amd64" >> /etc/portage/package.accept_keywords
echo "media-sound/pulseaudio ~amd64" >> /etc/portage/package.accept_keywords
emerge -av xfce-base/xfce4-meta
for x in cdrom audio cdrw disk sys portage wheel usb video bin daemon input plugdev ; do gpasswd -a eric $x ; done
env-update && source /etc/profile

# Adicionando o xfce4 para iniciar
echo "exec ck-launch-session startxfce4" > ~/.xinitrc
echo "exec ck-launch-session startxfce4" > /home/eric/.xinitrc
echo "exec ck-launch-session startxfce4" > /home/eric/.xsession

# Adicionando extras para o xfce4
emerge --ask x11-themes/vanilla-dmz-xcursors
echo "Xcursor.theme: Vanilla-DMZ" > /home/eric/.Xresources
emerge --ask pavucontrol
emerge --ask xfce-extra/xfce4-taskmanager
emerge --ask xfce-extra/xfce4-power-manager
emerge --ask x11-themes/xfwm4-themes
emerge --ask app-editors/mousepad
emerge --ask x11-terms/xfce4-terminal
emerge --ask app-arch/xarchiver
emerge --ask xfce-base/thunar
emerge --ask xfce-extra/thunar-archive-plugin
emerge --ask xfce-extra/xfce4-mount-plugin
emerge --ask xfce-extra/xfce4-sensors-plugin
emerge --ask xfce-extra/xfce4-screenshooter
emerge --ask media-gfx/ristretto
emerge --ask xfce-extra/xfce4-volumed-pulse
emerge --ask xfce-extra/thunar-volman
emerge --ask x11-themes/greybird
emerge --ask sci-calculators/galculator
echo "media-libs/gst-plugins-bad -gles2" >> /etc/portage/package.use
emerge --ask xfce-extra/tumbler

# Dando uma atualizada no sistema geral antes de prosseguir
emerge -av --changed-use --deep @world
env-update && source /etc/profile

# Habilitando o consolekit e dbus no init
rc-update add consolekit default
rc-update add dbus default
rc-update add acpid default
