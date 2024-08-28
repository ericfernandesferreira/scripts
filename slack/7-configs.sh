#!/bin/sh

# Arrumando o fuso horário
cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# Arrumando o teclado
cp configs/90-keyboard-layout.conf /etc/X11/xorg.conf.d/

# Arrumando o xorg para nvidia prime
cp configs/prime-run /usr/bin/
cp configs/20-nvidia-prime.conf /etc/X11/xorg.conf.d/
