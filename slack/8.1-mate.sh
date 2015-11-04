#!/bin/sh

# Script que instala o Mate 1.12.0 com suporte ao PulseAudio
cd /home/backup/app/slackware/mate/install
sudo upgradepkg --reinstall --install-new deps/*.t?z
sudo upgradepkg --reinstall --install-new base/*.t?z
sudo upgradepkg --reinstall --install-new extra/*.t?z

# Executa o xwmconfig para seleção do Mate
xwmconfig
