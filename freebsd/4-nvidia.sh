#!/bin/sh

# Instalando drivers da Nvidia
kdload linux
cd /usr/ports/x11/nvidia-drivers
make config
make install clean

cd /usr/ports/x11/nvidia-xconfig
make install clean

cd /usr/ports/x11/nvidia-settings
make install clean

# Configurações finais
nvidia-xconfig
cp /root/xorg-conf.new /etc/X11/xorg.conf
echo linux_enable='"YES"' >> /etc/rc.conf
echo kld_list='"nvidia"' >> /etc/rc.conf
echo nvidia_load="YES" >> /etc/rc.conf