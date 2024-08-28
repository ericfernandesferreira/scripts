#!/bin/sh

# Baixando o multilibs slackware64 current
cd /home/backup/slackware
rm -rf multilibs
lftp -c 'open http://www.slackware.com/~alien/multilib/ ; mirror -c -e current'
mv current multilibs
cd multilibs

# Instalando o multilibs slackware64 current
upgradepkg --reinstall --install-new *.t?z
upgradepkg --install-new slackware64-compat32/*-compat32/*.t?z
