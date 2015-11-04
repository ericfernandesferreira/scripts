#!/bin/sh

# Script que instala o XFCE 4.12 com suporte ao PulseAudio
cd /home/backup/app/slackware/xfce/install
sudo upgradepkg --reinstall --install-new *.t?z

# Executa o xwmconfig para seleção do Xfce
xwmconfig
