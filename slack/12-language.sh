#!/bin/sh

# Arrumando o Timezone
cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# Arrumando o teclado
cp 90-keyboard-layout.conf /etc/X11/xorg.conf.d/

# Script que adiciona a lingua portuguesa
echo "export LANG=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
echo "LANG=pt_BR.utf8" >> /home/eric/.profile

echo "setenv LANG pt_BR.UTF-8" >> /etc/profile.d/lang.csh
echo "LANG=pt_BR.utf8" >> /home/eric/.cshrc

sed -i '/^export LANG=en_US/ s/^/#/1' /etc/profile.d/lang.sh
sed -i '/^setenv LANG en_US/ s/^/#/1' /etc/profile.d/lang.csh

reboot
