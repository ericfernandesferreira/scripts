#!/bin/sh

# Audacious
echo "media-sound/audacious ~amd64" >> /etc/portage/package.accept_keywords
echo "media-plugins/audacious-plugins ~amd64" >> /etc/portage/package.accept_keywords
emerge -av media-sound/audacious

# Google Chrome
echo "www-client/google-chrome" >> /etc/portage/package.accept_keywords
echo "app-text/ghostscript-gpl cups" >> /etc/portage/package.use
emerge -av www-client/google-chrome

# Unrar
echo "app-arch/unrar ~amd64" >> /etc/portage/package.accept_keywords
emerge -av app-arch/unrar

# p7zip
echo "app-arch/p7zip ~amd64" >> /etc/portage/package.accept_keywords
echo "app-arch/p7zip -wxwidgets" >> /etc/portage/package.use
emerge -av app-arch/p7zip

# Gimp
emerge -av media-gfx/gimp

# Git
emerge -av dev-ruby/git

# GParted
echo "sys-fs/ufsutils ~amd64" >> /etc/portage/package.accept_keywords
echo "sys-block/gparted btrfs f2fs ufs" >> /etc/portage/package.use
echo "sys-block/gparted ~amd64" >> /etc/portage/package.accept_keywords
emerge -av sys-fs/ufsutils sys-block/gparted

# Screenfetch
echo "app-misc/screenfetch ~amd64" >> /etc/portage/package.accept_keywords
emerge -av app-misc/screenfetch

# vlc
echo "media-video/vlc ~amd64" >> /etc/portage/package.accept_keywords
echo "media-video/vlc qt4" >> /etc/portage/package.use
emerge -av media-video/vlc

# Skype
echo "net-im/skype ~amd64" >> /etc/portage/package.accept_keywords
emerge -av net-im/skype

# VirtualBox
echo "app-emulation/virtualbox ~amd64" >> /etc/portage/package.accept_keywords
echo "app-emulation/virtualbox-additions ~amd64" >> /etc/portage/package.accept_keywords
echo "app-emulation/virtualbox-extpack-oracle ~amd64" >> /etc/portage/package.accept_keywords
echo "app-emulation/virtualbox-modules ~amd64" >> /etc/portage/package.accept_keywords
echo "app-emulation/virtualbox qt4" >> /etc/portage/package.use
emerge -av app-emulation/virtualbox
emerge -av app-emulation/virtualbox-additions
emerge -av app-emulation/virtualbox-extpack-oracle

echo modules='"vboxdrv vboxnetflt vboxnetadp"' >> /etc/conf.d/modules
gpasswd -a eric vboxusers

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
