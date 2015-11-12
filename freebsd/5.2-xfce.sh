#!/bin/sh

# Instalando o Xfce4
cd /usr/ports/x11-wm/xfce4
make install clean

# Ajustando o xinitrc
echo "exec /usr/local/bin/startxfce4" > ~/.xinitrc
echo "exec /usr/local/bin/startxfce4" > /home/eric.xinitrc