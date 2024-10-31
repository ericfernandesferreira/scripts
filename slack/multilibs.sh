#!/bin/sh

# Baixando multilibs para o Slackware64 Current
cd /home/backup/slackware
rm -rf multilibs-current
lftp -c 'open http://slackware.nl/people/alien/multilib/ ; mirror -c -e current'
mv current multilibs-current
cd multilibs-current

# Instalando multilibs para o Slackware64 Current
#sudo upgradepkg --install-new slackware64-compat32/*-compat32/*.t?z
