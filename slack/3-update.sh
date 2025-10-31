#!/bin/sh

# Script que atualiza e remove algumas coisas

# Removendo aplicativos
# A
removepkg ed elilo elvis floppy lilo mt-st mtx nvi rpm2tgz
# AP
removepkg amp cdrdao cdrtools dc3dd hplip jed joe jove ksh93
removepkg madplay mc moc most radeontool soma undervolt zsh
# D
removepkg distcc nv-codec-headers
# L
removepkg fluidsynth ffmpeg freecell-solver grantlee kdsoap rttr
removepkg libdiscid libdmtx libfakekey libgnt libkarma
removepkg libnjb libqalculate loudmouth pilot-link qtkeychain quazip
removepkg pipewire wireplumber
# N
removepkg alpine biff+comsat bootp elm epic5 htdig ipw2100-fw
removepkg ipw2200-fw irssi links ncftp netatalk nmap nn
removepkg netkit-ntalk procmail slrn snownews tftp-hpa tin
removepkg ytalk zd1211-firmware
# T
removepkg fig2dev xfig
# X
removepkg OpenCC anthy fcitx5-anthy fcitx5-chinese-addons fcitx5-gtk
removepkg fcitx5-hangul fcitx5-kkc fcitx5-m17n fcitx5-qt fcitx5-sayura
removepkg fcitx5-table-extra fcitx5-table-other fcitx5-unikey fcitx5
removepkg ibus-anthy ibus-hangul ibus-kkc ibus-libpinyin ibus-m17n
removepkg ibus-table ibus-unikey ibus libkkc-data libkkc
removepkg libpinyin motif sazanami-fonts-ttf sinhala_lklug-font-ttf skkdic
removepkg tibmachuni-font-ttf ttf-indic-fonts ttf-tlwg wqy-zenhei-font-ttf
removepkg xinput_calibrator xf86-input-wacom xf86-video-amdgpu
removepkg xf86-video-ati xf86-video-dummy xf86-video-mach64 xf86-video-mga
removepkg xf86-video-neomagic xf86-video-nouveau xf86-video-openchrome
removepkg xf86-video-r128

# Instalando o slackpkg+
installpkg configs/slackpkg+-1.8.2-noarch-1alien.txz
cp configs/slackpkgplus.conf /etc/slackpkg/slackpkgplus.conf

# Atualizando o mirrors do slackpkg (Current)
cp configs/mirrors /etc/slackpkg/mirrors
slackpkg update gpg
slackpkg update
slackpkg upgrade-all
