#!/bin/sh

# libao
echo default_driver=pulse > /etc/libao.conf

# openal
mkdir -p /etc/openal
echo "drivers = pulse" > /etc/openal/alsoft.conf

# gstreamer
echo "Digite em modo usuário"
echo "gconftool-2 -t string --set /system/gstreamer/0.10/default/audiosink pulsesink"
echo "gconftool-2 -t string --set /system/gstreamer/0.10/default/audiosrc pulsesrc"