#!/bin/sh

# Instalando o xorg
cd /usr/ports/x11/xorg
make config-recursive
make install clean

# Adicionando usuário ao grupo video
pw groupmod video -m eric || pw groupmod wheel -m eric

# Configurações adicionais
echo hald_enable='"YES"' >> /etc/rc.conf
echo dbus_enable='"YES"' >> /etc/rc.conf