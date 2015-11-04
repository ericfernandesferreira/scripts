#!/bin/sh

# Script que instala Multilibs Current, completo

cd /home/backup/app/slackware/multilibs-current

upgradepkg --reinstall --install-new *.t?z

upgradepkg --install-new slackware64-compat32/*-compat32/*.t?z

reboot
