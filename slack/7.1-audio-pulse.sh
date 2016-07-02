#!/bin/sh

# Script que instala os aplicativos de audio relacionado somente ao Pulseaudio
cd /home/backup/app/slackware/audio/install
upgradepkg --reinstall --install-new *.t?z

# Pacotes Multilibs
cd /home/backup/app/slackware/audio/install/compat32
upgradepkg --install-new *.t?z

# Configurações finais
echo default_driver=pulse > /etc/libao.conf

mkdir -p /etc/openal
echo "drivers = pulse" > /etc/openal/alsoft.conf
