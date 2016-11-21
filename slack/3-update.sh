#!/bin/sh

# Script que atualiza e remove algumas coisas

# Removendo aplicativos
# A
removepkg floppy
# AP
removepkg hplip jed joe jove radeontool
# N
removepkg alpine biff+comsat elm ipw2100-fw ipw2200-fw netatalk nmap nn
removepkg slrn snownews tin trn wireless-tools wpa_supplicant
removepkg zd1211-firmware ytalk
# X
removepkg xf86-video-voodoo xf86-video-ati xf86-video-r128
removepkg xf86-video-s3 xf86-video-s3virge xf86-video-sis
removepkg ttf-indic-fonts

# Atualizando o mirrors do slackpkg (Current)
cp mirrors /etc/slackpkg/mirrors
slackpkg update gpg
slackpkg update
slackpkg upgrade-all
