#!/bin/sh

# Instalando a base do Mate
echo "sys-block/parted device-mapper" >> /etc/portage/package.use
echo "x11-libs/libva egl" >> /etc/portage/package.use
echo "x11-themes/gtk-engines-murrine animation-rtl" >> /etc/portage/package.use
echo "app-text/atril caja" >> /etc/portage/package.use
echo "app-text/enchant aspell" >> /etc/portage/package.use
echo "app-arch/engrampa caja magic" >> /etc/portage/package.use
echo "media-libs/alsa-lib alisp" >> /etc/portage/package.use
echo "media-libs/libbluray aacs" >> /etc/portage/package.use
echo "media-libs/gst-plugins-bad -gles2" >> /etc/portage/package.use
echo "media-gfx/ufraw contrast" >> /etc/portage/package.use
echo "media-gfx/imagemagick corefonts hdri fpx" >> /etc/portage/package.use
echo "mate-base/mate-applets-meta sensors" >> /etc/portage/package.use
echo "mate-extra/caja-extensions image-converter -cdr" >> /etc/portage/package.use
echo "mate-extra/mate-utils applet" >> /etc/portage/package.use
echo "mate-extra/mate-sensors-applet VIDEO_CARDS: -nvidia" >> /etc/portage/package.use

echo "media-libs/x264 ~amd64" >> /etc/portage/package.accept_keywords
echo "media-libs/x265 ~amd64" >> /etc/portage/package.accept_keywords
echo "media-libs/openal ~amd64" >> /etc/portage/package.accept_keywords
echo "media-video/ffmpeg ~amd64" >> /etc/portage/package.accept_keywords
echo "media-libs/webrtc-audio-processing ~amd64" >> /etc/portage/package.accept_keywords
echo "media-sound/pulseaudio ~amd64" >> /etc/portage/package.accept_keywords

echo "mate-base/* ~amd64" >> /etc/portage/package.accept_keywords
echo "mate-extra/* ~amd64" >> /etc/portage/package.accept_keywords
echo "app-editors/pluma ~amd64" >> /etc/portage/package.accept_keywords
echo "app-text/atril ~amd64" >> /etc/portage/package.accept_keywords
echo "app-arch/engrampa ~amd64" >> /etc/portage/package.accept_keywords
echo "dev-libs/libmateweather ~amd64" >> /etc/portage/package.accept_keywords
echo "x11-themes/mate-themes ~amd64" >> /etc/portage/package.accept_keywords
echo "x11-themes/mate-themes-meta ~amd64" >> /etc/portage/package.accept_keywords
echo "x11-themes/mate-icon-theme ~amd64" >> /etc/portage/package.accept_keywords
echo "x11-themes/mate-backgrounds ~amd64" >> /etc/portage/package.accept_keywords
echo "x11-wm/marco ~amd64" >> /etc/portage/package.accept_keywords
echo "media-libs/libmatemixer ~amd64" >> /etc/portage/package.accept_keywords
echo "media-gfx/eom ~amd64" >> /etc/portage/package.accept_keywords
echo "x11-terms/mate-terminal ~amd64" >> /etc/portage/package.accept_keywords
echo "x11-misc/mozo ~amd64" >> /etc/portage/package.accept_keywords
echo "x11-misc/mate-notification-daemon" >> /etc/portage/package.accept_keywords

emerge -av mate-base/mate x11-misc/mozo mate-extra/mate-sensors-applet mate-extra/caja-extensions

# Adicionando grupos para o usuário no X
for x in cdrom audio cdrw disk sys sudo portage wheel usb video bin daemon input plugdev ; do gpasswd -a eric $x ; done
env-update && source /etc/profile

# Adicionando o Mate para ser iniciado
echo "exec ck-launch-session dbus-launch mate-session" > ~/.xinitrc
echo "exec ck-launch-session dbus-launch mate-session" > /home/eric/.xinitrc
echo "exec ck-launch-session dbus-launch mate-session" > /home/eric/.xsession

# Para esconder icones do Desktop
# dconf write /org/mate/caja/desktop/computer-icon-visible false
# dconf write /org/mate/caja/desktop/volumes-visible false
# dconf write /org/mate/caja/desktop/thrash-icon-visible false

# Fixando o cursor do mouse
mkdir -p /home/eric/.icons/default
cp /home/backup/scripts/gentoo/index.theme /home/eric/.icons/default

# Habilitando o consolekit e dbus no init
rc-update add consolekit default
rc-update add dbus default
rc-update add acpid default
