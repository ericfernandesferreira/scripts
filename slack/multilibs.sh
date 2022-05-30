#!/bin/sh

# Instalando o multilibs
cd /home/backup/slackware/multilibs
upgradepkg --reinstall --install-new *.t?z
upgradepkg --install-new slackware64-compat32/*-compat32/*.t?z