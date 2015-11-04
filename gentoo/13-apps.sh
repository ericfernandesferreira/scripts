#!/bin/sh

# Audacious
echo "media-sound/audacious ~amd64" >> /etc/portage/package.accept_keywords
echo "media-plugins/audacious-plugins ~amd64" >> /etc/portage/package.accept_keywords
emerge -av media-sound/audacious

# Google Chrome Beta
echo "www-client/google-chrome-beta" >> /etc/portage/package.accept_keywords
echo "app-text/ghostscript-gpl cups" >> /etc/portage/package.use
emerge -av www-client/google-chrome-beta

# Unrar
echo "app-arch/unrar ~amd64" >> /etc/portage/package.accept_keywords
emerge -av app-arch/unrar

# p7zip
echo "app-arch/p7zip -wxwidgets" >> /etc/portage/package.use
emerge -av app-arch/p7zip

# Gimp
emerge -av media-gfx/gimp

# GParted
echo "sys-block/gparted btrfs f2fs" >> /etc/portage/package.use
emerge -av sys-block/gparted

# Screenfetch
echo "app-misc/screenfetch ~amd64" >> /etc/portage/package.accept_keywords
emerge -av app-misc/screenfetch

# Skype
echo "net-im/skype ~amd64" >> /etc/portage/package.accept_keywords
emerge -av net-im/skype

# qBittorrent
echo "net-p2p/qbittorrent qt4" >> /etc/portage/package.use
echo "dev-qt/qtlockedfile qt4" >> /etc/portage/package.use
echo "dev-qt/qtsingleapplication qt4" >> /etc/portage/package.use
echo "net-p2p/qbittorrent ~amd64" >> /etc/portage/package.accept_keywords
echo "net-libs/rb_libtorrent ~amd64" >> /etc/portage/package.accept_keywords
emerge -av net-p2p/qbittorrent

# Dolphin
echo "=games-emulation/dolphin-9999 **" >> /etc/portage/package.accept_keywords
echo "net-libs/mbedtls ~amd64" >> /etc/portage/package.accept_keywords
echo "net-libs/enet ~amd64" >> /etc/portage/package.accept_keywords
echo "media-libs/libsfml ~amd64" >> /etc/portage/package.accept_keywords
echo "media-libs/libsdl2 haptic" >> /etc/portage/package.use
echo "net-libs/polarssl havege" >> /etc/portage/package.use
emerge -av games-emulation/dolphin
gpasswd -a eric games
for x in games ; do gpasswd -a eric $x ; done

# Wine
#echo "=app-emulation/wine-1.7.50 ~amd64" >> /etc/portage/package.accept_keywords
#echo "app-emulation/wine opencl -gstreamer" >> /etc/portage/package.use
#echo "dev-libs/elfutils static-libs" >> /etc/portage/package.use
#emerge -av app-emulation/wine

# Winetricks
#echo "app-emulation/winetricks ~amd64" >> /etc/portage/package.accept_keywords
#echo "net-libs/webkit-gtk -gles2" >> /etc/portage/package.use
#emerge -av app-emulation/winetricks
