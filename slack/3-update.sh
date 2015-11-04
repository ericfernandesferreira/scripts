#!/bin/sh

# Script que atualiza e remove algumas coisas

# Removendo aplicativos
# A
removepkg floppy
# AP
removepkg a2ps cups cups-filters foomatic-filters hplip
removepkg gutenprint jed joe jove mariadb radeontool sox
# D
removepkg distcc
# L
removepkg qt-gstreamer
# N
removepkg ModemManager alpine biff+comsat bluez-firmware bluez
removepkg bluez-hcidump elm ipw2100-fw ipw2200-fw netatalk nmap nn
removepkg slrn snownews tin trn wireless-tools wpa_supplicant
removepkg zd1211-firmware ytalk
# X
removepkg anthy libva-intel-driver scim-anthy xf86-video-voodoo
removepkg xf86-video-ati xf86-video-cirrus xf86-video-r128
removepkg xf86-video-s3 xf86-video-s3virge xf86-video-savage
removepkg xf86-video-sis xf86-video-sisusb ttf-indic-fonts

# Atualizando o mirrors do slackpkg (Current)
cp mirrors-current /etc/slackpkg/mirrors
slackpkg update gpg
slackpkg update
slackpkg upgrade-all
