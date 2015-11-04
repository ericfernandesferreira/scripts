#!/bin/sh

# Script que instala os aplicativos de audio relacionado somente ao Pulseaudio
cd /home/backup/app/slackware/audio/install
upgradepkg --reinstall --install-new *.t?z

# Pacotes Multilibs
cd /home/backup/app/slackware/audio/install/compat32
upgradepkg --install-new *.t?z

# Cria usuário e grupo do pulseaudio
groupadd -g 216 pulse
useradd -u 216 -g pulse -d /var/run/pulse -m pulse

# Configurações finais
echo default_driver=pulse > /etc/libao.conf

mkdir -p /etc/openal
echo "drivers = pulse" > /etc/openal/alsoft.conf

# gstreamer
echo "Digite em modo usuário"
echo "gconftool-2 -t string --set /system/gstreamer/0.10/default/audiosink pulsesink"
echo "gconftool-2 -t string --set /system/gstreamer/0.10/default/audiosrc pulsesrc"
