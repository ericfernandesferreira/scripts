#!/bin/sh

# Script que atualiza e remove algumas coisas

# Removendo aplicativos
# A
removepkg ed elilo elvis floppy lilo mt-st mtx nvi rpm2tgz
# AP
removepkg amp dc3dd hplip jed joe jove ksh93 madplay mc moc
removepkg most radeontool soma undervolt zsh
# L
removepkg QtAV fluidsynth ffmpeg freecell-solver grantlee kdsoap rttr
removepkg libdbusmenu-qt libdiscid libdmtx libfakekey libgnt libkarma
removepkg libnjb libqalculate loudmouth pilot-link qtkeychain quazip
removepkg gst-plugins-bad-free
# N
removepkg alpine biff+comsat bootp elm epic5 htdig ipw2100-fw
removepkg ipw2200-fw irssi links ncftp netatalk nmap nn
removepkg netkit-ntalk procmail slrn snownews tftp-hpa tin
removepkg ytalk zd1211-firmware
# T
removepkg fig2dev xfig
# X
removepkg OpenCC anthy fcitx-anthy fcitx-configtool fcitx-hangul
removepkg fcitx-kkc fcitx-libpinyin fcitx-m17n fcitx-qt5 fcitx-sayura
removepkg fcitx-table-extra fcitx-table-other fcitx-unikey fcitx
removepkg ibus-anthy ibus-hangul ibus-kkc ibus-libpinyin ibus-m17n
removepkg ibus-table ibus-unikey ibus libkkc-data libkkc libpinyin
removepkg motif sazanami-fonts-ttf sinhala_lklug-font-ttf skkdic
removepkg tibmachuni-font-ttf ttf-indic-fonts ttf-tlwg wqy-zenhei-font-ttf
removepkg xf86-input-acecad xf86-input-aiptek xf86-input-void
removepkg xf86-video-amdgpu xf86-video-apm xf86-video-ark xf86-video-ast
removepkg xf86-video-ati xf86-video-cirrus xf86-video-dummy xf86-video-geode
removepkg xf86-video-glint xf86-video-i128 xf86-video-i740 xf86-video-mach64
removepkg xf86-video-mga xf86-video-neomagic xf86-video-nouveau xf86-video-nv
removepkg xf86-video-omap xf86-video-openchrome xf86-video-r128
removepkg xf86-video-rendition xf86-video-s3 xf86-video-s3virge
removepkg xf86-video-savage xf86-video-siliconmotion xf86-video-sis
removepkg xf86-video-sisusb xf86-video-tdfx xf86-video-tga xf86-video-trident
removepkg xf86-video-tseng xf86-video-voodoo xf86-video-xgi xf86-video-xgixp

# Instalando o slackpkg+
installpkg configs/slackpkg+-1.8.0-noarch-7mt.txz

# Atualizando o mirrors do slackpkg (Current)
cp configs/mirrors /etc/slackpkg/mirrors
slackpkg update gpg
slackpkg update
slackpkg upgrade-all
