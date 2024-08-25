#!/bin/sh

# Baixando o multilibs 15.0
cd /home/backup/slackware
# rm -rf multilibs
# lftp -c 'open http://www.slackware.com/~alien/multilib/ ; mirror -c -e 15.0'
# mv 15.0 multilibs
cd multilibs

# Instalando o multilibs 15.0
upgradepkg --reinstall --install-new *.t?z
upgradepkg --install-new slackware64-compat32/*-compat32/*.t?z
