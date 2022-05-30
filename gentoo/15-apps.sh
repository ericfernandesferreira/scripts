#!/bin/sh

# Audacious
emerge -av media-sound/audacious

# Unrar
echo "app-arch/unrar ~amd64" >> /etc/portage/package.accept_keywords
emerge -av app-arch/unrar

# p7zip
echo "app-arch/p7zip ~amd64" >> /etc/portage/package.accept_keywords
echo "app-arch/p7zip -wxwidgets" >> /etc/portage/package.use
emerge -av app-arch/p7zip

# GParted
echo "sys-block/gparted ~amd64" >> /etc/portage/package.accept_keywords
emerge -av sys-block/gparted

# Screenfetch
emerge -av app-misc/screenfetch

# Git
emerge -av dev-vcs/git
emerge -av dev-ruby/git

# Firefox
echo "www-client/firefox custom-optimization eme-free system-harfbuzz system-icu system-jpeg system-libvpx -gmp-autoupdate" >> /etc/portage/package.use
emerge -av www-client/firefox

# Google Chrome
echo "app-text/ghostscript cups" >> /etc/portage/package.use
echo "www-client/google-chrome ~amd64" >> /etc/portage/package.accept_keywords
emerge -av www-client/google-chrome

# Steam
mkdir -p /etc/portage/repos.conf
echo "[steam-overlay]" > /etc/portage/repos.conf/steam-overlay.conf
echo "location = /usr/local/steam-overlay/" >> /etc/portage/repos.conf/steam-overlay.conf
echo "sync-type = git" >> /etc/portage/repos.conf/steam-overlay.conf
echo "sync-uri = https://github.com/anyc/steam-overlay/" >> /etc/portage/repos.conf/steam-overlay.conf
echo "auto-sync = Yes" >> /etc/portage/repos.conf/steam-overlay.conf

echo "games-util/steam* ~amd64" >> /etc/portage/package.accept_keywords
echo "games-util/steam-client-meta steamfonts streaming trayicon" >> /etc/portage/package.use
emerge -av steam-meta

# qBittorrent
echo "dev-qt/qtgui:5 egl" >> /etc/portage/package.use
echo "dev-qt/qtlockedfile qt5" >> /etc/portage/package.use
echo "dev-qt/qtsingleapplication qt5" >> /etc/portage/package.use
echo "net-p2p/qbittorrent qt5" >> /etc/portage/package.use
echo "dev-qt/* ~amd64" >> /etc/portage/package.accept_keywords
echo "net-p2p/qbittorrent ~amd64" >> /etc/portage/package.accept_keywords
echo "net-libs/libtorrent-rasterbar ~amd64" >> /etc/portage/package.accept_keywords
emerge -av net-p2p/qbittorrent

# OBS-Studio
echo "dev-qt/qtmultimedia widgets" >> /etc/portage/package.use
echo "media-video/obs-studio -imagemagick" >> /etc/portage/package.use
emerge -av media-video/obs-studio

# VLC
echo "media-video/vlc qt5 -vdpau" >> /etc/portage/package.use
emerge -av media-video/vlc

# TeamViewer
echo "dev-qt/qtwebkit multimedia orientation webchannel -gstreamer" >> /etc/portage/package.use
echo "net-misc/teamviewer ~amd64" >> /etc/portage/package.accept_keywords
emerge -av net-misc/teamviewer
rc-update add teamviewerd11 default

# Skype
echo "net-im/skypeforlinux ~amd64" >> /etc/portage/package.accept_keywords
emerge -av net-im/skypeforlinux

# Gimp
#emerge -av media-gfx/gimp

# LibreOffice
#emerge -av app-office/libreoffice

# VirtualBox
#echo "app-emulation/virtualbox ~amd64" >> /etc/portage/package.accept_keywords
#echo "app-emulation/virtualbox-additions ~amd64" >> /etc/portage/package.accept_keywords
#echo "app-emulation/virtualbox-extpack-oracle ~amd64" >> /etc/portage/package.accept_keywords
#echo "app-emulation/virtualbox-modules ~amd64" >> /etc/portage/package.accept_keywords
#echo "app-emulation/virtualbox qt5" >> /etc/portage/package.use
#emerge -av app-emulation/virtualbox
#emerge -av app-emulation/virtualbox-additions
#emerge -av app-emulation/virtualbox-extpack-oracle

#echo modules='"vboxdrv vboxnetflt vboxnetadp"' >> /etc/conf.d/modules
#gpasswd -a eric vboxusers

# Dolphin
#echo "=games-emulation/dolphin-9999 **" >> /etc/portage/package.accept_keywords
#echo "net-libs/mbedtls ~amd64" >> /etc/portage/package.accept_keywords
#echo "net-libs/enet ~amd64" >> /etc/portage/package.accept_keywords
#echo "media-libs/libsfml ~amd64" >> /etc/portage/package.accept_keywords
#echo "media-libs/libsdl2 haptic gles" >> /etc/portage/package.use
#echo "net-libs/polarssl havege" >> /etc/portage/package.use
#emerge -av games-emulation/dolphin
#gpasswd -a eric games
#for x in games ; do gpasswd -a eric $x ; done

# Wine
#echo "=app-emulation/wine-1.7.50 ~amd64" >> /etc/portage/package.accept_keywords
#echo "app-emulation/wine opencl -gstreamer" >> /etc/portage/package.use
#echo "dev-libs/elfutils static-libs" >> /etc/portage/package.use
#emerge -av app-emulation/wine

# Winetricks
#echo "app-emulation/winetricks ~amd64" >> /etc/portage/package.accept_keywords
#echo "net-libs/webkit-gtk -gles2" >> /etc/portage/package.use
#emerge -av app-emulation/winetricks