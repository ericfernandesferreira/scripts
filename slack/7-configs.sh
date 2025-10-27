#!/bin/sh

# Arrumando o fuso horário
cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# Arrumando o teclado
cp configs/90-keyboard-layout.conf /etc/X11/xorg.conf.d/

# Ajustando o local do avd manager
# mkdir -p /home/backup/apps/android/android-emulator
# ln -s /home/backup/apps/android/android-emulator /home/eric/.android
