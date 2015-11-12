#!/bin/sh

# Instalando o xorg
cd /usr/ports/x11/xorg
make install clean

# Configurações adicionais
echo hald_enable='"YES"' >> /etc/rc.conf
echo dbus_enable='"YES"' >> /etc/rc.conf