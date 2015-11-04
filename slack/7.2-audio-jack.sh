#!/bin/sh

# Script que instala os aplicativos de audio relacionado somente ao Jack
cd /home/backup/app/slackware/audio/install-jack
upgradepkg --reinstall --install-new *.t?z

# Instala o Pre-Amp
# cp /home/backup/app/slackware/audio/source-jack/asound.conf /etc/asound.conf

# Dá as permissões para o Jack iniciar corretamente
setcap cap_ipc_lock,cap_sys_nice=ep /usr/bin/jackd
setcap cap_ipc_lock,cap_sys_nice=ep /usr/bin/qjackctl
