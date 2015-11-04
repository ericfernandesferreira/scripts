#!/bin/sh

# Script que instala o Cinnamon
cd /home/backup/app/slackware/cinnamon/install
sudo upgradepkg --reinstall --install-new *.t?z

# Executa o xwmconfig para seleção do Xfce
xwmconfig
