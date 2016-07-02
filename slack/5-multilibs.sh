#!/bin/sh

# Script que instala Multilibs parcial
cd /home/backup/app/slackware/multilibs

upgradepkg --reinstall --install-new *.t?z
# upgradepkg --reinstall --install-new slackware64-compat32/*-compat32/*.t?z

reboot
