#!/bin/sh

mkdir -p /etc/portage/package.use/apps

# Unrar
emerge -av app-arch/unrar

# p7zip
echo "app-arch/p7zip -wxwidgets" > /etc/portage/package.use/apps/p7zip
emerge -av app-arch/p7zip

# GParted
emerge -av sys-block/gparted

# NeoFetch
emerge -av app-misc/neofetch

# Git
emerge -av dev-vcs/git
emerge -av dev-ruby/git

# Firefox-bin
echo "www-client/firefox-bin -gmp-autoupdate" > /etc/portage/package.use/apps/firefox-bin
emerge -av www-client/firefox-bin

# Google Chrome
echo "www-client/google-chrome -qt5 -qt6" > /etc/portage/package.use/apps/google-chrome
emerge -av www-client/google-chrome

# Discord
emerge -av net-im/discord

# Flatpak
echo "dev-util/ostree archive gnutls grub libmount" > /etc/portage/package.use/apps/ostree
echo "sys-apps/xdg-desktop-portal flatpak" > /etc/portage/package.use/apps/xdg-desktop-portal
emerge -av sys-apps/flatpak sys-apps/xdg-desktop-portal

# Gimp
echo "media-libs/libmypaint gegl" > /etc/portage/package.use/apps/libmypaint
echo "media-gfx/exiv2 webready" > /etc/portage/package.use/apps/exiv2
echo "media-libs/gegl ffmpeg sdl2" > /etc/portage/package.use/apps/gegl
echo "media-libs/libde265 dec265 enc265" > /etc/portage/package.use/apps/libde265
echo "media-libs/libheif x265" > /etc/portage/package.use/apps/libheif
echo "media-gfx/gimp heif xpm" > /etc/portage/package.use/apps/gimp
emerge -av media-gfx/gimp

# qBittorrent
echo "net-p2p/qbittorrent -qt6" > /etc/portage/package.use/apps/qbittorrent
echo "dev-qt/qtwayland compositor" > /etc/portage/package.use/apps/qtwayland
echo "dev-qt/qtnetwork libproxy" > /etc/portage/package.use/apps/qtnetwork
emerge -av net-p2p/qbittorrent

# MPV & Smplayer
echo "media-video/mpv -uchardet archive nvenc openal sdl vdpau" > /etc/portage/package.use/apps/mpv
emerge -av media-video/mpv media-video/smplayer x11-themes/smplayer-themes 

# OBS-Studio
echo "media-video/obs-studio ~amd64" > /etc/portage/package.accept_keywords/obs-studio
echo "dev-qt/qtmultimedia widgets" > /etc/portage/package.use/apps/
echo "media-video/obs-studio -imagemagick" > /etc/portage/package.use/apps/
emerge -av media-video/obs-studio

# WPS Office
echo "app-office/wps-office ~amd64" > /etc/portage/package.accept_keywords/wps-office
emerge -av app-office/wps-office

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

# Wine
#echo "=app-emulation/wine-1.7.50 ~amd64" >> /etc/portage/package.accept_keywords
#echo "app-emulation/wine opencl -gstreamer" >> /etc/portage/package.use
#echo "dev-libs/elfutils static-libs" >> /etc/portage/package.use
#emerge -av app-emulation/wine

# Winetricks
#echo "app-emulation/winetricks ~amd64" >> /etc/portage/package.accept_keywords
#echo "net-libs/webkit-gtk -gles2" >> /etc/portage/package.use
#emerge -av app-emulation/winetricks

# TeamViewer
#echo "dev-qt/qtwebkit multimedia orientation webchannel -gstreamer" >> /etc/portage/package.use
#echo "net-misc/teamviewer ~amd64" >> /etc/portage/package.accept_keywords
#emerge -av net-misc/teamviewer
#rc-update add teamviewerd11 default

