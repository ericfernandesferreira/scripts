#!/bin/sh

# Script que instala os aplicativos básicos
# Audacious
cd /home/backup/app/slackware/slackbuilds/audacious/audacious-pulse/
sudo installpkg *.t?z
cd /home/backup/app/slackware/slackbuilds/audacious/audacious-pulse/audacious-plugins/
sudo installpkg *.t?z

# Emacs
cd /home/backup/app/slackware/slackbuilds/emacs/need_install_first/imagemagick/
sudo installpkg *.t?z
cd /home/backup/app/slackware/slackbuilds/emacs/
sudo installpkg *.t?z

# f2fs-tools
cd /home/backup/app/slackware/slackbuilds/gparted/file_system/f2fs-tools/
sudo installpkg *.t?z

# nilfs-utils
cd /home/backup/app/slackware/slackbuilds/gparted/file_system/nilfs-utils/
sudo installpkg *.t?z

# reiser4progs
cd /home/backup/app/slackware/slackbuilds/gparted/file_system/reiser4progs/need_install_first/libaal/
sudo installpkg *.t?z
cd /home/backup/app/slackware/slackbuilds/gparted/file_system/reiser4progs/
sudo installpkg *.t?z

# Gimp
cd /home/backup/app/slackware/slackbuilds/gimp/
sudo installpkg *.t?z

# Google Chrome
cd /home/backup/app/slackware/slackbuilds/google-chrome/
sudo installpkg *.t?z

# GParted
cd /home/backup/app/slackware/slackbuilds/gparted/
sudo installpkg *.t?z

# Hard Info
# cd /home/backup/app/slackware/hardinfo
# sudo installpkg *.t?z

# Java
cd /home/backup/app/slackware/slackbuilds/java/
sudo installpkg *.t?z

# LibreOffice
cd /home/backup/app/slackware/slackbuilds/libreoffice/
sudo installpkg *.t?z

# Mediainfo
cd /home/backup/app/slackware/slackbuilds/mediainfo/need_install_first/1.1-libzen/
sudo installpkg *.t?z
cd /home/backup/app/slackware/slackbuilds/mediainfo/need_install_first/1.2-libmediainfo/
sudo installpkg *.t?z
cd /home/backup/app/slackware/slackbuilds/mediainfo/need_install_first/1.3-wxPython/
sudo installpkg *.t?z
cd /home/backup/app/slackware/slackbuilds/mediainfo/
sudo installpkg *.t?z

# 7zip
cd /home/backup/app/slackware/slackbuilds/p7zip/
sudo installpkg *.t?z

# qBitTorrent
cd /home/backup/app/slackware/slackbuilds/qbittorrent/need_install_first/1-GeoIP/
sudo installpkg *.t?z
cd /home/backup/app/slackware/slackbuilds/qbittorrent/need_install_first/2-libtorrent/
sudo installpkg *.t?z
cd /home/backup/app/slackware/slackbuilds/qbittorrent/
sudo installpkg *.t?z

# ScreenFetch
cd /home/backup/app/slackware/slackbuilds/screenfetch/
sudo installpkg *.t?z

# Skype
cd /home/backup/app/slackware/slackbuilds/skype
sudo installpkg *.t?z

# Spek
/home/backup/app/slackware/slackbuilds/slackbuilds.org/spek/
sudo installpkg *.t?z

# Steam
cd /home/backup/app/slackware/slackbuilds/steam/
sudo installpkg *.t?z

# Unrar
cd /home/backup/app/slackware/slackbuilds/unrar/
sudo installpkg *.t?z
