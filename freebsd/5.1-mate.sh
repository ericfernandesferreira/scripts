#!/bin/sh

# Instalando o Mate
cd /usr/ports/x11/mate
make install clean

# Ajustando o xinitrc
echo "exec mate-session" >> ~/.xinitrc
echo "exec mate-session" >> /home/eric/.xinitrc